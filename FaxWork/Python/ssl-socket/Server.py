#coding:UTF-8
import struct
import socket
from xml.dom.minidom import Document
import xml.dom.minidom
import ssl
import sys

if len(sys.argv) != 6:
    print("Primer uporabe: python Server.py 127.0.0.1 1234 certs/clients.pem certs/server/server.pem certs/server/serverkey.pem")
    exit()

ipBind = sys.argv[1]
port = int(sys.argv[2])
clinetList = sys.argv[3]
serverCert = sys.argv[4]
serverKey = sys.argv[5]

racuni = {"0123456789-1":{"Ime":"Rdeča","Priimek":"Kapica","St-Rac":"0123456789-1","Pin":"1337","Stanje":0},"0123456789-2":{"Ime":"Babica","Priimek":"Kapica","St-Rac":"0123456789-2","Pin":"1338","Stanje":10520}}

class Server:
    # maksimalna dolžina XMLja je 16 bit ushort (2 Bytes) = max. 64KB dolgo sporocilo
    HEADER_LENGTH = 2
    
    def __init__(self, server_address):
        self.server_address = server_address
    
    def receive_fixed_length_msg(self, sock, msglen):
        msg = b''
        while len(msg) < msglen:
            chunk = sock.recv(msglen - len(msg))
            if chunk == b'':
                raise RuntimeError("socket connection broken")
            msg = msg + chunk
        return msg
    
    def receive_msg(self, sock):
        msg = None
        # preberi glavo sporocila (v prvih 2 bytih je dolzina sporocila)
        header = self.receive_fixed_length_msg(sock, self.HEADER_LENGTH)
        # pretvori v int
        msg_len = struct.unpack("!H", header)[0]
        # preberi XML sporocilo, ce je z glavo vse OK
        if msg_len > 0: 
            msg = self.receive_fixed_length_msg(sock, msg_len)
            msg = msg.decode("utf-8")
        return msg
    
    def send_msg(self, sock, msg):
        #pretvori msg v niz bytov, uporabi UTF-8 kodno tabelo
        #encoded_msg = msg.encode("utf-8")
        encoded_msg = msg
        # ustvari glavo v prvih 2 bytih je dolzina sporocila (HEADER_LENGTH)
        #  metoda pack "!H" : !=network byte order, H=unsigned short
        header = struct.pack("!H", len(encoded_msg))
        msg = header + encoded_msg
        sock.sendall(msg);

    def kreirajDokumentStanje(self,slo):
        impl = xml.dom.minidom.getDOMImplementation()

        doc = impl.createDocument(None, 'Stanje-Odgovor', None)
        odgovor = doc.documentElement

        status = doc.createElement('Ime')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["Ime"]))

        status = doc.createElement('Priimek')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["Priimek"]))

        status = doc.createElement('št-računa')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["St-Rac"]))

        status = doc.createElement('pin')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode("PRAVILEN"))

        status = doc.createElement('Stanje')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(str(racuni[slo["St-Rac"]]["Stanje"])))

        xml_doc = doc.toxml("UTF-8")
        return xml_doc

    def kreirajDokumentDvig(self, slo):
        impl = xml.dom.minidom.getDOMImplementation()

        doc = impl.createDocument(None, 'Dvog-Odgovor', None)
        odgovor = doc.documentElement

        status = doc.createElement('Ime')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["Ime"]))

        status = doc.createElement('Priimek')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["Priimek"]))

        status = doc.createElement('št-računa')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["St-Rac"]))

        status = doc.createElement('pin')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode("PRAVILEN"))

        status = doc.createElement('Želena-Vsota')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["ZelenaVstota"]))

        status = doc.createElement('Dvig-Mogoc')
        odgovor.appendChild(status)
        if int(slo["ZelenaVstota"]) > int(racuni[slo["St-Rac"]]["Stanje"]):
            status.appendChild(doc.createTextNode("NE"))
        else:
            status.appendChild(doc.createTextNode("DA"))
            racuni[slo["St-Rac"]]["Stanje"] -= int(slo["ZelenaVstota"])

        xml_doc = doc.toxml("UTF-8")
        return xml_doc

    def kreirajDokumentPolog(self, slo):
        impl = xml.dom.minidom.getDOMImplementation()

        doc = impl.createDocument(None, 'Polog-Odgovor', None)
        odgovor = doc.documentElement

        status = doc.createElement('Ime')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["Ime"]))

        status = doc.createElement('Priimek')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["Priimek"]))

        status = doc.createElement('št-računa')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["St-Rac"]))

        status = doc.createElement('pin')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode("PRAVILEN"))

        status = doc.createElement('položena-vsota')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["PolozenaVsota"]))

        status = doc.createElement('Novo-Stanje')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(str(racuni[slo["St-Rac"]]["Stanje"]+int(slo["PolozenaVsota"]))))

        racuni[slo["St-Rac"]]["Stanje"] += int(slo["PolozenaVsota"])
        xml_doc = doc.toxml("UTF-8")
        return xml_doc

    def kreirajDokumentNapaka(self, slo, errorType):
        impl = xml.dom.minidom.getDOMImplementation()

        doc = impl.createDocument(None, 'Napaka', None)
        odgovor = doc.documentElement

        status = doc.createElement('Ime')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["Ime"]))

        status = doc.createElement('Priimek')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["Priimek"]))

        status = doc.createElement('št-računa')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(slo["St-Rac"]))

        status = doc.createElement('pin')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode("PRAVILEN"))

        status = doc.createElement('Stanje')
        odgovor.appendChild(status)
        status.appendChild(doc.createTextNode(errorType))

        xml_doc = doc.toxml("UTF-8")
        return xml_doc

    def preberiXML(self, dat):
        doc = dat
        strac = doc.getElementsByTagName("št-računa")[0].firstChild.nodeValue
        pin = doc.getElementsByTagName("pin")[0].firstChild.nodeValue
        #dodat preverjanje pina else error xml
        if doc.documentElement.tagName == "dvig":
            zelenavsota = doc.getElementsByTagName("želena-vsota")[0].firstChild.nodeValue
            return {"St-Rac":strac,"Pin":pin,"ZelenaVstota":zelenavsota,"Status":"Dvig"}

        if  doc.documentElement.tagName == "polog":
            polozenavsota = doc.getElementsByTagName("položena-vsota")[0].firstChild.nodeValue
            return {"St-Rac":strac,"Pin":pin,"PolozenaVsota":polozenavsota,"Status":"Polog"}

        return {"St-Rac":strac,"Pin":pin,"Status":"Stanje"}


    def setup_SSL_context(self):
        #uporabi samo TLS, ne SSL
        context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
        # certifikat je obvezen
        context.verify_mode = ssl.CERT_REQUIRED
        #nalozi svoje certifikate
        context.load_cert_chain(certfile=serverCert, keyfile=serverKey)
        # nalozi certifikate CAjev, ki jim zaupas (samopodp. cert.=svoja CA!)
        context.load_verify_locations(clinetList)
        # nastavi SSL CipherSuites (nacin kriptiranja)
        context.set_ciphers('AES128-SHA') #uporabljamo TLS_RSA_WITH_AES_128_CBC_SHA

        return context

    def serve_forever(self):

        my_ssl_ctx = self.setup_SSL_context()

        ss = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        ss.bind(self.server_address)
        # max st hkratnih uporabnikov
        ss.listen(1)
        
        print("Zaganjam streznik...")
        
        #poslusaj v zanki, dokler se odjemalec ne priklopi
        while 1:
            try:
                conn, addr = ss.accept()
                conn = my_ssl_ctx.wrap_socket(conn, server_side=True)
 
                print('Connected by', addr)
                
                #poslusaj v zanki, dokler odjemalec ne zapre vtica
                while 1:
                    try:
                        data = self.receive_msg(conn)
                        if not data: break

                        parser = xml.dom.minidom.parseString(data)

                        s =  self.preberiXML(parser)
                        print("Operacija "+str(s))

                        user = ""
                        #ime uporabnika dobimo iz certifikata
                        cert = conn.getpeercert()
                        for sub in cert['subject']:
                            for key, value in sub:
                                # v commonName je ime uporabnika
                                if key == 'commonName':
                                    user = value

                        s['Ime'] = racuni[s["St-Rac"]]["Ime"]
                        s['Priimek'] = racuni[s["St-Rac"]]["Priimek"]

                        if user != s['St-Rac']:
                            print("Napaka certifikata uporabnika "+str(s)+" ali "+user)
                            self.send_msg(conn,self.kreirajDokumentNapaka(s,"Napaka certifikata"))
                            continue

                        if s['Pin'] != racuni[s['St-Rac']]['Pin']:
                            print("Napaka pin uporabnika "+str(s)+" ali "+user)
                            self.send_msg(conn,self.kreirajDokumentNapaka(s,"Napačen pin"))
                            continue



                        if s['Status'] == "Stanje":
                            self.send_msg(conn,self.kreirajDokumentStanje(s))
                        if s['Status'] == "Polog":
                            self.send_msg(conn,self.kreirajDokumentPolog(s))
                        if s['Status'] == "Dvig":
                            self.send_msg(conn,self.kreirajDokumentDvig(s))
                    except RuntimeError as e:
                        print(e)
                        #import traceback;traceback.print_exc()
                        break
                    
                conn.close()
            except KeyboardInterrupt:
                break
        ss.close()
        
if __name__ == '__main__':
    
    server = Server((ipBind, port))
    server.serve_forever()
    