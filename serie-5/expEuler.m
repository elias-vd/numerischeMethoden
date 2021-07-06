function [t,y] = expEuler(f,t0,T,y0,N)

% function [t,y] = expEuler(f,t0,T,y0,N)
%
% Zweck: integriere die gewoehnliche Diff.-Gleichung erster Ordnung
%
%          dy/dt = f(t,y(t))
%
%        mit dem expliziten Euler-Verfahren.
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
  h = (T - t0)/N;

% Speicher fuer Zeit & approx. Loesung
  t = zeros(1,N+1);
  y = zeros(length(y0),N+1);

% Setze Anfangswert
  t(1) = t0; % ...
  y(:,1) = y0; % ...

% Integriere mit explizitem Euler-Verfahren
  for k=1:N
    t(k+1) = t(k)+h; % ...
    y(:,k+1) = y(:,k)+h*f(t(k),y(:,k)); % ...
  end
