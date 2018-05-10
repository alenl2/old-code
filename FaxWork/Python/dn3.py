stolpci = "abcdefgh"
vrstice = "12345678"

def stolpec_prost(stolpec_preveri, pozic):
    for kralica in pozic:
        if stolpec_preveri == kralica[0]:
            return False
            break
    else:
        return True

def prost_stolpec(kralice):
    for stolpec in stolpci:
        if stolpec_prost(stolpec, kralice) == True:
            return(stolpec)

def prosti_stolpci(kralice):
    vrni = []
    for stolpec in stolpci:
        if stolpec_prost(stolpec, kralice) == True:
            vrni.append(stolpec)
    return(vrni)

def napadeno(polje, kralice):
    if napadajo(polje, kralice) == []:
        return False
    else:
        return True


def napada(polje1, polje2):#stolpec vrstica, stolpec vrstica
    if polje1 == polje2:
        return True
    if polje1[1] == polje2[1]:
        return True
    if polje1[0] == polje2[0]:
        return True

    var1 = 0
    var2 = 0
    var3 = 0
    var4 = 0

    if polje1[0] == "a":
        var1 = 1
    if polje1[0] == "b":
        var1 = 2
    if polje1[0] == "c":
        var1 = 3
    if polje1[0] == "d":
        var1 = 4
    if polje1[0] == "e":
        var1 = 5
    if polje1[0] == "f":
        var1 = 6
    if polje1[0] == "g":
        var1 = 7
    if polje1[0] == "h":
        var1 = 8

    if polje2[0] == "a":
        var2 = 1
    if polje2[0] == "b":
        var2 = 2
    if polje2[0] == "c":
        var2 = 3
    if polje2[0] == "d":
        var2 = 4
    if polje2[0] == "e":
        var2 = 5
    if polje2[0] == "f":
        var2 = 6
    if polje2[0] == "g":
        var2 = 7
    if polje2[0] == "h":
        var2 = 8

    if polje1[1] == "1":
        var3 = 1
    if polje1[1] == "2":
        var3 = 2
    if polje1[1] == "3":
        var3 = 3
    if polje1[1] == "4":
        var3 = 4
    if polje1[1] == "5":
        var3 = 5
    if polje1[1] == "6":
        var3 = 6
    if polje1[1] == "7":
        var3 = 7
    if polje1[1] == "8":
        var3 = 8

    if polje2[1] == "1":
        var4 = 1
    if polje2[1] == "2":
        var4 = 2
    if polje2[1] == "3":
        var4 = 3
    if polje2[1] == "4":
        var4 = 4
    if polje2[1] == "5":
        var4 = 5
    if polje2[1] == "6":
        var4 = 6
    if polje2[1] == "7":
        var4 = 7
    if polje2[1] == "8":
        var4 = 8

    if abs(var1 - var2) == abs(var3 - var4):
        return True

    return False

def napadajo(polje, seznam):
    vrni = []
    for poz in seznam:
        if napada(polje, poz):
            vrni.append(poz)

    return vrni

def prosto_v_stolpcu(stolpec, razpored):
    vrni = []
    for vrstica in vrstice:
        if not (napadajo(stolpec + vrstica, razpored)):
            vrni.append(stolpec+vrstica)
    return vrni


def prosto_polje(seznam):
        for stolpec in stolpci:
               if prosto_v_stolpcu(stolpec, seznam):
                   return prosto_v_stolpcu(stolpec, seznam)[0]

def napadajoce_se(kralice):
    vrni = []
    ok = True
    for kralica1 in kralice:
        for kralica2 in kralice:
            if napada(kralica1, kralica2):
                if kralica1 != kralica2:
                    for i in vrni:
                        if i == (kralica1,kralica2) or i == (kralica2,kralica1):
                            ok = False

                    if ok == False:
                        ok = True
                    else:
                        vrni.append((kralica1, kralica2))

    return vrni

def legalna(kralice):
    if len(kralice) == 8:
        if napadajoce_se(kralice) == []:
            return True
        else:
            return False
    else:
        return False

import unittest

