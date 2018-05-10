#coding:UTF-8
import struct
import socket
from xml.dom.minidom import Document, getDOMImplementation
import ssl
import xml.dom.minidom
import sys

if len(sys.argv) != 8:
    print("Primer uporabe: python Client.py 0123456789-1 1337 certs/kapica/kapica.pem certs/kapica/kapicakey.pem 127.0.0.1 1234 certs/server/server.pem")
    exit()

racun = sys.argv[1]
pinNum = sys.argv[2]
myCert = sys.argv[3]
myCertKey = sys.argv[4]

ipNum = sys.argv[5]
portNum = int(sys.argv[6])
serverCert = sys.argv[7]


class Client:
    # maksimalna dolzina XMLja je 16 bit ushort (2 Bytes) = max. 64KB dolgo sporocilo
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
        encoded_msg = msg.encode("utf-8")
        # ustvari glavo v prvih 2 bytih je dolzina sporocila (HEADER_LENGTH)
        #  metoda pack "!H" : !=network byte order, H=unsigned short
        header = struct.pack("!H", len(encoded_msg))
        msg = header + encoded_msg
        sock.sendall(msg);
        
    def kreirajDokument(self):
        impl = getDOMImplementation()
        doc = impl.createDocument(None, 'stanje', None)
        oseba = doc.documentElement

        strac = doc.createElement('št-računa')
        oseba.appendChild(strac)
        strac.appendChild(doc.createTextNode(racun))

        pin = doc.createElement('pin')
        oseba.appendChild(pin)
        pin.appendChild(doc.createTextNode(pinNum))

        return doc.toxml()

    def kreirajDokumentDvig(self, vsota):
        impl = getDOMImplementation()
        doc = impl.createDocument(None, 'dvig', None)
        oseba = doc.documentElement

        strac = doc.createElement('št-računa')
        oseba.appendChild(strac)
        strac.appendChild(doc.createTextNode(racun))

        pin = doc.createElement('pin')
        oseba.appendChild(pin)
        pin.appendChild(doc.createTextNode(pinNum))

        zv = doc.createElement('želena-vsota')
        oseba.appendChild(zv)
        zv.appendChild(doc.createTextNode(str(vsota)))

        return doc.toxml()

    def kreirajDokumentPolog(self, vsota):
        impl = getDOMImplementation()
        doc = impl.createDocument(None, 'polog', None)
        oseba = doc.documentElement

        strac = doc.createElement('št-računa')
        oseba.appendChild(strac)
        strac.appendChild(doc.createTextNode(racun))

        pin = doc.createElement('pin')
        oseba.appendChild(pin)
        pin.appendChild(doc.createTextNode(pinNum))

        zv = doc.createElement('položena-vsota')
        oseba.appendChild(zv)
        zv.appendChild(doc.createTextNode(str(vsota)))

        return doc.toxml()

    def setup_SSL_context(self):
        #uporabi samo TLS, ne SSL
        context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
        # certifikat je obvezen
        context.verify_mode = ssl.CERT_REQUIRED
        #nalozi svoje certifikate
        context.load_cert_chain(certfile=myCert, keyfile=myCertKey)
        # nalozi certifikate CAjev, ki jim zaupas (samopodp. cert.=svoja CA!)
        context.load_verify_locations(serverCert)
        # nastavi SSL CipherSuites (nacin kriptiranja)
        context.set_ciphers('AES128-SHA')

        return context

    def preberiXML(self, dat):
        doc = dat
        strac = doc.getElementsByTagName("št-računa")[0].firstChild.nodeValue
        pin = doc.getElementsByTagName("pin")[0].firstChild.nodeValue
        ime = doc.getElementsByTagName("Ime")[0].firstChild.nodeValue
        priimek = doc.getElementsByTagName("Priimek")[0].firstChild.nodeValue

        #dodat preverjanje pina else error xml
        if doc.documentElement.tagName == "Dvog-Odgovor":
            zelenavsota = doc.getElementsByTagName("Želena-Vsota")[0].firstChild.nodeValue
            dvigmogoc = doc.getElementsByTagName("Dvig-Mogoc")[0].firstChild.nodeValue
            if dvigmogoc == "DA":
                print("Palček izplača "+zelenavsota)
            else:
                print("Ni mogoče izplačati želene vsote")
            return

        if  doc.documentElement.tagName == "Polog-Odgovor":
            polozenavsota = doc.getElementsByTagName("položena-vsota")[0].firstChild.nodeValue
            print("Položili ste "+polozenavsota)
            return

        if  doc.documentElement.tagName == "Stanje-Odgovor":
            stanje = doc.getElementsByTagName("Stanje")[0].firstChild.nodeValue
            print("Stanje na računu je "+stanje)
            return

        napaka = doc.getElementsByTagName("Stanje")[0].firstChild.nodeValue
        print("Napaka "+napaka)

    def run(self):
        my_ssl_ctx = self.setup_SSL_context()
        s = my_ssl_ctx.wrap_socket(socket.socket(socket.AF_INET, socket.SOCK_STREAM))
        s.connect(self.server_address)

        while 1:
            x = input("Vnesi operacijo za račun "+racun+":")
            if x[0]=="D":
                self.send_msg(s, self.kreirajDokumentDvig(int(x[2:])))
            elif x[0]=="P":
                self.send_msg(s, self.kreirajDokumentPolog(int(x[2:])))
            elif x[0]=="S":
                self.send_msg(s, self.kreirajDokument())
            else:
                print("NAPAČNA OPERACIJA")
                continue
            parser = xml.dom.minidom.parseString(self.receive_msg(s))
            self.preberiXML(parser)

        s.close()

if __name__ == '__main__':
    client = Client((ipNum, portNum))
    client.run()
    