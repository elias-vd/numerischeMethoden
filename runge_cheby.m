% Example of Runge with Chebyshev nodes

% number of nodes
N = [4,6,8,12];

% plot cosmetics
line = {'b-','r-','g-','m-','k-'};
leg  = {'f(x)','p_{3}(x)','p_{5}(x)','p_{7}(x)','p_{11}(x)'};
clf();
title('Example of Runge (Chebyshev)');
hold on;

% plot Runge function
xx = linspace(-1,+1,200);
yy = 1./(25.*xx.^2 + 1.);
plot(xx,yy,line{1},'LineWidth',2);

% interpolate for different number of nodes
for i=1:length(N)
  
  n = N(i);
  % TODO: Implement here
  
  plot(xx,yy,line{i+1},'LineWidth',2)
  
end

% more cosmetics
box on;
legend(leg);

% hold off
hold off;

% save figure
print('-f1','-painters','-depsc2','runge_cheby.eps');

