  function [Q,grid] = adaptsimp(f,a,b,tol,maxlevel)

% function adaptsimp(f,a,b,tol,maxlevel)
%
% Zweck: approximiere das bestimmte Integral von f(x) von a bis b bis
%        auf die Toleranz tol mit adaptiver Simpson Quadratur und maximum
%        Verfeinerungs-Level maxlevel
%
% Parameters: f        ... die zu integrierende Funktion 
%             a,b      ... linke/rechte Integrations-Grenzen
%             tol      ... Toleranz
%             maxlevel ... Maximale Anzahl Verfeinerungen
%
% Returns: Q    ... Integral Approximation
%          grid ... das adaptive Gitter fuer Q
%
% Notes: Keine.
%

% Berechne erste Approx. mit Simpson-Regel ueber das ganze Intervall
  fa = f(a);
  fm = f(0.5*(a + b));
  fb = f(b);
  grid = [a,0.5*(a + b),b];
  Q = (b - a)*(fa + 4.*fm + fb)/6.;

% Verfeinere die Approx. mit adaptiver Simpson Quadratur
  [Q,grid] = adaptsimpe(f,a,b,tol,fa,fm,fb,Q,maxlevel,grid);

% Unique & sort das adaptive Gitter
  grid = sort(unique(grid));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  function [Q,grid] = adaptsimpe(f,a,b,tol,fa,fm,fb,Q,level,grid)

% function adaptsimpe(f,a,b,tol,fa,fm,fb,Q,level,grid)
%
% Zweck: Rekursiver Schritt fuer adaptive Simpson Quadratur. Diese Funktion
%        ist nur da um den User von dem muehsamen fa,fb,Q,... Inputs zu
%        befreien.
%
% Parameter: f        ... die zu integrierende Funktion
%            a,b      ... linke/rechte Integrations-Grenzen
%            tol      ... Toleranz
%            f{a,m,b} ... Funktionauswertungen f(a), f(m) & f(b) (m = (a+b)/2)
%            Q        ... derzeitige Approx. des Integrals mit der Simpson-
%                         Regel ueber [a,b]
%            level    ... derzeitiges Verfeinerungs level
%            grid     ... derzeitiges adaptives Gitter
%
% Returns: Q    ... Integral Approximation
%          grid ... das adaptive Gitter fuer Q
%
% Notes: Keine.
%

% Berechne Fehler-Schaetzer durch anwenden der Simpson-Regel auf
% halb-Intervalle
  m  = 0.5*(a + b);
  ml = 0.25*(3.*a + b);
  gridl = cat(2,grid,[ml]);
  fml = f(ml);
  Ql = (m - a)*(fa + 4.*fml + fm)/6.;
  mr = 0.25*(a + 3.*b);
  gridr = cat(2,grid,[mr]);
  fmr = f(mr);
  Qr = (b - m)*(fm + 4.*fmr + fb)/6.;
  E2 = abs(Q - (Ql + Qr))/15.;

% Ueberpruefe ob Toleranz erreicht
  if ( E2 < tol ) % Toleranz erreicht?
    grid = cat(2,gridl,gridr);
    Q = Ql + Qr;
  else % Verfeinere das Intervall falls moeglich
    if ( level == 0 ) % Maximale Verfeinerung erreicht!
      fprintf('Warnung: Maximale Verfeinerung erreicht!\n');
      grid = cat(2,gridl,gridr);
      Q = Ql + Qr;
    else % Verfeinere
      [Ql,gridl] = adaptsimpe(f,a,m,0.5*tol,fa,fml,fm,Ql,level-1,gridl);
      [Qr,gridr] = adaptsimpe(f,m,b,0.5*tol,fm,fmr,fb,Qr,level-1,gridr);
      grid = cat(2,gridl,gridr);
      Q = Ql + Qr;
    end
  end

