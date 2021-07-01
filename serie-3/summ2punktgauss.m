function y = summ2punktgauss(f,a,b,N)
  % Input:
  % * f: function handle fuer Funktion f
  % * [a,b]: Intervall
  % * N: Anzahl der Intervalle, die verwendet werden soll
  % Output:
  % * y: Wert von int_a^b f(x) dx


  % Vektor [x_0, x_1, ... x_N]
  % mit x_0 = a und x_N = b
  x = linspace(a,b,N+1);

  h = (b-a)/N;
  y = 0.;
  
  % Summierte 2 Punkte Gauss
  for i=1:N
    y = y + h/2*(f(((sqrt(3)+1)*x(i) + (sqrt(3)-1)*x(i+1))/(2*sqrt(3))) ...
               + f(((sqrt(3)-1)*x(i) + (sqrt(3)+1)*x(i+1))/(2*sqrt(3))));
  end



end
