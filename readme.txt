Blaga Ana-Maria-Andreea, 314CB

Functia "ReadData" citeste datele ce vor fi prelucrate in celelalte functii si genereaza matricea de adiacenta a grafului + altele(detaliez in explicatii):
	- Se deschide fisierul din care vor fi citite datele;
	- Se citeste numarul de resurse Web;
	- Se initializeaza matricea grafului si vectorul ce va contine numarul de noduri adiacente pentru fiecare nod din graf.
	- Se citesc nodurile adiacente pentru fiecare nod din graf si se genereaza matricea acestuia:
		- Se citeste indicele nodului;
		- Se citeste numarul de noduri adiacente pentru nodul curent;
		- Se citesc indicii nodurilor adiacente cu nodul curent;
		- Se pune unu la intersectia din matrice a indicilor celor doua noduri.
		- Daca nodul respectiv este adiacent cu el insusi se pune 0 in matrice si se decrementeaza numarul de noduri adiacente cu acesta(Nu ne intereseaza la calcul paginile care au link catre ele insele).
	- Se citesc cele doua valori folosite in functia PageRank;
	- Se genereaza matricea K care are pe diagonala numarul de noduri adiacente cu fiecare nod al grafului;
	- Se calculeaza matricea M conform formulei din enuntul temei(Am folosit formula care se bazeaza pe matricea K, dar conform celeilalte definitii se poate obtine si prin impartirea elementelor din matricea de adiacenta la numarul de noduri adiacente ale nodului corespunzator liniei pe care se afla acestea);
	- Se inchide fisierul.

Functia "Iterative" calculeaza vectorul de PageRank-uri acordat pentru fiecare pagina prin metoda Iterativa:
	- Se citesc datele din fisier si se prelucreaza acestea folosind functia ReadData;
	- Se initializeaza vectorul de PageRank-uri conform formulei din enuntul temei;
	- Se repeta procedeul pana cand se ajunge la precizia dorita:
		- Vechea valoare pentru vectorul de PageRank-uri se pastreaza in prev_R;
		- Noua valoarea pentru vectorul de PageRank-uri se calculeaza conform formulei din enuntul temei.

Functia "Algebraic" calculeaza vectorul de PageRank-uri acordat pentru fiecare pagina prin metoda Algebrica:
	- Se citesc datele din fisier si se prelucreaza acestea folosind functia ReadData;
	- Se calculeaza inversa matricei din enuntul temei folosind algoritmul Gram-Schmidt optimizat si algoritmul SST din tema anterioara;
	- Se calculeaza vectorul PageRank-uri conform formulei din enuntul temei.

Functia "SST" rezolva un sistem superior triunghiular:
	- Se initializeaza vectorul de solutii cu 0;
	- Se obtine solutia sistemului prin substitutie inapoi.

Functia "PR_Inv" calculeaza inversa matricii A folosind factorizari Gram-Schmidt:
	- Se initializeaza matricele in care va fi factorizata matriicea A:
		- Q = factorul ortogonal(baza ortonormata);
		- R = factorul superior triunghiular;
	- Se aplica algoritmul Gram-Schmidt modificat matricei A;
	- Se rezolva sistemul de m ecuatii folosind algoritmul SST din tema anterioara.

Functia "PageRank" calculeaza indicii PageRank pentru cele 3 cerinte:
	- Se aplica algoritmii Iterative si Algebraic pentru a calcula vectorii PageRank ai unei pagini prin doua metode;
	- Se sorteaza descrescator vectorul PageRank calculat prin metoda Algebrica;
	- Se citesc datele din fisier(Aici sunt necesare valorile "val1" si "val2");
	- Se creeaza fisierul de ieire si se deschide acesta;
	- Se afiseaza numarul de resure Web;
	- Se afiseaza vectorul PageRank calculat prin metoda Iterativa;
	- Se afiseaza vectorul PageRank calculat prin metoda Algebrica;
	- Se calculeaza valoarea functiei din enunt pentru fiecare element al vectorului PageRank sortat descrescator anterior:
		- Se afiseaza indicele actual al elementului din vectorul sortat, cel initial si valoarea functiei pentru acesta;
	- Se inchide fisierul de iesire.

Functia "Apartenenta" calculeaza valoarea functiei membru in punctul x:
	- Se calculeaza valoarea functiei in punctul dorit respectand definitia functiei pe intervale;
	- Se calculeaza valorile pentru a si b astfel incat functia sa fie continua.
