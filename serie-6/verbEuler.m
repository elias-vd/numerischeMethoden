function [t,y] = verbEuler(f,t0,T,y0,N)

% function [t,y] = verbEuler(f,t0,T,y0,N)
%
% Zweck: integriere die gewoehnliche Diff.-Gleichung erster Ordnung
%
%          dy/dt = f(t,y(t))
%
%        mit der verbesserten Polygonzugmethode von Euler.
%
% Parameters: f    ... rechte Seite f(t,y(t)) der gew. Diff.-Gl.
%             t0,T ... Start- und End-Zeit
%             y0   ... Anfagswert
%             N    ... Anzahl Schritte
%
% Returns: t ... Zeiten
%          y ... approx. Loesung zu Zeiten t
%
% Notes: Keine.
%

% Berechne Zeitschritt
  h = (T-t0)/N;

% Speicher fuer Zeit & approx. Loesung
  t = zeros(1,N+1);
  y = zeros(length(y0),N+1);

% Setze Anfangswert
  t(1)   = t0;
  y(:,1) = y0;

% Integriere mit der verbesserten Polygonzugmethode von Euler
  for j=1:N
    t(j+1) = t(j)+h;
    k1 = f(t(j),y(:,j));
    k2 = f(t(j)+h/2, y(:,j)+ k1*(h/2));
    y(:,j+1) = y(:,j) + h*k2;
  end
