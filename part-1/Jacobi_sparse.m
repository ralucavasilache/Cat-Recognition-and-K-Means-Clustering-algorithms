function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  
  n = length(G_rowptr)-1;
  # vectorul initial cu care se aproximeaza solutia
  prev = zeros(n, 1);
  
  while(1)  
   x = csr_multiplication(G_values, G_colind, G_rowptr, prev) + c;
    # calcularea erorii
    eroare = norm(x - prev);
    if(eroare <= tol) #conditia de oprire - solutia este buna
      return;
    endif
    # prev devine x pentru urmatoarea iteratie
    prev = x;   
  endwhile
  
endfunction