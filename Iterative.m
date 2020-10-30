function R = Iterative(nume, d, eps)
% Functia care calculeaza matricea R folosind algoritmul iterativ.
% Intrari:
%	-> nume: numele fisierului din care se citeste;
%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue
%       navigarea (0.85 in cele mai multe cazuri)
%	-> eps: eroarea care apare in algoritm.
% Iesiri:
%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

% Se citesc datele din fisier si se prelucreaza acestea folosind functia
% ReadData.
[N A M tmp tmp] = ReadData(nume);

% Se initializeaza vectorul de PageRank-uri conform formulei din enuntul temei.
R = ones(N, 1) * (1 / N);

% Se repeta procedeul pana cand se ajunge la precizia dorita.
while 1
    prev_R = R;
    % Noua valoarea pentru vectorul de PageRank-uri se calculeaza conform 
    % formulei din enuntul temei.
    R = d * M * prev_R + ((1 - d) / N) * ones(N, 1);
    if norm(R - prev_R) <= eps
        R = prev_R;
        return;
    end
end

end
