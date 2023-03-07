methods = 4;    % numero di metodi da testare
samples = 8;    % pool dei dati
tol = 1e-8;     % tolleranza sulla soluzione

soluz = zeros(methods, samples);    % le soluzioni che verranno calcolate
k = zeros (methods, samples);       % il numero di iterazioni
err = zeros(methods,samples);       % gli errori

% ********* funzioni delle tabelle 7.1, 7.2, 7.3, 7.4 del libro ********* %
f1 = @(x) (x^2)-2;
f2 = @(x) exp(x)-2;
f3 = @(x) (1/x)-3;
f4 = @(x) (x-3)^3;

% ********* soluzioni vere delle funzioni ********* %
alfa = zeros(4,1);
alfa(1) = sqrt(2);
alfa(2) = log(2);
alfa(3) = 1/3;
alfa(4) = 3;

% ********* derivate delle funzioni ********* %
d1 = @(x) 2*x;
d2 = @(x) exp(x);
d3 = @(x) (-1/x^2);
d4 = @(x) 3*x^2 -18*x +27;

% i dati dal libro del metodo di bisezione
bis = [
    0 2;
    0 200;
    0 2;
    0 200;
    0 2;
    0 200;
    4/3 10/3;
    4/3 604/3
    ];
% i dati dal libro del metodo di newton
nwtn = [2 200 2 200 2 0.1 2 2.9];

% i dati dal libro del metodo delle corde
crd = [2 200 2 200 2 0.1 2 2.9];

% i dati dal libro del metodo delle secanti
scnt = [1 2;
    199 200;
    2 3;
    199 200;
    2 3;
    0.1 0.11;
    1 2;
    2.5 2.9
    ];

% itera per tutti i dati
for i = 1:samples
    % determina quale funzione, quale derivata, e quale
    % alfa si sta prendendo in considerazione
    if i == 1 || i == 2
        f = f1;
        d = d1;
        a = alfa(1);
    elseif i == 3 || i == 4
        f = f2;
        d = d2;
        a = alfa(2);
    elseif i == 5 || i == 6
        f = f3;
        d = d3;
        a = alfa(3);
    elseif i == 7 || i == 8
        f = f4;
        d = d4;
        a = alfa(4);
    else
        error("indice invalido");
    end

    % esegue i quattro metodi 
    try
        [soluz(1,i), k(1,i)] = bisec(f, bis(i,1), bis(i,2), tol, 200);
        [soluz(2,i), k(2,i)] = newton(f, d, nwtn(i), tol, 200);
        [soluz(3,i), k(3,i)] = corde(f, d(crd(i)), crd(i), tol, 2000);
        [soluz(4,i), k(4,i)] = secanti(f, scnt(i,1), scnt(i,2), tol, 2000);
    catch E
        % gestisce eventuali eccezioni
        switch E.identifier
            case 'Bisec:InvalidInterval'
                warning(E.identifier, "%s: %s", E.identifier,  E.message);
                soluz(1,i) = NaN;
            case 'Newton:InvalidDerivative'
                warning(E.identifier, "%s: %s", E.identifier, E.message);
                soluz(2,i) = NaN;
            case 'Corde:InvalidM'
                warning(E.identifier, "%s: %s", E.identifier, E.message);
                soluz(3,i) = NaN;
            case 'Secanti:InvalidM'
                warning(E.identifier, "%s: %s", E.identifier, E.message);
                soluz(4,i) = NaN;
            otherwise
                warning(E.identifier, "%s: %s", E.identifier, E.message);
        end
    end

    % calcola gli errori
    err(1,i) = abs(a - soluz(1,i)); 
    err(2,i) = abs(a - soluz(2,i));
    err(3,i) = abs(a - soluz(3,i));
    err(4,i) = abs(a - soluz(4,i));
end

% array con nomi delle righe: la definizione della funzione
funarr = ["f(x) = (x.^2)-2";
    "___ ___________";
    "f(x) = exp(x)-2";
    "____ __________";
    "f(x) = (1/x)-3";
    "_______ _______";
    "f(x) = (x-3).^3";
    "__________ ____"];
alpha = ["sqrt(2)"; "log2"; "1/3"; "3"];

% tabella con i dati del metodo di bisezione
b = table(...
    [alpha(1);alpha(1);alpha(2);alpha(2);alpha(3);alpha(3);alpha(4);alpha(4)], ...
    transpose(soluz(1,:)), ...
    cell2mat(num2cell(bis, 2)), ...
    transpose(err(1,:)), ...
    transpose(k(1,:)), ...
    'VariableNames',{'alfa', 'x', '[a           b]', '| x - alfa |', 'n.iter'}, ...
    'RowNames', funarr);
    
% Nested table con il titolo
bisect = table(b,'VariableNames',{'Metodo di bisezione'}); 

% tabella con i dati del metodo di Newton
n = table(...
    [alpha(1);alpha(1);alpha(2);alpha(2);alpha(3);alpha(3);alpha(4);alpha(4)], ...
    transpose(soluz(2,:)), ...
    transpose(nwtn), ...
    transpose(err(2,:)), ...
    transpose(k(2,:)), ...
    'VariableNames',{'alfa', 'x', 'x0', '| x - alfa |', 'n.iter'}, ...
    'RowNames', funarr);
% Nested table con il titolo
newt = table(n,'VariableNames',{'Metodo di Newton'}); 

% tabella con i dati del metodo delle corde
c = table(...
    [alpha(1);alpha(1);alpha(2);alpha(2);alpha(3);alpha(3);alpha(4);alpha(4)], ...
    transpose(soluz(3,:)), ...
    transpose(crd), ...
    transpose(err(3,:)), ...
    transpose(k(3,:)), ...
    'VariableNames',{'alfa', 'x', 'x0', '| x - alfa |', 'n.iter'}, ...
    'RowNames', funarr);
% Nested table con il titolo
cordet = table(c,'VariableNames',{'Metodo delle corde'}); 

% tabella con i dati del metodo delle secanti
s = table(...
    [alpha(1);alpha(1);alpha(2);alpha(2);alpha(3);alpha(3);alpha(4);alpha(4)], ...
    transpose(soluz(4,:)), ...
    cell2mat(num2cell(scnt, 2)), ...
    transpose(err(4,:)), ...
    transpose(k(4,:)), ...
    'VariableNames',{'alfa', 'x', 'x0', '| x - alfa |', 'n.iter'}, ...
    'RowNames', funarr);
% Nested table con il titolo
secantt = table(s,'VariableNames',{'Metodo delle secanti'}); 

% stampa le tabelle
disp(bisect);
disp(newt);
disp(cordet);
disp(secantt);