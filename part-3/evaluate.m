function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  
  [X, y] = preprocess(path_to_testset, histogram, count_bins);
  # dimensiunile lui X
  [n, m] = size(X);
  # dimensiunile lui y
  [a, b] = size(y);
  # construire X_til
  X_til = X;
  X_til(1:n, m+1) = 1;
  # vectorul de etichete rezultat prin 
  # aplicarea algoritmului
  out = ones(a,1);
  
  for i =1:n
    # calculare produs scalar
    k = sum(w'  .*  X_til(i,  :));
    # completare out
    if(k < 0)
      out(i, 1) = -1;
    endif
  endfor
  
  # correct = numarul de valori din y si out care coincid
  [correct, k] = size (y (out == y));
  percentage = correct / a;
   
  endfunction