function yy = lagrint(x,y,xx)

% LAGRINT restituisce le ordinate yy = f(xx) dove f è il polinomio
% interpolante i punti con coordinate nei vettori x e y, calcolato usando
% il polinomio interpolante di Lagrange. Disegna il grafico del polinomio 
% interpolante evidenziando i punti di campionamento passati come argomento.
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
den = zeros(n,1);

%Lj(x) = ((x-x1)/(xj-x1))*((x-x2)/(xj-x2))*...*((x-xn)/(xj-xn))
%p(x) = y(1)*L0(x) + y(2)*L1(x) + ... + y(n)*Ln-1(x)

for j = 1:n
    den(j) = prod(x(j) - x([1:j-1,j+1:end]));
end

m = size(xx,1);
yy = zeros(m,1);

for i=1:m
    num = prod(xx(i)-x)./(xx(i)-x);
    L = num./den;
    yy(i) = y'*L;
end

plot(x,y,'or',xx,yy,'b-')
legend('dati da interpolare','polinomio interpolante')

