def preberi_kljucne(filename):
    slo = {}
    for line in open(filename, "rt", -1, "cp1252"):#ANSI right?
        film, keyword = line.split(line[line.find("("):line.rfind("\t")+1])
        film = film[:-1].replace('\"','')
        if not film in slo:  slo[film]=set()
        if film in slo:  slo[film].add(keyword.strip("\n"))
    return slo

def podobnost(film1, film2, kljucne):
    return len(kljucne[film1].intersection(kljucne[film2]))/len(kljucne[film1].union(kljucne[film2]))
























import unittest

class TestFilmi(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        ### Tukaj lahko spremenite pot do datoteke keywords.list. ###
        cls.k = preberi_kljucne("keywords.list")

    def test_version(self):
        import sys

        self.assertEqual(sys.version_info.major, 3)

    def test_kljucne(self):
        self.assertCountEqual(self.k["Kekceve ukane"], {'youth', 'based-on-novel'})
        self.assertCountEqual(self.k["Honor de cavallería"], {'based-on-novel', 'honor', 'don-quixote', 'sancho-panza'})
        self.assertCountEqual(self.k["Banditi a Milano"], {'death', 'beautiful-woman', 'violence', 'car-chase', 'murder', 'robbery'})
        self.assertCountEqual(self.k["Meneer Klomp"], {'caught-in-the-act', 'fool', 'dark-comedy', 'hugging', 'insurance-company'})
        self.assertCountEqual(self.k["Good Translator"], {'terrorism', 'america', 'translation', 'immigration'})

        self.assertEqual(len(self.k["Gun Shy"]), 88)
        self.assertEqual(len(self.k["Star Wars: Episode I - The Phantom Menace"]), 156)
        self.assertEqual(len(self.k["Julius Caesar"]), 142)
        self.assertEqual(len(self.k["King of Chinatown"]), 228)
        self.assertEqual(len(self.k["'Allo 'Allo!"]), 54)

    def test_podobnost(self):
        self.assertAlmostEqual(podobnost('The Black Adder', 'Fawlty Towers', self.k), 0.022857142857142857)
        self.assertAlmostEqual(podobnost('The Simpsons', 'South Park', self.k), 0.11476487997369286)
        self.assertAlmostEqual(podobnost('The Secrets of Wu Sin', 'Social Error', self.k), 0.10465116279069768)
        self.assertAlmostEqual(podobnost('The Man Who Played Square', 'The Texas Marshal', self.k), 0.13414634146341464)
        self.assertAlmostEqual(podobnost('The Tale of the Bunny Picnic', 'Somos lo que hay', self.k), 0.15384615384615385)
        self.assertAlmostEqual(podobnost('The Gorgeous Hussy', 'Akai hankachi', self.k), 0.10344827586206896)
        self.assertAlmostEqual(podobnost('The Toolbox Murders', 'Day of the Woman', self.k), 0.11764705882352941)
        self.assertAlmostEqual(podobnost('Eveline', 'Babyfever', self.k), 0.15384615384615385)
        self.assertAlmostEqual(podobnost('The Spikes Gang', 'Le dernier trappeur', self.k), 0.0)
        self.assertAlmostEqual(podobnost("VeggieTales: Tomato Sawyer & Huckleberry Larry's Big River Rescue", 'The After', self.k), 0.0)
        self.assertAlmostEqual(podobnost('The New Scooby-Doo Movies', 'Yi sa bui lai', self.k), 0.0)

    def test_hitrost(self):
        import timeit

        self.assertLess(timeit.timeit(lambda: podobnost('The Simpsons', 'South Park', self.k), number=100), 1)

if __name__ == "__main__":
    unittest.main(verbosity=2)