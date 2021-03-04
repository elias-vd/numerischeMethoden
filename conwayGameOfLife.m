% Conway's Game of Life
clear; clc; close all;

num_iter = 4;

N = 8;
board = zeros(N);
neigh = zeros(N);


% initial pattern: oscillator
board(2,2) = 1;
board(3,2) = 1;
board(2,3) = 1;
board(4,5) = 1;
board(4,3) = 1;
board(5,6) = 1;
board(6,5) = 1;
board(6,6) = 1;


% initial pattern: beacon
% board(3,3) = 1;
% board(3,4) = 1;
% board(4,3) = 1;
% board(4,4) = 1;
% board(5,5) = 1;
% board(5,6) = 1;
% board(6,5) = 1;
% board(6,6) = 1;

% initial pattern: glider
% board(1,1) = 1;
% board(2,2) = 1;
% board(2,3) = 1;
% board(3,1) = 1;
% board(3,2) = 1;
 
for i = 1:num_iter
    plotBoard (board); 
    board = next_genration(board, N);
end

function b = next_genration(board, N)
old_board = board;
for x = 1:N
    for y = 1:N
        alive = old_board(y, x);
        n = neighbours(old_board, y, x, N);
        
        % Eine lebende Zelle mit weniger als zwei lebenden Nachbarn stirbt
        % an Einsamkeit.
        if (alive == 1) && (n < 2)
            board(y, x) = 0;
        end
        
        % Eine lebende Zelle mit zwei oder drei lebenden Nachbarn bleibt am
        % Leben.
        if (alive == 1) && (n == 2 || n == 3)
            board(y, x) = 1;
        end
        
        % Eine lebende Zelle mit mehr als drei lebenden Nachbarn stirbt an
        % Überbevölke-rung.
        if (alive == 1) && (n > 3)
            board(y, x) = 0;
        end
        
        % Eine tote Zelle mit genau drei lebenden Nachbarn wird neu
        % geboren.
        if (alive == 0) && (n == 3)
            board(y, x) = 1;
        end
    end
end
b = board;
end

function n = neighbours(board, y, x, N)
    n = 0;
    
    % Linker Nachbar
    if x > 1
        n = n + board( y, x-1 );
    end
    
    % Rechter Nachbar
    if x < N
        n = n + board( y, x+1 );
    end
    
    % Nachbar Oben
    if y > 1
        n = n + board( y-1, x );
    end
    
    % Nachbar Unten
    if y < N
        n = n + board( y+1, x );
    end
    
    % Nachbar Oben-Rechts
    if (y > 1) & (x > 1)
        n = n + board( y-1, x-1 );
    end
    
    % Nachbar Oben-Links
    if (y > 1) & (x < N)
        n = n + board( y-1, x+1 );
    end
    
    % Nachbar Unten-Rechts
    if (y < N) & (x > 1)
        n = n + board( y+1, x-1 );
    end
    
    % Nachbar Unten-Rechts
    if (y < N) & (x < N)
        n = n + board( y+1, x+1 );
    end
end