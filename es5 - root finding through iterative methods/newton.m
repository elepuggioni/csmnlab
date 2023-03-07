function [x,k] = newton(fun,fund,x0,tol,kmax)

% NEWTON implementa il metodo di Newton per la risoluzione di un'equazione non lineare.
%
% input
% fun = function handle dell'equazione in forma implicita
% fund = la derivata di fun
% x0 = il punto di partenza
% tol = tolleranza sulla soluzione
% kmax = numuero massimo di iterazioni
%
% output
% x = approssimazione sulla soluzione
% k = numero di iterazioni effettuate

k = 0;
f0 = fun(x0);
if (abs(f0) < 1e-10)
    x = x0;
    return
end

fd = fund(x0);
if (abs(fd)<1e-10)
    error('Newtown:InvalidDerivative','La derivata si annulla in x0! Cambia punto di partenza');
end
   
k = 1;
x_new = x0 - (f0/fd);

flag = 1;
while flag
    k = k+1;
    x0 = x_new;
    f0 = fun(x0);
    fd = fund(x0);
    if (abs(fd)<1e-10)
        error('Newton:InvalidDerivative','La derivata si annulla nel punto! Cambia x0');
    end  
    x_new = x0 - (f0/fd);
    flag = (abs(x_new-x0)>tol*abs(x0)) && (k<kmax) && (abs(fun(x_new))>1e-10); 
end

if (k>=kmax)
    warning('Newton:MaxIterations: N. massimo di iterazioni raggiunto');
    x = inf;
else
    x = x_new;
end
