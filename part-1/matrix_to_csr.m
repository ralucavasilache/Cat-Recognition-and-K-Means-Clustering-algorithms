function [values, colind, rowptr] = matrix_to_csr(A)
  
  n = length(A); #nr de linii din matrice
  nz = 0; #nr de valori nenule din matrice
  rowptr(1,1) = 1;
  for i = 1:1:n
    x = 0; #nr elemente nenule de pe fiecare linie
    for j = 1:1:n
      if(A(i,j) != 0)
        x = x+1;
        nz = nz+1;
        #completarea values cu valirile nenule
        values(1,nz) = A(i,j);
        #completare colind cu indicii coloanelor corespunzatoare
        colind(1,nz) = j;   
       endif
      endfor
        # completare rowptr cu indicii corespunzatori
        # primelor elemente nenule de pe fiecare rand
        rowptr(1,i+1) = rowptr(1,i) + x;
     endfor
        
  
endfunction