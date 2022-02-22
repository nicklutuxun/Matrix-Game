function [pMefirst,qMefirst,pYoufirst,qYoufirst] = matrixgame(M)
  [m,n] = size(M);

  % me first
  bin = zeros(n,1);
  beq = 1;
  f = [zeros(m,1);-1];
  Ain = -[M',-1*ones(n,1)];
  Aeq = [ones(1,m),0];
  lb = [zeros(m,1);-Inf];
  ub = [Inf(m+1,1)];
  
  options = optimoptions('intlinprog','Display','off');
  pMefirst = intlinprog(f,[],Ain,bin,Aeq,beq,lb,ub,[],options);
  pMefirst = pMefirst(1:m);
  qMefirst = zeros(n,1);
  [~,I] = min(sum(repmat(pMefirst,1,n).*M));
  qMefirst(I,1) = 1;

  % you first
  bin = zeros(m,1);
  beq = 1;
  f = [zeros(n,1);1];
  Ain = -[M,ones(m,1)];
  Aeq = [-1*ones(1,n),0];
  lb = [-Inf(n+1,1)];
  ub = [zeros(n,1);Inf];
  options = optimoptions('intlinprog','Display','off');
  qYoufirst = -intlinprog(f,[],Ain,bin,Aeq,beq,lb,ub,[],options);
  qYoufirst = qYoufirst(1:n);
  pYoufirst = zeros(m,1);
  [~,I] = max(sum(M*qYoufirst,2));
  pYoufirst(I,1) = 1;
end