% Anfangswert und Endzeit
Q0 = 0;
I0 = 0;
T = 2;

% Konstanten
L = 1;
R = 2;
C = 0.0016;

% Anregung
E0 = 10;
w = 100;
E = @(t) anregung(t, E0, w);

% Rechte seite
% f = @(t,Z) [Z(2); (E(t)-R*Z(2)-Z(1)/C)/L];% ...
f = @(t,Z) [Z(2); (E(t)-Z(1)/C-R*Z(2))/L];

% Anfangswert setzen
Z0 = [Q0;I0];

% Loese mit explizitem Euler Verfahren
N = T*10^4;
[t,Z] = expEuler(f,0,T,Z0,N);


% Steady state solution
q0 = E0/sqrt( (L*w^2 - 1./C)^2 + (R*w)^2 );
phase = atan(L*w/R - 1./(R*C*w));

Q = @(t) charge(t,q0,w,phase);
q = Q(t);

I = @(t) current(t,q0,w,phase);
i = I(t);

err_charge = norm(Z(1,:) - q)/norm(q);
err_current = norm(Z(2,:) - i)/norm(i);

fprintf('Error in Q: %f\n', err_charge)
fprintf('Error in I: %f\n', err_current)

% Plotte die Approximative und die Exakt Loesung
figure;
plot(t,Z')

hold on
plot(t,q,'k--')

hold on
plot(t,i,'k-')
legend('Q', 'I', 'Q_{steady}', 'I_{steady}')

function E = anregung(t, E0, w)
  E = E0*cos(w*t);
end

function q = charge(t, q0, w, phase)
  q = q0*sin(w*t - phase);
end

function i = current(t, q0, w, phase)
  i = w*q0*cos(w*t - phase);
end
