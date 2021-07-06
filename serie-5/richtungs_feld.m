  function richtungs_feld(f,tmin,tmax,Nt,ymin,ymax,Ny)

% function richtungs_feld(f,tmin,tmax,Nt,ymin,ymax,Ny)
%
% Zweck: Zeichne das Rictungsfeld einer skalaren gew. Diff.-Gleichung erster
%        Ordnung
%
%          dy/dt = f(t,y(t))
%
% Parameters: f         ... rechte Seite f(t,y(t)) der Diff.-Gl.
%             tmin,tmax ... min & max Werte fuer Zeit t
%             Nt        ... Anzahl Punkte fuer Zeit t
%             ymin,ymax ... min & max Werte fuer y
%             Ny        ... Anzahl Punkte fuer y
%
% Returns: Keine.
%
% Notes: Keine.
%

% Generiere Gitter
  t = linspace(tmin,tmax,Nt);
  y = linspace(ymin,ymax,Ny);
  [T,Y] = meshgrid(t,y);

% Generiere Richtungsfeld
  DY = f(T,Y);
  DT = ones(size(DY));

% Normiere Richtungsfeld
  L  = sqrt(DT.^2 + DY.^2);
  DT = DT./L;
  DY = DY./L;

% Zeichne Richtungsfeld
  clf;
  quiver(T,Y,DT,DY);

% Plot Kosmetik
  xlim([tmin,tmax]);
  ylim([ymin,ymax]);
  axis square;
