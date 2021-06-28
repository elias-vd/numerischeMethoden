function plot_board(A)
    
    N = size(A,1);
    s = 1:N;
    [X,Y] = meshgrid(s,s);
    
    mymap = [0.9 0.9 0.9; 0 1 0];
    
    figure;
    sz = 1500;
    scatter(X(:), Y(:), sz, A(:), 'filled', 's')
    colormap(mymap);
    grid on
end
