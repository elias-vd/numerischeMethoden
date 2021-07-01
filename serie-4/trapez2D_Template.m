  function Q = trapez2D_Template(f,a,b,Nx,c,d,Ny)

% function trapez2D(f,a,b,N)
%
% Zweck: Berechne Approx. des 2D Integrals von f(x,y) ueber dem Gebiet
%        [a,b] x [c,d] mit (zusammengesetzter) Trapezregel.
%
% Parameters: f   ... zu integrierende Funktion
%             a,b ... linke/rechte Integrations-Grenzen in x-Richtung
%             Nx  ... Anzahl Teil-Intervalle in x-Richtung
%             c,d ... linke/rechte Integrations-Grenzen in y-Richtung
%             Ny  ... Anzahl Teil-Intervalle in y-Richtung
%
% Returns: Q ... Integral Approximation
%
% Notes: Keine.
%

% Berechne Intervall-Laengen in beide Richtungen
  hx = (b - a)/Nx;
  hy = (d - c)/Ny;

% Erstelle die Knoten in x- und y-Richtung
  x = linspace(a,b,Nx+1);
  y = linspace(c,d,Ny+1);

% Erstelle ein Gitter mit den Knoten (x_{i},y_{j})
  [X,Y] = meshgrid(x,y);

% Berechne die Gewichte fuer jeden Knoten im Gitter w_{i,j}
% "ziehe" daf?r die Endpunkte raus wie in der VL
 w = ones(size(X));
 w(2:end-1,2:end-1) = 4;
  
% 2D Quadratur 
  Q = 1/4 * hx * hy * sum(sum(w.*f(X,Y)));

