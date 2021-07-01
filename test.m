
a = -1.;
b = +1.;
c = -1.;
d = +1.;
% Nx = 10;
% Ny = 10;
Nx = 128;
Ny = 128;


% 1: Punkt (2,2)
xp = 2.;
yp = 2.;
f = @(x,y) 1./sqrt((x - xp).^2 + (y - yp).^2);
hx = (b - a)/Nx;
hy = (d - c)/Ny;

x = linspace(a,b,Nx+1);
y = linspace(c,d,Ny+1);

[X,Y] = meshgrid(x,y);
w = ones(size(X));
w(2:end-1,2:end-1) = 4;

Q = 1/4 * hx * hy * sum(sum(w.*f(X,Y)))
I1 = 1.4493948762686699


