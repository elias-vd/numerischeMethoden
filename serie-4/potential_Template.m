% Parameter
a = -1.;
b = +1.;
c = -1.;
d = +1.;
Nx = 128;
Ny = 128;

% 1: Punkt (2,2)
xp = 2.;
yp = 2.;
f = @(x,y) 1./sqrt((x - xp).^2 + (y - yp).^2);
I1 = 1.4493948762686699; % exacter Wert
Q1 = trapez2D_Template(f,a,b,Nx,c,d,Ny)

% 2: Punkt (10,10)
xp = 10.;
yp = 10.;
f = @(x,y) 1./sqrt((x - xp).^2 + (y - yp).^2);
I2 = 0.2830800703857426; % exacter Wert
Q2 = trapez2D_Template(f,a,b,Nx,c,d,Ny)

% 3: Punkt (20,20)
xp = 20.;
yp = 20.;
f = @(x,y) 1./sqrt((x - xp).^2 + (y - yp).^2);
I3 = 0.1414508706242226; % exacter Wert
Q3 = trapez2D_Template(f,a,b,Nx,c,d,Ny)

