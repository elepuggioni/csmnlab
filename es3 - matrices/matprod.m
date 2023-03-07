n = input("Inserisci una dimensione...");

% A è una matrice con valori tutti a zero di dimensione nxn
A = zeros(n);

% B è una matrice con valori tutti a uno di dimensione nxn
B = ones(n);

% z è un vettore colonna con valori tutti a due di dimensione n
z = 2.*(ones(n,1));

% stampa i valori di A, B e z
disp("Valore di A:")
disp(A);

disp("Valore di B:")
disp(B);

disp("Valore di z:")
disp(z);

% calcola b
b = A*z;
% calcola c
c = (z.')*B;

%stampa b e c
disp("Valore di b:")
disp(b);

disp("Valore di c:")
disp(c);