clearvars;
% Rechte Seite und Anfangswert
f1 = @(t,y) y;
f2 = @(t,y) y.^2;
y01 = 2;
y02 = 1/2;
t0 = 0;
T  = 1;

% Exakte Loesung
exact_fun1 = @(t)(y01*exp(t));
exact_fun2 = @(t)(1/(2-t));

% Alloziere Speicherplatz
h = zeros(7,1);
err1 = zeros(7,1);
err2 = zeros(7,1);

for ii = 0:6
  N = 2^(ii+3);
  h(ii+1) = 1/N;
  % Approximative Loesung
  [t1,y1] = verbEuler(f1,t0,T,y01,N);
  [t2,y2] = verbEuler(f2,t0,T,y02,N);
  % Absoluter Fehler
  % Wert der Referenzloesung zum Zeitpunkt T: exact_fun(T)
  err1(ii+1) = abs(y1(:,end) - exact_fun1(T));
  err2(ii+1) = abs(y2(:,end) - exact_fun2(T));
end

% loglog-plot
figure;
loglog(h,err1,'-*');
hold on;
loglog(h,err2,'-*');
xlabel('h');
ylabel('|y_N - y(T)|');
grid on;
hold off;
% print('konvOrdnungEmpirisch.eps','-depsc')

% Konvergenzrate
fit1 = polyfit(log(h),log(err1),1);
fprintf('Empirische Konvergenzrate Test 1: %1.2f\n',fit1(1));
fit2 = polyfit(log(h),log(err2),1);
fprintf('Empirische Konvergenzrate Test 2: %1.2f\n',fit2(1));
