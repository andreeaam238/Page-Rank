function y = Apartenenta(x, val1, val2)
% Functia care primeste ca parametrii x, val1, val2 si care calculeaza
% valoarea functiei membru in punctul x.
% Stim ca 0 <= x <= 1

% Se calculeaza valoarea functiei in punctul dorit respectand definitia
% functiei pe intervale.

if x >= 0 && x < val1
    y = 0;
elseif x >= val1 & x <= val2
    % Se calculeaza valorile pentru a si b astfel incat functia sa fie continua.
    a = 1 / (val2 - val1);
    b = a * val1;
    b = -b;
    y = a * x + b;
elseif x > val2 && x <= 1
    y = 1;
end

end
