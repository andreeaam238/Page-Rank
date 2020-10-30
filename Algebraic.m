function R = Algebraic(nume, d)
% Functia care calculeaza vectorul PageRank folosind varianta algebrica de
% calcul.
% Intrari:
%	-> nume: numele fisierului in care se scrie;
%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o
%       pagina urmatoare.
% Iesiri:
%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

% Se citesc datele din fisier si se prelucreaza acestea folosind functia
% ReadData.
[N A M tmp tmp] = ReadData(nume);

% Se calculeaza inversa matricei din enuntul temei folosind algoritmul
% Gram-Schmidt optimizat si algoritmul SST din tema anterioara.
Aux = PR_Inv(eye(N) - d * M);

% Se calculeaza vectorul PageRank-uri conform formulei din enuntul temei.
R = Aux * ((1 - d) / N) * ones(N, 1);

end