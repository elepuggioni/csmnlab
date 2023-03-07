function [x,k] = jacobi(A,b,tol,kmax,x0)

%questa funzione calcola l'approssimazione di x tramite l'algoritmo di
%Jacobi
%gli input sono la matrice A, il vettore dei termini noti b, la tolleranza
%tol, il numero di iterazioni massime kmax, il punto iniziale x0
%gli output sono
% la soluzione x e il numero di iterazioni effettuate k

D = diag(diag(A));
E = -tril(A,-1);
F = -triu(A,1);

Bj = D\(E+F);
f = D\b;
rho = max(abs(eig(Bj)));

x_old = x0;
x_new = Bj*x_old + f;

k = 1;
while (norm(x_new-x_old)>tol*norm(x_old)) && (k<kmax)
    k = k+1;
    x_old = x_new;
    x_new = Bj*x_old + f;
end

if (k>=kmax)
    warning('Raggiunto il numero massimo di iterazioni')
end

x = x_new;
