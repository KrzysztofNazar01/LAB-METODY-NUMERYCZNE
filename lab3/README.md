Metody Numeryczne – Laboratorium 3 Układy równań liniowych

dr inż. Grzegorz Fotyga KIMiA, WETI, PG

1. **Wstęp**

Celem laboratorium jest implementacja metod iteracyjnych i bezpośrednich rozwiązy- wania układów równań liniowych. Testy poszczególnych metod będą przeprowadzane na macierzach uzyskanych z algorytmu PageRank, wykorzystywanego przez firmę Google. Rozpatrzmy układ równań (otrzymany na Lab. 2):

**Mr** = **b***.* (1)

W wyniku rozwiązania [(1) ](#_page0_x97.45_y298.19)otrzymujemy wektor **r**, który zawiera wartości *PR* wszystkich *N* stron w sieci. Im wyższa wartość *PR* tym strona jest bardziej istotna w rozpatrywanej sieci.

**UWAGA** - przed wykonaniem zadań włącz w matlabie log za pomocą polecenia: *diary*( *log indeks lab*3 ). Podaj nr Twojego indeksu.

- **Zadanie A** – użyj funkcji [*Edges*] = *generate network*(*N,density,indeks*) do generacji losowej sieci. *N* jest liczbą stron, *density* jest gęstością połączeń między stronami, *indeks* to nr Twojego indeksu, *Edges* jest macierzą połączeń, gdzie pierwszy wiersz zawiera indeksy stron z linkami wychodzącymi, natomiast dolny wiersz – z wchodzącymi. Użyj parametrów: *N* = 10, *density* = 3.
- **Zadanie B** – skonstruuj macierze **A**, **B**, **I** i wektor **b** dla połączeń wygenerowa- nych w **Zadaniu A** dla parametru *d* = 0*.*85. Wszystkie macierze powinny być przechowywane w formacie *sparse*, ponieważ są to macierze rzadkie. Sprawdź, czy odpowiednie elementy macierzy **B** są niezerowe! Zapisz wszystkie dane za pomocą polecenia:

*save zadB indeks A B I b*

- **Zadanie C** (5%) – rozwiąż układ równań [(1) ](#_page0_x97.45_y298.19)za pomocą metody bezpośredniej (**r** = **M**\**b**) dla parametru *d* = 0*.*85. Zapisz wynik za pomocą polecenia:

*save zadC indeks r*

- **Zadanie D** (15%) – zmierz czas bezpośredniego rozwiązania układu równań (1) dla parametru *d* = 0*.*85 i *density = 10* za pomocą instrukcji *tic...toc* w pięciu przypadkach:

*N* = [500*,*1000*,*3000*,*6000*,*12000].

Stwórz odpowiedni wykres zależności czasu obliczeń w funkcji *N* . Zapisz wykres w pliku *zadD indeks.png*

2. **Iteracyjne algorytmy rozwiązania układów równań linio- wych**

W poprzednim punkcie stosowana była metoda bezpośrednia rozwiązywania układów równań liniowych, oparta na metodzie Gaussa. Celem tego podpunktu jest implementa- cja metod iteracyjnych: Jacobiego i Gaussa – Seidla.

Rozpatrzmy układ równań o postaci:

**Mr** = **b***.* (2)

Macierz **M** można przedstawić jako sumę macierzy trójkątnej dolnej, górnej i diago- nali: **M** = **L**+**U**+**D**. Podstawiając odpowiednie składniki do równania (2) [otrzym](#_page1_x97.45_y118.08)ujemy:

**Dr** = −(**L** + **U**)**r** + **b***.* (3) Mnożąc obustronnie przez **D**−1 otrzymujemy:

**r** = −**D**−1(**L** + **U**)**r** + **D**−1**b***,* (4)

co pozwala otrzymać ostateczną postać iteracyjną układu dla metody Jacobiego. Wektor rozwiązań w *k* + 1–tej iteracji ma postać:

**r**(*k*+1) = −**D**−1(**L** + **U**)**r**(*k*) + **D**−1**b***,* (5) przy czym zakładamy, że wektor początkowy **r**0 ma długość *N* i wszystkie elementy o

wartości 1.

Analogicznie, można wyprowadzić wzór na schemat iteracyjny metody Gaussa-Seidla:

(**D** + **L**)**r** = −**Ur** + **b***.* (6) Czynnik (**D** + **L**) można przenieść na prawą stronę, otrzymując wzór na *k* + 1 iterację

metody Gaussa-Seidla:

**r**(*k*+1) = −(**D** + **L**)−1(**Ur**(*k*)) + (**D** + **L**)−1**b***.* (7)

UWAGA – dużym błędem jest jawne odwrócenie czynnika (**D** + **L**)−1, ponieważ operacja ta powoduje duży błąd numeryczny i znaczny wzrost zapotrzebowania na pa- mięć RAM. Należy zastosować podstawienie w przód (ang. forward substituttion), co

w Matlabie można uzyskać za pomocą operatora ’\’. Operator ten dobiera odpowiednią (bezpośrednią!) metodę rozwiązania układu równań liniowych, w zależności od macierzy

**M**.

![](Aspose.Words.fdd12009-ae9a-4ef8-9b0c-f2e68bda117a.001.png)

Rysunek 1: Macierz **M** jako suma macierzy trójkątnej dolnej, górnej i diagonali: **M** = **L** + **U** + **D**.

![](Aspose.Words.fdd12009-ae9a-4ef8-9b0c-f2e68bda117a.002.jpeg)

Rysunek 2: Filtr mikrofalowy używany m.in. w technice radarowej i systemach sateli- tarnych.

Ważnym elementem algorytmów iteracyjnych jest określenie, w której iteracji algo- rytm powinien się zatrzymać. Jedną z metod jest korzystanie z tzw. wektora residuum, które dla *k* – tej iteracji przyjmuje postać:

**res**(*k*) = **Mr**(*k*) − **b***.* (8) Badając normę wektora residuum (*norm*(**res**(*k*))), możemy w każdej iteracji algoryt-

mu obliczyć jaki błąd wnosi wektor **r**(*k*). Jeżeli rozwiązanie zbiegnie się do dokładnego, residuum jest wektorem zerowym.

- **Zadanie E** (30%) – zaimplementuj metodę Jacobiego. W tym celu użyj funkcji *tril*, *triu*, *diag*. Dodaj warunek zatrzymania algorytmu – kiedy norma z residu-

um osiągnie wartość 10−14. Wyznacz czas obliczeń oraz liczbę iteracji dla pięciu przypadków: *N* = [500*,*1000*,*3000*,*6000*,*12000].

Zapisz wykres dotyczący czasu analizy (w pięciu przypadkach), liczby iteracji (w pięciu przypadkach) i wykres normy z residuum dla kolejnych iteracji (skorzystaj z funkcji *semilogy*(*norm res*)) w plikach o nazwie:

*zadE indeks n.png*

gdzie *n* jest numerem wykresu.

- **Zadanie F** (30%) – powtórz polecenie **E** dla metody Gaussa-Seidla. Zapisz od- powiednie wykresy, ponadto zapisz w pliku tekstowym *zadF indeks.txt* krótkie wnioski – która z trzech metod jest w tym przypadku najszybsza? Która meto-

da iteracyjna potrzebuje mniejszej liczby iteracji, żeby zbiec się do prawidłowego wyniku?

- **Zadanie G** (20%) – Ostatnie zadanie dotyczy rozwiązania układu równań w kontekście analizy elektromagnetycznej. Zaprojektowanie struktur elektronicznych działających na wysokich częstotliwościach wymaga dokładnego wyznaczenia roz- kładu pola elektromagnetycznego w całej dziedzinie obliczeniowej. W tym celu wykonuje się symulacje komputerowe, których najbardziej czasochłonną częścią jest rozwiązanie układu *N* równań liniowych. Obecnie *N* często osiąga wartość dziesiątek milionów, a obliczenia trwają wiele godzin, a nawet dni. Podobne sy- mulacje wykonuje się w pozostałych działach inżynierii.

Wczytaj dane z pliku *Dane Filtr Dielektryczny lab3 MN.mat* (macierz **M** i wektor **b**), dotyczące filtru działającego w paśmie ok. 10 GHz (Rys. 2). Rozwiąż układ równań **Mr** = **b** za pomocą 3 poznanych metod. Czy metody iteracyjne zbiegają

się? Krótko skomentuj wyniki i zapisz je w pliku *zadG indeks.txt*.

**Na koniec spakuj wszystkie pliki (kody, wykresy, komentarz, log) i prześlij w odpowiednim miejscu na e-nauczaniu.**