class KraljiceTestCase(unittest.TestCase):
    def test_6stolpec_prost(self):
        if "stolpec_prost" in globals():
            self.assertTrue(stolpec_prost("b", ["a1", "c2", "d4"]))
            self.assertTrue(stolpec_prost("b", []))
            self.assertFalse(stolpec_prost("b", ["b3"]))
            self.assertFalse(stolpec_prost("b", ["a1", "b3"]))
            self.assertFalse(stolpec_prost("b", ["a1", "b3", "c4"]))
            self.assertFalse(stolpec_prost("b", ["b3", "c4"]))

    def test_6prosti_stolpci(self):
        self.assertCountEqual(prosti_stolpci(["a1", "c2", "d4"]), "befgh")
        self.assertCountEqual(prosti_stolpci(["a1"]), "bcdefgh")
        self.assertCountEqual(prosti_stolpci(["h1"]), "abcdefg")
        self.assertCountEqual(prosti_stolpci([]), "abcdefgh")

    def test_6prost_stolpec(self):
        self.assertEqual(prost_stolpec(["a1", "c2", "d4"]), "b")
        self.assertEqual(prost_stolpec(["a1"]), "b")
        self.assertEqual(prost_stolpec(["h1"]), "a")
        self.assertEqual(prost_stolpec([]), "a")

    def test_7napada(self):
        self.assertTrue(napada("a1", "a5"))
        self.assertTrue(napada("a1", "d1"))
        self.assertTrue(napada("c4", "a2"))
        self.assertTrue(napada("c4", "f7"))
        self.assertFalse(napada("c4", "a3"))
        self.assertFalse(napada("c4", "h5"))

    def test_7napadajo(self):
        self.assertCountEqual(napadajo("c2", ["a4", "c7", "d2"]),
            ["a4", "c7", "d2"])
        self.assertCountEqual(napadajo("c6", ["a4", "c7"]), ["a4", "c7"])
        self.assertCountEqual(napadajo("e8", ["a4", "c7", "d2"]), ["a4"])
        self.assertCountEqual(napadajo("a4", ["a4", "c7", "d2"]), ["a4"])
        self.assertCountEqual(napadajo("g8", ["a4", "c7", "d2"]), [])

    def test_7napadeno(self):
        self.assertTrue(napadeno("a7", ["a4", "c7", "d2"]))
        self.assertTrue(napadeno("a6", ["a4", "c7"]))
        self.assertFalse(napadeno("h5", ["a4", "c7", "d2"]))
        self.assertFalse(napadeno("a4", []))

    def test_8prosto_v_stolpcu(self):
        self.assertEqual(prosto_v_stolpcu("a", ["a4", "c7", "d2"]), [])
        self.assertEqual(prosto_v_stolpcu("b", ["a4", "c7", "d2"]), ["b1"])
        self.assertEqual(prosto_v_stolpcu("b", ["a4", "c7", "d1", "d2"]), [])
        self.assertEqual(prosto_v_stolpcu("b", ["a4", "c7", "d1"]), ["b2"])
        self.assertCountEqual(prosto_v_stolpcu("f", ["a4", "c7", "d2"]),
            ["f1", "f3", "f5", "f6", "f8"])
        self.assertCountEqual(prosto_v_stolpcu("f", []),
            ["f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8"])

    def test_8prosto_polje(self):
        self.assertEqual(prosto_polje(["a4", "c7", "d2"]), "b1")
        self.assertEqual(prosto_polje(["a4", "c7", "d1"]), "b2")
        self.assertEqual(prosto_polje(["a3", "c7", "d1"]), "b5")
        self.assertEqual(prosto_polje(["a3", "b3", "c7", "d1"]), "e4")
        self.assertEqual(prosto_polje([]), "a1")
        self.assertEqual(prosto_polje(
            ["f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8"]), None)

    def test_9napadajoce_se(self):
        st = lambda nn: [tuple(sorted(x)) for x in nn]

        self.assertCountEqual(st(napadajoce_se(["a4", "b1", "b7"])),
            [('b1', 'b7')])
        self.assertCountEqual(st(napadajoce_se(["a4", "b1", "e8"])),
            [('a4', 'e8')])
        self.assertCountEqual(st(napadajoce_se(["a4", "b1", "e4"])),
            [('a4', 'e4'), ('b1', 'e4')])
        self.assertCountEqual(st(napadajoce_se(["a4", "b1", "e4", "f2"])),
            [('a4', 'e4'), ('b1', 'e4')])

        self.assertCountEqual(st(napadajoce_se(["a1", "a2", "a3", "a4"])),
            [('a1', 'a2'), ('a1', 'a3'), ('a2', 'a3'),
             ('a1', 'a4'), ('a2', 'a4'), ('a3', 'a4')])

        self.assertEqual(napadajoce_se(["a4", "b1"]), [])
        self.assertEqual(napadajoce_se(
            ["a4", "b1", "c5", "d8", "e2", "f7", "g3", "h6"]), [])

    def test_9legalna(self):
        self.assertTrue(legalna(["a4", "b1", "c5", "d8", "e2", "f7", "g3", "h6"]))
        self.assertFalse(legalna(["a4", "b1", "c5", "d8", "e2", "f7", "g3"]))
        self.assertFalse(legalna(["a4", "b1", "c5", "d8", "e2", "f7", "g3", "h3"]))


if __name__ == "__main__":
    unittest.main(verbosity=2)
