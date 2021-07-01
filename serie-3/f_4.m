function val = f_4(x,a,b)

%
% Unknown function f_4
% Arguments:
%   x   : evaluation point
%   a,b : interval endpoints
% Function call:
%   f_4(x,a,b)
%

val = 1./sqrt(1 - 0.5*sin(2*pi*(x-a)/(b-a) -1));

