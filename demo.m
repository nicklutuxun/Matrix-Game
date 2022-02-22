% A = zeros(6,6);
% rows = [2:7];
% columns = [2:7];

% load("table.mat")
% tic
% for row = 2:7
%     for column = 2:7
%         fraction = fracOfSaddle(row,column);
%         A(row-1,column-1) = fraction;
%     end
% end
% toc

% T = array2table(A, 'VariableNames',string(columns),'RowNames',string(rows))

M = [-1 2 -2 0 1;
     -2 -1 3 2 0;
     2 1 0 -1 -2;
     0 0 2 1 1;
     1 -1 0 -2 1];

% M = [1 -3 6 -9 10;
%      -8 6 4 2 -12;
%      6 -2 8 -2 -1];

% M = [1 -3 6 -9 10;
%      -8 6 4 2 -12;
%      10 12 8 11 20];
[pMefirst,qMefirst,pYoufirst,qYoufirst] = matrixgame(M)

v1 = expectedValue(pMefirst,qMefirst,M)
v2 = expectedValue(pYoufirst,qYoufirst,M)
v3 = expectedValue(pMefirst,qYoufirst,M)
v4 = expectedValue(pYoufirst,qMefirst,M)
