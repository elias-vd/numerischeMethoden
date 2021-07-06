% Logistische Diff.-Gl.
a = 1.;
b = 2.;
f = @(t,y) (a - b*y).*y;

%% Zeichne Richtungsfeld
N = 20;
tmin = 0;
tmax = 5;
ymin = 0;
ymax = 1;

richtungs_feld(f,tmin,tmax,N,ymin,ymax,N)

%% Loese mit explizitem Euler-Verfahren (Anfangswert 0.2)
t0 = 0;
T = 5;
y0 = 0.2;
N = 100;
[t,y1] = expEuler(f,t0,T,y0,N);



%% Loese mit explizitem Euler-Verfahren (Anfangswert 1)
y0 = 1;
[t,y2] = expEuler(f,t0,T,y0,N);

%% Zeichne beide Loesungen ins Richtungsfeld
hold on;
plot(t,y1,'r-')
plot(t,y2,'m-')
xlabel('t')
ylabel('y')
hold off;
