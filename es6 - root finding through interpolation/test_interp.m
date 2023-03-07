f1 = @(x) 1./(1+25.*x.^2);
f2 = @(x) sin(2.*pi.*x);

% dati per le ascisse equispaziate
x = linspace(-1,1,10);
m = 100;
% dati per il polinomio di Chebychev
nc = 50;
kc = [0:1:nc]';
mc = 100;
xc = cos(((2.*kc+1).*pi)./(2*nc+2));


% ************** sezione sulla f1(x) ************** %

% costruisce un layout di grafici
tiledlayout(3,2);

% disegna la vera f1(x)
x1 = linspace(x(1), x(end), m);
nexttile([1 2])
plot(x1, f1(x1));
title('f1(x) = 1./(1+25.*x.^2)');

% calcola l'aprossimazione con la forma canonica e le ascisse equispaziate
y = f1(x);
xx = linspace(x(1), x(end), m)';
nexttile
yy = canint(x,y,xx);
title('f1(x) forma canonica - ascisse equispaziate');

% calcola l'aprossimazione con Lagrange e le ascisse equispaziate
nexttile
yy = lagrint(x,y,xx);
title('f1(x) Lagrange - ascisse equispaziate');

% calcola l'aprossimazione con forma canonica e polinomio di Chebychev
yc = f1(xc);
xxc = linspace(xc(1), xc(nc), mc)';
nexttile
yyc = canint(xc,yc,xxc);
title('f1(x) forma canonica - Chebychev');

% calcola l'aprossimazione con Lagrange ed il polinomio di Chebychev
nexttile
yyc = lagrint(xc,yc,xxc);
title('f1(x) Lagrange - Chebychev');

figure; % spezza i grafici successivi in un'altra finestra




% ************** sezione sulla f2(x) ************** %

%crea un'altro layout in un'altra finestra
tiledlayout(3,2);

% disegna la vera f2(x)
x2 = linspace(x(1), x(end), m);
nexttile([1 2])
plot(x2, f2(x2));
title('f2(x) = sin(2.*pi.*x)');

% calcola l'aprossimazione con la forma canonica e le ascisse equispaziate
y = f2(x);
xx = linspace(x(1), x(end), m)';
nexttile
yy = canint(x,y,xx);
title('f2(x) forma canonica - ascisse equispaziate');

% calcola l'aprossimazione con Lagrange e le ascisse equispaziate
nexttile
yy = lagrint(x,y,xx);
title('f2(x) Lagrange - ascisse equispaziate');

% calcola l'aprossimazione con forma canonica e polinomio di Chebychev
yc = f2(xc);
xxc = linspace(xc(1), xc(nc), mc)';
nexttile
yyc = canint(xc,yc,xxc);
title('f2(x) forma canonica - Chebychev');

% calcola l'aprossimazione con Lagrange ed il polinomio di Chebychev
nexttile
yyc = lagrint(xc,yc,xxc);
title('f2(x) Lagrange - Chebychev');