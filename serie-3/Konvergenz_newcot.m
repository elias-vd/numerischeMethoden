% exaktes Integral
I1 = sinh(1.) - sinh(0.);
I2 = 2./3.;
I3 = pi/2 - 1;

% Approximation mittels Newton-Cotes Quadratur
n = 1:50;
E1 = zeros(1,length(n));
E2 = zeros(1,length(n));
E3 = zeros(1,length(n));
E4 = zeros(1,length(n));
sum_abs_w = zeros(1,length(n));
for in=n
  % a)
  [xin,win] = newcot(0.,+1.,in); % Newton-Cotes Knoten & Gewichte
  sum_abs_w(in) = sum(abs(win));
  E1(in) = abs(sum(cosh(xin).*win) - I1); % Quadraturfehler fuer f1
  E2(in) = abs(sum(sqrt(xin).*win) - I2); % Quadraturfehler fuer f2
  E3(in) = abs(sum(asin(xin).*win) - I3); % Quadraturfehler fuer f3
  % b)
  [xin,win] = newcot(0.,pi/2,in); % Newton-Cotes Knoten & Gewichte
  E4(in) = abs(sum(xin.*cos(xin).*win) - I3); % Quadraturfehler fuer f4
end

% plot Fehler als Funktion von n
figure(1);
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
% print('Konv_newcot.eps','-depsc')

% plot Absolute Summe der Quadratur Gewichte
figure(2);
clf;
semilogy(n,sum_abs_w,'b-+');
xlabel('N');
ylabel('Absolute Summe der Quadratur Gewichte');
% print('Konv_newcot_SummeGewichte.eps','-depsc')

