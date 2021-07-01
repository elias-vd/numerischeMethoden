function y = summsimpsonregel(f,a,b,N)
  % Vektor [x_0, x_1, ..., x_N]
  % mit x_0 = a und x_N = b
  x = linspace(a,b,2*N+1);

  h = (b-a)/N;

  % Werte f in x aus
  fx = f(x);

  % Summierte Simpsonregel
  y = h/6*(fx(1)+2*sum(fx(3:2:end-2)) ...
      +4*sum(fx(2:2:end-1))+fx(end));

end
