function [x,k] = secanti(f,x0,x1,tol,kmax)
% SECANTI implementa il metodo delle secanti per la risoluzione di un'equazione non lineare.
%
% input
% f = function handle dell'equazione in forma implicita
% x0 e x1 = punti iniziali da valutare
% tol = tolleranza sulla soluzione
% kmax = numuero massimo di iterazioni
%
% output
% x = approssimazione sulla soluzione
% k = numero di iterazioni effettuate

k=0; % counter delle iterazioni
xprev = x0;
xnow = x1;
x = xnow;

% itera fino a che l'errore è sotto la tolleranza o fino a kmax iterazioni
% o fino a che f(x) = 0
while( ((abs(x-x0)/(max([1 abs(x)]))) > tol) && (k<kmax) && (abs(f(x)) > 1e-10))
    % lancia un'eccezione se il denominatore si annulla 
    if (f(xnow)-f(xprev)) == 0
        error('Secanti:InvalidM', 'Il denominatore f(xk) - f(xk-1) è zero!');
    end
    % esegue il passo k
    x = (xprev*(f(xnow))-xnow*(f(xprev))) / (f(xnow)-f(xprev));
    
    k = k+1;            % aumenta il counter
    xprev = xnow;       % aggiorna le variabili
    xnow = x;
end

if k == 0
    x = NaN;
end

end