  function f = f_streuung(t,z)

% function f = f_streuung(t,z)
%
% Zweck: Berechne rechte Seite fuer Streuung im Lennard-Jones Potential
%        Diff.-Gl.
%
% Parameters: t ... Zeit
%             z ... Loseungsvektor (Beachte Konvention in den Notes unten!)
%
% Returns: f ... rechte Seite fuer Streuung
%
% Notes: Wir verwenden folgende Konvention
%
%          z(t) = [x(t),vx(t),y(t),vy(t)]^T
%
%        und damit fuer die rechte Seite
%
%          f(t,z(t)) = [vx(t),-gradU_x,vy(t),-gradU_y]^T
%
%        Anstatt y fuer den Loesungsvektor verwenden wir z um Verwechslungen
%        mit der y-Koordinate des Teilchens zu vermeiden
%

% berechne x- & y-Komponenten von grad(U)
  x = z(1);
  y = z(3);
  r_2 = x^2 + y^2;
  F_x = -4*(6/r_2^4 - 12/r_2^7)*x;
  F_y = -4*(6/r_2^4 - 12/r_2^7)*y;

% berechne rechte Seite der Diff.-Gl.
  f =[ z(2) ; F_x ; z(4) ; F_y ];
  
  % ...
