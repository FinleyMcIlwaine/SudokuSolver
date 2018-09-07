function [n] = violation_inc(puz,i,j)
% This function finds a possible number to put in an empty sudoku box,
% returning NaN if no number works.

% Find the box the current zero is in.
if 1<=i&&i<=3
    % First tri-row
    if 1<=j&&j<=3
        % First box
        c = [1,1];
    elseif 4<=j&&j<=6
        % Second box
        c = [1,4];
    elseif 7<=j&&j<=9
        % Third box
        c = [1,7];
    end
elseif 4<=i && i<=6
    % Second tri-row
    if 1<=j&&j<=3
        % Fourth box
        c = [4,1];
    elseif 4<=j&&j<=6
        % Fifth box
        c = [4,4];
    elseif 7<=j&&j<=9
        % Sixth box
        c = [4,7];
    end
elseif 7<=i&&i<=9
    % Second tri-row
    if 1<=j&&j<=3
        % Seventh box
        c = [7,1];
    elseif 4<=j&&j<=6
        % Eighth box
        c = [7,4];
    elseif 7<=j&&j<=9
        % Ninth box
        c = [7,7];
    end
end

% Loop through possible numbers.
while puz(i,j) < 10
    % Check for violation
    % First iteration, exclude current number
    if ismember(puz(i,j)+1,puz(:,j)) || ismember(puz(i,j)+1,puz(i,:)) || ...
            ismember(puz(i,j)+1,puz(c(1):c(1)+2,c(2):c(2)+2))
        % This value does not work!
        if puz(i,j)+1 == 9
            n = NaN;
            return
        end
        
        % Check the next number.
        puz(i,j) = puz(i,j) + 1;
        
    else
        % This value works!
        n = puz(i,j) + 1;
        return
    end
end

end


