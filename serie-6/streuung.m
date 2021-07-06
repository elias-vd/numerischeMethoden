% Berechne Trajektorien
t0 = 0.;
T  = 15.;
N = 1000;
for itraj=1:5
  y0 = [-10.,+1.,0.25 + 0.5*(itraj - 1),0.];
  if     ( itraj == 1 ) % Trajektorie 1
    [t,y1] = expEuler(@fstreuung,t0,T,y0,N);
  elseif ( itraj == 2 ) % Trajektorie 2
    [t,y2] = expEuler(@fstreuung,t0,T,y0,N);
  elseif ( itraj == 3 ) % Trajektorie 3
    [t,y3] = expEuler(@fstreuung,t0,T,y0,N);
  elseif ( itraj == 4 ) % Trajektorie 4
    [t,y4] = expEuler(@fstreuung,t0,T,y0,N);
  elseif ( itraj == 5 ) % Trajektorie 5
    [t,y5] = expEuler(@fstreuung,t0,T,y0,N);
  end
end

% Zeichne Trajektorien
clf();
hold on;
plot(y1(1,:),y1(3,:),'-','LineWidth',2,'DisplayName','b = 0.25');
plot(y2(1,:),y2(3,:),'-','LineWidth',2,'DisplayName','b = 0.75');
plot(y3(1,:),y3(3,:),'-','LineWidth',2,'DisplayName','b = 1.25');
plot(y4(1,:),y4(3,:),'-','LineWidth',2,'DisplayName','b = 1.75');
plot(y5(1,:),y5(3,:),'-','LineWidth',2,'DisplayName','b = 2.25');
legend('show','Location','northwest');
xlabel('x');
ylabel('y');
box on;
hold off;
