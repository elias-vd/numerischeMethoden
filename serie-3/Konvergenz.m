% exaktes Integral
I1 = sinh(1.) - sinh(0.);
I2 = 2./3.;
I3 = pi/2 - 1;

% Approximation mittels Gauss-Legendre Quadratur
n = 1:100;
E1 = zeros(1,length(n));
E2 = zeros(1,length(n));
E3 = zeros(1,length(n));
E4 = zeros(1,length(n));
for in=n
  % a)
  [xin,win] = gauleg(0.,+1.,in); % Gauss-Legendre Knoten & Gewichte
  E1(in) = abs(sum(cosh(xin).*win) - I1); % Quadraturfehler fuer f1
  E2(in) = abs(sum(sqrt(xin).*win) - I2); % Quadraturfehler fuer f2
  E3(in) = abs(sum(asin(xin).*win) - I3); % Quadraturfehler fuer f3
  % b)
  [xin,win] = gauleg(0.,pi/2,in); % Gauss-Legendre Knoten & Gewichte
  E4(in) = abs(sum(xin.*cos(xin).*win) - I3); % Quadraturfehler fuer f4
end

% plot Fehler als Funktion von n
clf;
subplot(2,2,1);
semilogy(n,E1,'b-+');
xlabel('N');
ylabel('E1');
subplot(2,2,2);
loglog(n,E2,'b-+');
xlabel('N');
ylabel('E2');
subplot(2,2,3);
loglog(n,E3,'b-+');
xlabel('N');
ylabel('E3');
subplot(2,2,4);
semilogy(n,E4,'b-+');
xlabel('N');
ylabel('E4');

% a)
nmax = sum(log10(E1) > -13.); % bestimme groesstes n, sodass noch nicht
                              % Rundungsfehler ins Spiel kommen!
p1 = polyfit(1:nmax, log(E1(1:nmax)),1);
q = exp(p1(1));
fprintf('f1: q     = %f \n',q);


p2 = polyfit(log(1:nmax), log(E2(1:nmax)),1);
alpha = -p2(1);
fprintf('f2: alpha = %+f \n',alpha);

p3 = polyfit(log(1:nmax), log(E3(1:nmax)),1);
alpha2 = -p3(1);
fprintf('f2: alpha = %+f \n',alpha2);

% b)
% expotentieller Abfall

p4 = polyfit(1:nmax, log(E4(1:nmax)),1);
q4 = exp(p4(1));
p5 = polyfit(log(1:nmax), log(E4(1:nmax)),1);
alpha5 = -p5(1);
fprintf('f4: alpha = %+f \n    q     = %f \n', alpha5, q4);

