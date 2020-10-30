function [N A M val1 val2] = ReadData(nume)
% Se deschide fisierul din care vor fi citite datele.
fid = fopen(nume, "rt");

% Se citeste numarul de resurse Web.
N = fscanf(fid, "%d", 1);

% Se initializeaza matricea grafului si vectorul ce va contine numarul de
% noduri adiacente pentru fiecare nod din graf.
A = zeros(N);
Neighbours = zeros(1, N);

% Se citesc nodurile adiacente pentru fiecare nod din graf si se genereaza
% matricea acestuia.
for i = 1 : N
    % Se citeste indicele nodului.
    indx = fscanf(fid, "%d", 1);
    
    % Se citeste numarul de noduri adiacente pentru nodul curent.
    NoAdiacentNodes(indx) = fscanf(fid, "%d", 1);
    
    % Se citesc indicii nodurilor adiacente cu nodul curent.
    AdiacentNodes = fscanf(fid, "%d", NoAdiacentNodes(indx));
    
    % Se pune unu la intersectia din matrice a indicilor celor doua noduri.
    A(indx, AdiacentNodes(1 : NoAdiacentNodes(indx))) = 1;
    
    % Daca nodul respectiv este adiacent cu el insusi se pune 0 in matrice si
    % se decrementeaza numarul de noduri adiacente cu acesta(Nu ne intereseaza
    % la calcul paginile care au link catre ele insele).
    if A(indx, indx) == 1
        A(indx, indx) = 0;
        NoAdiacentNodes(indx)--;
    end
end

% Se citesc cele doua valori folosite in functia PageRank.
val1 = fscanf(fid, "%f", 1);
val2 = fscanf(fid, "%f", 1);

% Se genereaza matricea K care are pe diagonala numarul de noduri adiacente cu
% fiecare nod al grafului.
K = diag(NoAdiacentNodes);

% Se calculeaza matricea M conform formulei din enuntul temei.
M = (PR_Inv(K) * A)';

% Se inchide fisierul.
fclose(fid);

end
