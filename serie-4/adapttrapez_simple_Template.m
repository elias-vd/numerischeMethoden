  function Q = adapttrapez_simple(f,a,b,tol)

%% function Q = adapttrapez_simple(f,a,b,tol)
%
% Zweck: approximiere das bestimmte Integral von f(x) von a bis b bis
%        auf die Toleranz tol mit adaptiver Trapez Quadratur
%
% Parameters: f   ... die zu integrierende Funktion 
%             a,b ... linke/rechte Integrations-Grenzen
%             tol ... Toleranz
%
% Returns: Q ... Integral Approximation
%
% Notes: Als Fehler-Schaetzer wird der in Bsp. (14) & (15) verwendet.
%

%% Berechne Fehler-Schaetzer
fa = f(a);
fab = f((a+b)/2);
fb = f(b);
Q1 = (b-a)/2 * (fa+fb);
Q2 = (b-a)/4 * (fa+2*fab+fb);
e = 1/3 * abs(Q1+Q2);

%% Ueberpruefe ob Toleranz erreicht


if e < tol
    Q = Q2
else
    Qn = adapttrapez_simple(f,a,(a+b)/2,tol/2);
    Qm = adapttrapez_simple(f,(a+b)/2,b,tol/2);
    Q = Qn + Qm;
end

end 

