function [fraction] = fracOfSaddle(rows, columns)

count = 0;
parfor i = 1:10000000
    M = randn(rows,columns);
    if hasSaddle(M)
        count = count+1;
    end
end

fraction = count/10000000;

end
