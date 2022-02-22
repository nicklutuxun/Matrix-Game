function [result] = hasSaddle(M)

[numRow, numCol] = size(M);

for i = 1:numRow
    for j = 1:numCol
        result = M(i,j) == min(M(i,:)) && M(i,j) == max(M(:,j));
        if result == true
            return;
        end
    end
end