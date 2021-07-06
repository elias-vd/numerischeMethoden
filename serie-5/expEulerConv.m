% Rechte Seite
f = @(t,y) y;

% Exakte Loesung
yN_exact = exp(2.);

% Vektor mit Anzahl der verwendeten Schritte
N = 2.^([0:10]);

% Alloziere Speicherplatz
yN_approx = zeros(size(N));

% Bestimme eine Approximation mit expEuler mit N(XX) Schritten
for ii = 1:length(N)
  [t_ii,y_ii] = expEuler(f,0.,2.,1.,N(ii));
  yN_approx(ii) = y_ii(end);
end

% Absoluter Fehler
err = abs(yN_approx - yN_exact);

% ZeitSchrittweite
h = 2./N;

figure;
loglog(h,err,'*-');
grid on;
xlabel('Schrittweite h')
ylabel('Abs Fehler')
