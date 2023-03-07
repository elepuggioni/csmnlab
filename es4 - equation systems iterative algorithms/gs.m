function [x,k] = gs(A,b,tol,kmax,x0)
% GS risolve il sistema lineare associato a Ax=b applicando l'algoritmo di Gauss-Seidel.
% 
% input:
% A = matrice dei coefficienti 
% b = vettore dei termini noti 
% tol = tolleranza 
% kmax = numero di iterazioni massime 
% x = vettore soluzione iniziale 
%
% output:
% x = vettore con la soluzione approssimata del sistema
% k = numero di iterazioni

% trova le dimensioni di A e lancia un errore se non è quadrata
[m,n] = size(A);
if (m~=n)
    error('Matrice non quadrata!')
end
 
% trova le matrici D, E, F
D = diag(diag(A));
E = -(tril(A,-1));
F = -(triu(A,1));

% calcola la matrice di iterazione ed il vettore di iterazione
B = ((D-E)^-1)*F;
f = ((D-E)^-1)*b;

xk = x0;             % vettore con la soluzione approssimata
x0 = 100.*ones(n,1); % vettore fittizio di innesco
k=0;                 % contatore di iterazioni

% itera fino a che l'errore relativo non rientra dentro la tolleranza tol
% o finché non raggiunge il numero massimo di iterazioni
while(norm(xk-x0)>tol*norm(xk)) && (k<kmax)
    x0=xk;           % x è la soluzione del passo precedente, che assegna a x0
    xk = (B*x0)+f;   % esegue il passo attuale, ora x ha la soluzione del passo attuale
    k=k+1;           % aumenta il numero di iterazioni effettuate
end

if (k>=kmax)
    warning('Raggiunto il numero massimo di iterazioni')
end

x = xk;