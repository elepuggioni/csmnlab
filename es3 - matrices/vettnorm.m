% Crea R (matrice quadrata di dimensioni n x n, con valori tra zero e uno) e
% la stampa
n = input("Inserisci dimensione...");
R = rand(n,n);
disp("Valore di R:")
disp(R);

% Crea x (vettore che contiene la diagolare di R) e lo stampa
x = diag(R);
disp("Valore di x:");
disp(x);

% Crea D (matrice che contiene x come diagonale) e la stampa
D = diag(x);
disp("Valore di D:");
disp(D);

% Crea U (matrice triangolare superiore di R) e la stampa
U = triu(R);
disp("Valore di U:");
disp(U);

% Crea L (matrice triangolare inferiore) e la stampa
L = tril(R);
disp("Valore di L:");
disp(L);

% stampa i controlli su D, U, L
fprintf("D è diagonale: %s\n", mat2str(isdiag(D)));
fprintf("U è triangolare superiore: %s\n", mat2str(istriu(U)));
fprintf("D è triangolare inferiore: %s\n", mat2str(istril(L)));