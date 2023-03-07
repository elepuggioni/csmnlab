n = 10;     % n = numero di iterazioni
step = 100; % il passo tra le dimensioni delle matrici

% itera n volte
for i = 0:n-1
    % trova la dimensione della matrice A al passo i
    dim = 100+i*step;
    
    % crea matrice A, il vettore soluzione con tutti 1, e trova il vettore
    % dei termini noti b
    A =  rand(dim,dim);
    x = ones(dim,1);
    b = A*x;

    % trova la fattorizzazione PA=LU usando lo script gauss_lu
    [P,L,U] = gauss_palu(A);

    % risolve il sistema lineare per trovare la soluzione perturbata x1
    y = L\P*b;
    x1 = U\y;

    % trova l'errore relativo sulla soluzione
    err = norm(x-x1)/norm(x);

    fprintf("Iterazione %d con matrice di dimensione %d x %d: l'errore è %e\n",i,dim,dim,err);
    fprintf("L'indice di condizionamento di A è: %e\n\n", cond(A));
end
fprintf("End\n");