function [R1 R2] = PageRank(nume, d, eps)
% Calculeaza indicii PageRank pentru cele 3 cerinte
% Scrie fisierul de iesire nume.out

% Se aplica algoritmii Iterative si Algebraic pentru a calcula vectorii
% PageRank ai unei pagini prin doua metode.
R1 = Iterative(nume, d, eps);
R2 = Algebraic(nume, d);

% Se sorteaza descrescator vectorul PageRank calculat prin metoda Algebrica.
[PR indx] = sort(R2, 'descend');

% Se citesc datele din fisier(Aici sunt necesare valorile "val1" si "val2").
[N tmp tmp val1 val2] = ReadData(nume);

% Se creeaza fisierul de ieire si se deschide acesta.
out = strcat(nume, ".out");
fid = fopen(out, "wt");

% Se afiseaza numarul de resure Web.
fprintf(fid, "%d\n", N);
fprintf(fid, "\n");

% Se afiseaza vectorul PageRank calculat prin metoda Iterativa.
fprintf(fid, "%f\n", R1);
fprintf(fid, "\n");

% Se afiseaza vectorul PageRank calculat prin metoda Algebrica.
fprintf(fid, "%f\n", R2);
fprintf(fid, "\n");

% Se calculeaza valoarea functiei din enunt pentru fiecare element al
% vectorului PageRank sortat descrescator anterior.
for i = 1 : N
    PR1(i) = Apartenenta(PR(i), val1, val2);
    
    % Se afiseaza indicele actual al elementului din vectorul sortat, cel
    % initial si valoarea functiei pentru acesta.
    fprintf(fid, "%d %d %f\n", i, indx(i), PR1(i));
end

% Se inchide fisierul de iesire.
fclose(fid);

end