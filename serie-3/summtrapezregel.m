function y = summtrapezregel(f,a,b,N)
  % Input:
  % * f: function handle fuer Funktion f
  % * [a,b]: Intervall
  % * N: Anzahl der Intervalle, die verwendet werden soll
  % Output:
  % * y: Wert von int_a^b f(x) dx
  % Ziel: Werte Integral mittels summierter Trapezregel aus


  % Vektor [x_0, x_1, ... , x_N]
  % mit x_0 = a und x_N = b
  x = linspace(a,b,N+1);

  h = (b-a)/N;

  % Werte f an x aus
  fx = f(x);

  % Summierte Trapezregel (verwende Vektor-Schreibweise)
  y = (h/2)*( fx(1) + 2*sum(fx(2:end-1)) + fx(end));

end
