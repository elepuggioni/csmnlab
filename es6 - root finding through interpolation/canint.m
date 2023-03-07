function yy = canint(x,y,xx)

% CANINT restituisce le ordinate yy = f(xx) dove f è il polinomio
% interpolante i punti con coordinate nei vettori x e y, calcolato usando
% la forma canonica. Disegna il grafico del polinomio interpolante
% evidenziando i punti di campionamento passati come argomento.
%
% input
% x = vettore colonna contenente le ascisse dei punti da interpolare
% y = vettore colonna contenente le ordinate dei punti da interpolare
% xx = le ascisse di campionamento per il polinomio interpolante
% 
% output
% yy = le ordinate f(xx) usate per disegnare il polinomio interpolante

x = x(:);
y = y(:);

n = size(x,1);

X = zeros(n);

for j = 1:n
    X(:,j) = x.^(j-1);
end

a = X\y;

m = size(xx,1);
yy = zeros(m,1);


%p = a0*x^0 + a1*x^1 + ... + an*x^n in teoria
%p = a1*x^0 + a2*x^1 + ... + a(n)*x^(n-1) su Matlab

for j = 1:m
    s = 0;
    for i = 1:n
        s = s + a(i)*(xx(j)^(i-1));
    end
    yy(j) = s;
end

plot(x,y,'or',xx,yy,'b-')
legend('dati da interpolare','polinomio interpolante')








