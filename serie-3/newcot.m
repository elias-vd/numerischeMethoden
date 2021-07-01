  function [x,w] = newcot(a,b,n)

% function [x,w] = newcot(a,b,n)
%
% Parameters: a,b ... lower and upper integration limits
%             n   ... number of quadrature nodes
%
% Returns:    x,w ... Newton-Cotes quadratue nodes and weights
%
% Notes: Use with care!
%

  % setup equidistant quadrture nodes in reference intervall [0,1]
  if ( n > 1 )
    x = linspace(0,1,n);
  else
    x = 0.5;
  end

  % setup Vandermonde matrix (transpose due to the stupid matlab definition!)
  V = vander(x)';

  % precision conditions
  c = 1./(n:-1:1)';

  % get quadrature weiths
  w = V\c;

  % scale quadrature nodes & weights to intervall [a,b]
  x = a + x*(b - a);
  w = (b - a)*w';

