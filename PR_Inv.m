function B = PR_Inv(A)
% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
% Intrari:
% A = matricea pentru care se doreste calcularea inversei
% Iesiri:
% B = inversa matricei A
[m n]=size(A);

% Se initializeaza matricele in care va fi factorizata matriicea A:
% Q = factorul ortogonal(baza ortonormata)
% R = factorul superior triunghiular
Q = A;
R = zeros(m, n);

% Se aplica algoritmul Gram-Schmidt modificat matricei A.
% Algortimul este disponibil pe site-ul de curs.
for i = 1 : n
    R(i, i) = norm(Q(:, i));
    Q(:, i) = Q(:, i) / R(i, i);
    for j = i + 1 : n
        R(i, j) = Q(:, i)' * Q(:, j);
        Q(:, j) = Q(:, j) - Q(:, i) * R(i, j);
    end
end

Q = Q';

% Se rezolva sistemul de m ecuatii folosind algoritmul SST din tema
% anterioara.
for i = 1 : m
    B(:, i) = SST(R, Q(:, i));
end

end