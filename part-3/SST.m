function [x] = SST(A, b)
  [lin, col] = size(A);
  # initializare x
  x = zeros(col, 1);
  # aflarea ultimului element din x
  x(col) = b(col) / A(col,col);
  # aflarea celorlalte elemente din x
  for i = col-1:-1:1
    x(i) = (b(i) - A(i, i + 1:col) * x(i + 1:col)) / A(i, i);
  endfor
endfunction
    