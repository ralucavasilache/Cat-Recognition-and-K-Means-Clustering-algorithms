function [G_J, c_J] = Jacobi_factorization(A, b)
    # initializare n-nr de linii
    # si a matricei D - diagonala
    n = length(A);
    D = zeros(n,n);
    # inversa matricei D
    for i=1:1:n
      D_inv(i,i) = 1/A(i,i);
    endfor
    # construirea matricei P = L + U
    P = -A;
    for i = 1:1:n
      P(i,i) = 0;
    endfor
    # calculare G_J - matricea de iteratie,
    # c_J - vector de iteratie
    G_J = D_inv*P;
    c_J = D_inv*b;
    
endfunction
