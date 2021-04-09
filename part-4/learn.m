function [w] = learn(X, y, lr, epochs)
  # dimensiunile lui X
  [n m] = size(X);
  # scalarea
  for i = 1:m
    X(:, i) = (X(:, i) - mean(X(:, i))) / std(X(:, i));
  endfor
  
  # construire X_til
  X_til = X;
  X_til(1:n, m+1) = 1;
  #initializare Xbatch si ybatch
  Xbatch = zeros(64,m+1);
  ybatch=zeros(64,1);
  # alegere w
  w = -0.1+ (0.1+0.1).*rand(m+1,1);
  
  # algoritmul din enunt
  for  c = 1:epochs  
      # alegere 64 de linii random
      k = randperm(n);
      for i = 1:64
        Xbatch(i,:) = X_til(k(i), :);
        ybatch(i,1) = y(k(i),1);
      endfor
      for i = 1 : m + 1
        s = sum(  (Xbatch(1:64, :) * w - ybatch(1:64)) .* Xbatch(1:64, i), 1);
        w(i) = w(i) - (lr/n) * s;   
      endfor
  endfor
  
endfunction
