function summbestimmeordnung

  %Quadraturregel
%   quadratur = @summtrapezregel;
%   quadratur = @summsimpsonregel;
%   quadratur = @summ2punktgauss;
  quadratur = @summ3punktgauss;
  %Intervall [a,b]
%   a = exp(1);
  a = sqrt(2);
  b = pi;


  %Integrand
%   integrand = @(x) x.^5;
%   integrand = @(x) sqrt(x-a);
%   integrand = @(x) (x-a).^(2.5);
%   integrand = @(x)f_4(x,a,b);
%   integrand = @(x) x.*cos(x);
  integrand = @(x) (x-a).^(7/3);

  %Referenzloesung
  refsol = integral(integrand,a,b);

  %Anzahl von Subintervallen
  N = 2.^(1:6);

  %Alloziere Speicherplatz
  approxsol = zeros(1,length(N));

  for ii = 1:length(N)

      %Bestimme approximierte Loesung mit N(ii) Subintervallen
      approxsol(ii) = quadratur(integrand,a,b,N(ii));

  end

  %Bestimme den absoluten Fehler
  err = abs(approxsol - refsol);

  %loglogplot
  figure;
  loglog(N,err,'-*')

  %Bestimme die Konvergenzrate
  p = polyfit(log(N), log(err), 1);
  fprintf('Die Konvergenzordnung lautet %1.2f \n',-p(1))
