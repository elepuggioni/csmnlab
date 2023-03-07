% chiede una dimensione in  input
n = input("Inserisci una dimensione...");
% crea la matrice S di simensione n con elementi compresi tra 10 e 20
S = randi([10,20], n);

disp("Valore di S:");
disp(S);

% controlla che S sia simmetrica e se non lo e` la simmetrizza
if issymmetric(S)
    fprintf("S è simmetrica.");
else
    fprintf("S non è simmetrica.\n");
    S = (S + S.')./2;
    disp("Valore di S resa simmetrica:");
    disp(S);
end

% calcola gli autovalori di S
d = eig(S);
disp("Il valore di d (vettore contenente gli autovalori di S resa simmetrica) è:")
disp(d);

% calcola le norme 1, 2, e infinito del vettore d
n1 = norm(d,1);
disp("Il valore della norma 1 di d è:")
disp(n1);

n2 = norm(d,2);
disp("Il valore della norma 2 di d è:")
disp(n2);

ninf = norm(d, Inf);
disp("Il valore della norma infinito di d è:")
disp(ninf);