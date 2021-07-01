  function [x,w] = gauleg(a,b,n)

% function [x,w] = gauleg(a,b,n)
%
% Parameters: a,b ... lower and upper integration limits
%             n   ... number of quadrature nodes
%
% Returns:    x,w ... Gauss-Legendre quadratue nodes and weights
%
% Notes: Algorithm from Press et al., "Numerical Recipes in FORTRAN: The Art
%        of Scientific Computing", Cambridge University Press, 1993
%

  % precision
  tol = eps; % we want machine accuracy!

  % initialize quadrature nodes & weights arrays
  x = zeros(1,n); 
  w = zeros(1,n); 

  % find quadrature nodes & weights
  m = floor((n + 1)/2);
  xm = 0.5*(a + b);
  xl = 0.5*(b - a);
  for i=1:m
    % initial guess for i-th root
    z = cos(pi*(i - 0.25)/(n + 0.5));
    % find i-th root with Newton's method
    while ( true )
      p1 = 1.;
      p2 = 0.;
      for j=1:n
        p3 = p2;
        p2 = p1;
        p1 = ((2.*j - 1.)*z*p2 - (j - 1.)*p3)/j;
      end
      pp = n*(z*p1 - p2)/(z*z - 1.);
      dz = p1/pp;
      z = z - dz;
      if ( abs(dz) < tol )
        break
      end
    end
    % set i-th quadrature node & weight
    x(    i) = xm - xl*z;
    x(n+1-i) = xm + xl*z;
    w(    i) = 2.*xl/((1. - z*z)*pp*pp);
    w(n+1-i) = w(i);
  end

