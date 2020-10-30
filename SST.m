function x = SST(A, b)
% Am refolosit algoritmul SST din Tema 1.
% Functie care rezolva un sistem superior triunghiular.
% Intrari:
% A = matrice sistem
% b = vector termeni liberi
% Iesiri:
% x = vector necunoscute

n = size(A, 2);

% Se initializeaza vectorul de solutii cu 0.

x = zeros(n, 1);

% Se obtine solutia sistemului prin substitutie inapoi.

for i = n : -1 : 1
    x(i) = (b(i) - A(i,i + 1 : n) * x(i + 1 : n)) / A(i, i);
end

end