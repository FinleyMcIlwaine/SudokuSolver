function [ sol ] = back_solve( puz )
% This function solves a sudoku puzzle using the backtracking algorithm.

% Find and store the zero elements of puz.
[row,col] = find(puz==0);
z = [row col];

% Begin solving!
k = 1;
count = 0;
while k <= length(z)
    % Define the indices of the zero.
    i = z(k,1);
    j = z(k,2);
    
    % Check if we have been here before.
    if puz(i,j) ~= 0
        % Hello again!
        % Check if the number is already 9, if so set to NaN.
        if puz(i,j) == 9
            puz(i,j) = NaN;
        else
        % Increment this value by 1, and check for violations.
        puz(i,j) = violation_inc(puz,i,j);
        end
        if isnan(puz(i,j))
            % A number could not be found. Set it to zero, go back, and
            % increment by 1.
            puz(i,j) = 0;
            k = k - 1;
        else
            % A number was found. Continue.
            k = k + 1;
        end
    else
        % Increment the value, check for violations and move to the next 
        % zero.
        puz(i,j) = violation_inc(puz,i,j);
        if isnan(puz(i,j))
            % A number could not be found. Set it to zero, go back, and
            % increment by 1.
            puz(i,j) = 0;
            k = k - 1;
        else
            % A number was found. Continue.
            k = k + 1;
        end
    end
    count = count + 1;
    if k == 0
        k = 1;
    end
end
sol = puz;
end

