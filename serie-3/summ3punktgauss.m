function y = summ3punktgauss(f,a,b,N)
  % Input:
  % * f: function handle fuer Funktion f
  % * [a,b]: Intervall
  % * N: Anzahl der Intervalle, die verwendet werden soll
  % Output:
  % * y: Wert von int_a^b f(x) dx
  % Ziel: Werte Integral mittels 3 Punkte Gauss


  % Vektor [x_0, x_1, ... x_N]
  % mit x_0 = a und x_N = b
  x = linspace(a,b,N+1);

  y = 0.;
  
  % Summierte 3 Punkte Gauss
  for i=1:N
    diff = (x(i+1)-x(i))/2;
    mean = (x(i+1)+x(i))/2;
    y = y+(5*diff/9*f(mean-diff*sqrt(3/5))+ ...
        8*diff/9*f(mean)+ ...
        5*diff/9*f(mean+diff*sqrt(3/5)));
  end
end
