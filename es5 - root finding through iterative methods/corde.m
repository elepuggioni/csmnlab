function [x,k] = corde(f,m,x0,tol,kmax)
% CORDE implementa il metodo delle corde per la risoluzione di un'equazione non lineare.
%
% input
% f = function handle dell'equazione in forma implicita
% m = coefficiente angolare
% x0 = punto iniziale da valutare
% tol = tolleranza sulla soluzione
% kmax = numuero massimo di iterazioni
%
% output
% x = approssimazione sulla soluzione
% k = numero di iterazioni effettuate

if m == 0
    error('Corde:InvalidM', 'Il coefficiente angolare m non può essere zero!');
end

k=0;    % counter delle iterazioni
x=1;    % inizializzazione di x

% itera fino a che l'errore è sotto la tolleranza o fino a kmax iterazioni
% o fino a che f(x) = 0
while( ((abs(x-x0)/(max([1 abs(x)]))) > tol) && (k<kmax) && (abs(f(x)) > 1e-10))
    x0 = x;                 % la x trovata al passo precedente diventa x0
    x = x0 - (f(x0)/m);     % esegue il passo k
    k = k+1;                % aumenta il counter
end

if k == 0
    x = NaN;
end

end