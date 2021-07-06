clearvars;
% Rechte Seite und Anfangswert
lamda = 10;
y0 = 0;
t0 = 0;
T = 2;
f = @(t,y) lamda*(y - t^2/(1+t^2)) + 2*t^2/(1+t^2)^2;

% Exakte Loesung
exact_fun = @(t)(t.^2./(1+t.^2));


% Alloziere Speicherplatz
h = zeros(4,1);
err1 = zeros(4,1);
err2 = zeros(4,1);

for ii = 0:3
  N = 2^(ii+2);
  h(ii+1) = 1/N;
  % Approximative Loesung
  [t1,y1] = verbEuler(f,t0,T,y0,N)
end

% plot
t = linspace(0,2,100);
figure;
plot(t,exact_fun(t),'-');
hold on;
xlabel('t');
ylabel('y');
grid on;
xlim([0 2])
ylim([-1, 1])
hold off;

