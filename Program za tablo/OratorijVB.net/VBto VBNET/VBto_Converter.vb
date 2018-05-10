' This is a part of the VBto Converter (www.vbto.net). Copyright (C) 2005-2012 StressSoft Company Ltd. All rights reserved.


Module VBto_Converter

    '======================================================================
    Public Enum ObjectType As Short
        objectPrint
        objectPSet
        objectLine
        objectRectangle
        objectCircle
        objectArc
        objectNewPage
    End Enum

    Class VBto_Converter_Printer_Object
        Public type As ObjectType
        Public S As String
        Public x1, y1, x2, y2, R As Single
        Public DrawWidth, DrawStyle, FillStyle As Integer
        Public col, FillColor As Color
        Public sFont As Font

        Sub New(ByVal type_ As ObjectType)
            type = type_
            col = Color.Black
        End Sub

        Sub Out(ByVal gr As System.Drawing.Graphics)
            'ms-help://MS.VSCC.v80/MS.MSDN.v80/MS.VisualStudio.v80.en/dv_vbvers/html/24cd2d55-ebf1-42d6-b755-00e9001f1cb8.htm
            x1 = VB6.TwipsToPixelsX(x1)
            y1 = VB6.TwipsToPixelsY(y1)

            Select Case type
                Case ObjectType.objectPrint
                    gr.DrawString(S, sFont, New SolidBrush(col), x1, y1)

                Case ObjectType.objectPSet
                    gr.DrawEllipse(New Pen(col, 1), x1, y1, 1, 1)

                Case ObjectType.objectLine
                    x2 = VB6.TwipsToPixelsX(x2)
                    y2 = VB6.TwipsToPixelsY(y2)
                    Dim P As Pen = New Pen(col, DrawWidth)
                    P.DashStyle = DrawStyle
                    gr.DrawLine(P, x1, y1, x2, y2)

                Case ObjectType.objectRectangle
                    x2 = VB6.TwipsToPixelsX(x2)
                    y2 = VB6.TwipsToPixelsY(y2)
                    Dim P As Pen = New Pen(col, DrawWidth)
                    P.DashStyle = DrawStyle
                    gr.DrawRectangle(P, x1, y1, x2 - x1, y2 - y1)

                Case ObjectType.objectCircle
                    Dim Rx As Single = VB6.TwipsToPixelsX(R)
                    Dim Ry As Single = VB6.TwipsToPixelsY(R)
                    If FillStyle <> 1 Then
                        gr.FillEllipse(New SolidBrush(FillColor), x1 - Rx, y1 - Ry, 2 * Rx, 2 * Ry)
                    End If
                    Dim P As Pen = New Pen(col, DrawWidth)
                    P.DashStyle = DrawStyle
                    gr.DrawEllipse(P, x1 - Rx, y1 - Ry, 2 * Rx, 2 * Ry)

                Case ObjectType.objectArc
                    Dim Rx As Single = VB6.TwipsToPixelsX(R)
                    Dim Ry As Single = VB6.TwipsToPixelsY(R)
                    Dim startAngle As Single = x2 / Math.PI * 180
                    Dim sweepAngle As Single = y2 / Math.PI * 180 - startAngle
                    Dim P As Pen = New Pen(col, DrawWidth)
                    P.DashStyle = DrawStyle
                    gr.DrawArc(P, x1 - Rx, y1 - Ry, 2 * Rx, 2 * Ry, -startAngle, -sweepAngle)

            End Select

        End Sub

    End Class

    '======================================================================
    Class VBto_Converter_Printer
        Public CurrentX, CurrentY As Single
        Public nPage, DrawStyle, DrawWidth, FillStyle As Integer
        Public FillColor As Color

        Private sFont As Font

        Dim WithEvents PrintDocumentX As System.Drawing.Printing.PrintDocument
        Dim PrinterObjects As System.Collections.ArrayList

        Sub New()
            CurrentX = 0
            CurrentY = 0
            nPage = 1
            DrawStyle = 0
            DrawWidth = 1
            FillStyle = 1
            FillColor = Color.Black

            sFont = New Font("Arial", 8, FontStyle.Regular)

            PrintDocumentX = New System.Drawing.Printing.PrintDocument
            AddHandler PrintDocumentX.PrintPage, AddressOf Me.PrintDocumentX_PrintPage

            PrinterObjects = New System.Collections.ArrayList
        End Sub

        Public Property FontName() As String
            Get
                FontName = sFont.Name
            End Get
            Set(ByVal value As String)
                sFont = New Font(value, sFont.Size, sFont.Style)
            End Set
        End Property

        Public Property FontSize() As Single
            Get
                FontSize = sFont.Size
            End Get
            Set(ByVal value As Single)
                sFont = New Font(sFont.Name, value, sFont.Style)
            End Set
        End Property

        Public Property FontBold() As Boolean
            Get
                FontBold = sFont.Bold
            End Get
            Set(ByVal value As Boolean)
                Dim fs As FontStyle = IIf(value, sFont.Style Or FontStyle.Bold, sFont.Style And Not FontStyle.Bold)
                sFont = New Font(sFont, fs)
            End Set
        End Property

        Public Property FontItalic() As Boolean
            Get
                FontItalic = sFont.Italic
            End Get
            Set(ByVal value As Boolean)
                Dim fs As FontStyle = IIf(value, sFont.Style Or FontStyle.Italic, sFont.Style And Not FontStyle.Italic)
                sFont = New Font(sFont, fs)
            End Set
        End Property


        Sub Print(Optional ByVal S As String = "")
            Dim ob As VBto_Converter_Printer_Object = New VBto_Converter_Printer_Object(ObjectType.objectPrint)
            ob.x1 = CurrentX
            ob.y1 = CurrentY
            ob.S = S
            ob.sFont = sFont
            PrinterObjects.Add(ob)
            CurrentX = 0
            Dim h As Integer = sFont.Height
            If h < 0 Then h = -h
            CurrentY += VB6.PixelsToTwipsY(h)
        End Sub

        Sub PSet(ByVal x As Integer, ByVal y As Integer, ByVal col As Color)
            Dim ob As VBto_Converter_Printer_Object = New VBto_Converter_Printer_Object(ObjectType.objectPSet)
            ob.x1 = x
            ob.y1 = y
            ob.col = col
            PrinterObjects.Add(ob)
            CurrentX = x
            CurrentY = y
        End Sub
        Sub PSet(ByVal x As Integer, ByVal y As Integer)
            PSet(x, y, Color.Black)
        End Sub

        Sub Line(ByVal x1 As Integer, ByVal y1 As Integer, ByVal x2 As Integer, ByVal y2 As Integer, ByVal col As Color, Optional ByVal type_ As ObjectType = ObjectType.objectLine)
            Dim ob As VBto_Converter_Printer_Object = New VBto_Converter_Printer_Object(type_)
            ob.x1 = x1
            ob.y1 = y1
            ob.x2 = x2
            ob.y2 = y2
            ob.col = col
            ob.DrawWidth = DrawWidth
            ob.DrawStyle = DrawStyle
            ob.FillStyle = FillStyle
            ob.FillColor = FillColor
            PrinterObjects.Add(ob)
            CurrentX = x2
            CurrentY = y2
        End Sub
        Sub Line(ByVal x1 As Integer, ByVal y1 As Integer, ByVal x2 As Integer, ByVal y2 As Integer)
            Line(x1, y1, x2, y2, Color.Black)
        End Sub
        Sub LineTo(ByVal x2 As Integer, ByVal y2 As Integer, ByVal col As Color)
            Line(CurrentX, CurrentY, x2, y2, col)
        End Sub
        Sub LineTo(ByVal x2 As Integer, ByVal y2 As Integer)
            LineTo(x2, y2, Color.Black)
        End Sub
        Sub Rectangle(ByVal x1 As Integer, ByVal y1 As Integer, ByVal x2 As Integer, ByVal y2 As Integer, ByVal col As Color)
            Line(x1, y1, x2, y2, col, ObjectType.objectRectangle)
        End Sub
        Sub Rectangle(ByVal x1 As Integer, ByVal y1 As Integer, ByVal x2 As Integer, ByVal y2 As Integer)
            Rectangle(x1, y1, x2, y2, Color.Black)
        End Sub

        Sub Circle(ByVal xC As Integer, ByVal yC As Integer, ByVal R As Integer, ByVal col As Color)
            Dim ob As VBto_Converter_Printer_Object = New VBto_Converter_Printer_Object(ObjectType.objectCircle)
            ob.x1 = xC
            ob.y1 = yC
            ob.R = R
            ob.col = col
            ob.DrawWidth = DrawWidth
            ob.DrawStyle = DrawStyle
            ob.FillStyle = FillStyle
            ob.FillColor = FillColor
            PrinterObjects.Add(ob)
        End Sub
        Sub Circle(ByVal xC As Integer, ByVal yC As Integer, ByVal R As Integer)
            Circle(xC, yC, R, Color.Black)
        End Sub

        Sub Arc(ByVal xC As Integer, ByVal yC As Integer, ByVal R As Integer, ByVal fiStart As Single, ByVal fiEnd As Single, ByVal col As Color)
            Dim ob As VBto_Converter_Printer_Object = New VBto_Converter_Printer_Object(ObjectType.objectArc)
            ob.x1 = xC
            ob.y1 = yC
            ob.R = R
            ob.x2 = fiStart
            ob.y2 = fiEnd
            ob.col = col
            PrinterObjects.Add(ob)
        End Sub
        Sub Arc(ByVal xC As Integer, ByVal yC As Integer, ByVal R As Integer, ByVal fiStart As Single, ByVal fiEnd As Single)
            Arc(xC, yC, R, fiStart, fiEnd, Color.Black)
        End Sub

        Public ReadOnly Property Page() As Long
            Get
                Page = nPage
            End Get
        End Property

        Sub NewPage()
            CurrentX = 0
            CurrentY = 0
            nPage += 1
            PrinterObjects.Add(New VBto_Converter_Printer_Object(ObjectType.objectNewPage))
        End Sub

        Sub EndDoc()
            PrintDocumentX.Print()
            CurrentX = 0
            CurrentY = 0
            nPage = 1
        End Sub

        Function OutObjects(ByVal gr As System.Drawing.Graphics) As Boolean
            Dim i As Long
            Dim indLastObject As Long = PrinterObjects.Count - 1
            For i = 0 To indLastObject
                Dim ob As VBto_Converter_Printer_Object = PrinterObjects.Item(i)
                If ob.type = ObjectType.objectNewPage Then
                    PrinterObjects.RemoveRange(0, i + 1)
                    Return True
                End If
                ob.Out(gr)
            Next
            PrinterObjects.Clear()
            Return False
        End Function

        Private Sub PrintDocumentX_PrintPage(ByVal sender As System.Object, ByVal e As System.Drawing.Printing.PrintPageEventArgs) ' Handles PrintDocumentX.PrintPage
            e.HasMorePages = OutObjects(e.Graphics)
        End Sub

    End Class

    Public Printer As New VBto_Converter_Printer


	Friend pDAODBEngine As New DAO.DBEngine

End Module	' VBto_Converter
