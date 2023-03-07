debug = false;

if debug
    a = 72.213;
    b = 41.243;
    c = -113.44;
else
    % chiede a, b, c in input
    a = input("Inserisci a...");
    b = input("Inserisci b...");
    c = input("Inserisci c...");
end

% calcola d1 e d2 senza arrotondamento
d1 = (a+b)+c;
d2 = a+(b+c);

% stampa i valori ottenuti
fprintf("\nI valori normali sono:\n")
fprintf("a = %f, b = %f, c = %f \n", a, b, c);
fprintf("d1 = %f\n", d1);
fprintf("d2 = %f\n\n", d2);

%**************** versione con arrotondamento ****************%
% t è il numero di cifre significative
t = 3;

% calcola a, b, c arrotondando a t cifre significative
a = fl(a, t);
b = fl(b, t);
c = fl(c, t);

% calcola d1 e d2 con operazioni macchina
d1_fl = fl(fl(a + b, t) + c, t);
d2_fl = fl(a + fl(b + c, t), t);

% calcola l'errore relativo
e1 = abs(d1 - d1_fl)/abs(d1);
e2 = abs(d2 - d2_fl)/abs(d2);

% stampa i valori ottenuti
fprintf("I valori arrotondati a %d cifre significative sono:\n", t);
fprintf("a = %f, b = %f, c = %f \n", a, b, c);
fprintf("d1_fl = %f\n", d1_fl);
fprintf("d2_fl = %f\n\n", d2_fl);

fprintf("Gli errori relativi sono:\n");
fprintf("e1: %f\n", e1);
fprintf("e2: %f\n\n", e2);


function n = fl(x, precision)
% FL prende in input un numero x e una precision e
% restituisce x arrotondato a un numero di cifre significative pari a
% precision
%
% x viene prima normalizzato nella forma 0.d1 d2 d3 d4(...) * 10^p
% poi la funzione round arrotonda a 'precision' cifre significative
% infine moltiplica il risultato per 10^p e lo restituisce
    p = 0;
    while x > 1 || x < -1
        x = x/10;
        p = p+1;
    end
    n = round(x, precision) * 10^p;
end