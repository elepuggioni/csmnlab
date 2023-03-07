
err = zeros(10,1);
i = 0;
for n = 10:10:100
    i = i+1;
    A = 7*rand(n);
    s = diag(A);
    A = A+diag(100*s);

    x = ones(n,1);
    b = A*x;
    tol = 1e-6;
    [x1,k] = jacobi(A,b,tol,100,zeros(10,1));
  
    err(i) = norm(x1-x)/norm(x);
end


