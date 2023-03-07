function [x,k] = bisec(fun,a,b,tol,kmax)

% BISEC implementa il metodo di bisezione per la risoluzione di un'equazione non lineare.
%
% input
% fun = function handle dell'equazione in forma implicita
% a e b = gli estremi dell'intervallo di partenza
% tol = tolleranza sulla soluzione
% kmax = numuero massimo di iterazioni
%
% output
% x = approssimazione sulla soluzione
% k = numero di iterazioni effettuate

fa = fun(a);
fb = fun(b);

if (fa*fb > 0)
    error('Bisec:InvalidInterval','Intervallo sbagliato!')
end

k = 1;
c = (a+b)/2;
fc = fun(c);

if (abs(fc) < 1e-10)
    x = c;
    return
end

flag = 1;
while (flag~=0)
    k = k+1;
    if (fa*fc < 0)
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
    c = (a+b)/2;
    fc = fun(c);
    
    flag = (abs(b-a) > tol) && (k<kmax) && (abs(fc)>1e-10);
end

if (k>=kmax)
    warning('N. massimo di terazioni raggiunto')
    x = inf;
elseif (abs(fc)<=1e-10)
    x = c;
else
    x = (a+b)/2;
end
