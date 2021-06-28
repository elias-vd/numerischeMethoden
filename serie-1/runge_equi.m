% Example of Runge with equidistant nodes

% number of nodes
N = [4,6,8,20];

% plot cosmetics
line = {'b-','r-','g-','m-','k-'};
leg  = {'f(x)','p_{3}(x)','p_{5}(x)','p_{7}(x)','p_{19}(x)'};
clf();
title('Example of Runge (equidistant nodes)');
hold on;

% plot Runge function
xx = linspace(-1,+1,200);
yy = 1./(25.*xx.^2 + 1.);
plot(xx,yy,line{1},'LineWidth',2);

% interpolate for different number of nodes
for i=1:length(N)

  n = N(i);
  % TODO: Implement here
  x = linspace(-1,1,n);
  y = 1./(25.*x.^2 + 1.);
  p = polyfit(x,y,n-1);
  yy = polyval(p,xx);

  plot(xx,yy,line{i+1},'LineWidth',2)

end

% more cosmetics
box on;
legend(leg);

% hold off
hold off;

% save figure
print('-f1','-painters','-depsc2','runge_equi.eps');
