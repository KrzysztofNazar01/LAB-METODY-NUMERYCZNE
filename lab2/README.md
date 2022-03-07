Metody Numeryczne – Laboratorum 2

Page Rank

1. **Wstęp**

Celem laboratorium jest implementacja algorytmu **PageRank**, który jest podstawą sukcesu firmy Google. Pozwala on na badanie jakości stron w sieci na podstawie relacji między poszczególnymi stronami.

Parę uwag:![](Aspose.Words.3ee82365-0b42-4bfd-b1de-5cea7c266942.001.png)

- W oryginalnej wersji algorytmu PageRank tworzone jest tzw. równanie własne, które jest rozwiązywane za pomocą metody potęgowej. W ramach niniejszego labo- ratorium zostanie omówiony wariant PageRank, który operuje na układzie równań liniowych.
- Przedstawione zostaną podstawowe założenia algorytmu. Szczegóły implementa- cyjne są tajemnicą firmy Google.
- Zachowaj implementację algorytmu, ponieważ przyda się ona podczas Lab. 3.
- Pamiętaj, żeby przechowywać macierze w trybie *sparse*.
2. **PageRank – ogólne założenia**

Algorytm PageRank przypisuje każdej ze stron internetowych pewien współczynnik (o nazwie takiej samej jak nazwa algorytmu – PageRank, oznaczony w skrócie przez *PR*), który określa ważność tej strony względem innych stron. Współczynnik ten jest związany z prawdopodobieństwem, że internauta klikając w sposób losowy w hiperlinki, ostatecz nie trafi na rozpatrywaną stronę.

![obraz](https://user-images.githubusercontent.com/72522808/157123583-427f9da9-1b92-4377-8af7-3124cbc82cb2.png)

Rysunek 1: Sieć składająca się z 4 stron (A, B, C i D).

Rozpatrzmy prostą sieć składającą się z 4 stron (A, B, C i D), przedstawioną na rys. 1. Połączenia między stronami są przedstawione w formie macierzy *Edges*, która dla sieci z rys. 1 przybiera postać:


|A|A|A|B|C|D|D|
| - | - | - | - | - | - | - |
|B|C|D|D|A|A|C|


gdzie górny wiersz zawiera strony z linkami do stron z dolnego wiersza. Przykładowo, do strony *D* linkują dwie strony: *A* i *B*. Ranking strony D *(PR(D))* oblicza się w następujący sposób:

![obraz](https://user-images.githubusercontent.com/72522808/157123798-e2a7cb97-a065-4a42-b4a5-7ce0c1123236.png)

*(PR(D))* jest więc równy sumie rankingów wszystkich stron, które posiadają linki do D, podzielonych przez liczbę linków wychodzących z tych stron (3 linki wychodzące z A i 1 link wychodzący z B).

3. **PageRank – konstrukcja liniowego układu równań**

W wyniku rozpisania równania (1)[ dla](#_page1_x97.45_y153.18) wszystkich *N* stron w sieci powstaje następujący układ równań liniowych (szczegółowy opis przekształceń można znaleźć np. w [1]):

**Mr** = **b** (2)

- Poszukiwany wektor **r** zawiera wartości *PR* wszystkich *N* stron w sieci.
- Prawa strona równania – wektor **b** – ma długość *N* i wszystkie jego elementy mają wartość (1 − *d*)*/N* , gdzie *d* jest współczynnikiem tłumienia.
- Macierz **M** jest *rzadka* i ma postać:

**M** = **I** − *d***BA** (3)

- **I** jest macierzą jednostkową: (**I** = *eye*(*N* )).
- **B** jest macierzą sąsiedztwa:

![obraz](https://user-images.githubusercontent.com/72522808/157124117-28f20f86-d287-4b75-8432-4f440d76f10b.png)

gdzie b(i, j) = 1, jezeli strona j ma link do i (zwróc uwage na zmiane indeksów!). b(i, j) = 0 w pozostałych przypadkach.
– A jest macierza diagonalna:

![obraz](https://user-images.githubusercontent.com/72522808/157124192-7086c66c-0f62-4723-9a21-61fab162e1df.png)



![obraz](https://user-images.githubusercontent.com/72522808/157124240-d84c81c8-ff1f-4b1f-9850-13a6901526c7.png)

Rysunek 2: Sieć składająca się z 7 stron.

gdzie *L*(*i*) jest liczbą linków wychodzących ze strony *i* – tej, którą można wyznaczyć korzystając z macierzy **B**:

*L*(*i*) = *sum*(**B**(:*,i*))*.* (6)

W wyniku rozwiązania układu równań otrzymujemy wektor **r**, który zawiera wartości *PR* wszystkich *N* stron w sieci. Im wyższa wartość *PR* tym strona jest bardziej istotna w rozpatrywanej sieci.

- **Zadanie A** – wygeneruj tablicę *Edges* dla sieci z rys. 2, zawierającej 7 stron.
- **Zadanie B** – skonstruuj macierze **A**, **B**, **I** i wektor **b** dla połączeń wygenerowa- nych w **Zadaniu A** dla parametru *d* = 0*.*85. Wszystkie macierze powinny być przechowywane w formacie *sparse*, ponieważ są to macierze rzadkie. Sprawdź, czy odpowiednie elementy macierzy **B** są niezerowe!
- **Zadanie C** – rozwiąż układ równań (2) za pomocą metody bezpośredniej (**r** = **M**\**b**).
- **Zadanie D** – Stwórz wykres *bar*(**r**), zaobserwuj wartość PageRank dla poszcze- gólnych stron w sieci.

[1][ http://www.cse.unt.edu/~tarau/teaching/NLP/PageRank.pdf](http://www.cse.unt.edu/~tarau/teaching/NLP/PageRank.pdf)
