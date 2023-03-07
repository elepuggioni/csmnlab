n = 10;         % numero matrici & iterazioni
step = 100;     % il passo tra le dimensioni delle matrici
tol = 1e-8;     % tolleranza per l'errore della soluzione
kmax = 200;     % numero di iterazioni massime

dim = zeros(n,1);   % dimensioni delle n matrici
kj = zeros(n,1);    % numero di iterazioni con jacobi
kgs = zeros(n,1);   % numero di iterazioni con gs
errj = zeros(n,1);  % errori relativi con jacobi
errgs = zeros(n,1); % errori relativi con gs
rhoj = zeros(n,1);  % raggio spettrale di B con jacobi
rhogs = zeros(n,1); % raggio spettrale di B con gs

fprintf("Sto risolvendo i sistemi...\n\n");

for i = 0:(n-1)
    % trova la dimensione della matrice A al passo i
    dim(i+1,:) = 100+i*step;
    
    % crea A diagonalmente dominante
    A = rand(dim(i+1,:));
    A = A-diag(diag(A));            % matrice senza diagonale
    s = abs(A)*ones(dim(i+1,:),1);  % somme riga
    k=2;                            % fattore di predominanza
    A=A+k*diag(s);                  % matrice diagonalmente dominante
    
    
    % crea la soluzione x con elementi tutti 1
    x = ones(dim(i+1,:),1);
    % trova la soluzione b
    b = A*x;
    x0 = zeros(dim(i+1,:),1);
    
    % soluzione con Jacobi
    [xj, kj(i+1,:)] = jacobi(A,b,tol,kmax,x0);
    errj(i+1,:) = norm(x-xj(i+1,:))/norm(x);            % errore
    Bj = diag(diag(A))\((-tril(A,-1)) + (-triu(A,1)));  % ricalcola la matrice di iterazione
    rhoj(i+1,:) = max(abs(eig(Bj)));                    % raggio spettrale di Bj

    %soluzione con Gauss-Seidel
    [xgs, kgs(i+1,:)] = gs(A,b,tol,kmax,x0);
    errgs(i+1,:) = norm(x-xgs(i+1,:))/norm(x);                   % errore
    Bgs = (((diag(diag(A)))-(-(tril(A,-1))))^-1)*(-(triu(A,1))); % ricalcola la matrice di iterazione
    rhogs(i+1,:) = max(abs(eig(Bgs)));                           % raggio spettrale di Bgs
end

% prepara le tabelle
tjinner = table(...
    dim, ...
    kj, ...
    errj, ...
    rhoj, ...
    'VariableNames',{'dim', 'n.iter', 'errore', 'r.spettrale(B)'});
% Nested table con il titolo
tj = table(tjinner,'VariableNames',{'Metodo di Jacobi'}); 

tgsinner = table(...
    dim, ...
    kgs, ...
    errgs, ...
    rhogs, ...
    'VariableNames',{'dim', 'n.iter', 'errore', 'r.spettrale(B)'});
% Nested table con il titolo
tgs = table(tgsinner,'VariableNames',{'Metodo di Gauss-Seidel'}); 

% stampa le tabelle
disp(tj);
disp(tgs);
