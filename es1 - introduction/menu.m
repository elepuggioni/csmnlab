n = 4;      % numero di piatti
nomi = ["Lasagna" "Orata" "Insalata" "Macedonia"];
calorie = [800 400 100 300];

% stampa i piatti
for i = 1:n
    fprintf("Piatto %i: %s - %d calorie\n",i, nomi(i), calorie(i));
end

% chiede all'utente un numero
scelta = input("\nScegli un numero da 1 a 4...");

if scelta > 0 && scelta < 5
    fprintf("\n%s: %d calorie\n\n", nomi(scelta), calorie(scelta));
else
    fprintf("Numero non valido.\n")
end
