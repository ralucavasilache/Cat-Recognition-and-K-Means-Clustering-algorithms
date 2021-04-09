function [w] = learn(X, y)
  
  [n, m] = size (X);
  # crearea lui X_til
  X_til = X;
  X_til(1:n, m+1) = 1;
  # initializare w
  w = zeros(m + 1, 1);
  # rezolvarea sistemului
  [Q R] = Householder (X_til);
  b = Q' * y;
  w = SST (R, b);
  
endfunction
