n = input("Inserisci un numero da 0 a 50...");
if n >= 0 && n <= 50
    fprintf("La radice di %f è %f", n, sqrt(n));
else
    fprintf("Il valore inserito non è valido.");
end