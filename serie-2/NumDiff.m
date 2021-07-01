clc
close all
clear all

x = 1.2;

% Compute the error
I = [1:30];

errors_df = zeros(length(I),1);
errors_ddf = zeros(length(I),1);
resolutions = zeros(length(I),1);

for i=1:length(I)
    h = 1/2^i;
    resolutions(i) = h;

    errors_df(i) = abs( df_e(x) - df(x,h) );
    errors_ddf(i) = abs( ddf_e(x) - ddf(x,h) );
end

figure(1);
disp(errors_df);

loglog(resolutions, errors_df,'-ob');
hold on
loglog(resolutions, errors_ddf,'-or');
hold on 
loglog(resolutions, resolutions.^(2), '--k');


xlabel('h');
ylabel('Fehler');
legend({'erste Ableitung', 'zweite Ableitung', '$\mathcal{O}(h^2)$'}, 'Interpreter', 'latex');

grid minor

saveas(gcf, 'Convergence.eps', 'epsc2');

function y = f(x)
y = sin(x);
end

function y = df_e(x)
y = cos(x);
end

function y = ddf_e(x)
y = -sin(x);
end

function y = df(x,h)
   % Write here your approximation
   y=1/(2*h)*(f(x+h)-f(x-h));
   
end

function y = ddf(x,h)
    % Write here your approximation
    y = 1/(h^2)*(f(x+h)-2*f(x)+f(x-h));
end
