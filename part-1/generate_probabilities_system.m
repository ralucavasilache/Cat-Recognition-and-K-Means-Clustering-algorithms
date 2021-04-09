function [A, b] = generate_probabilities_system(rows)
 
 # nr. de linii din matricea A
 n = rows*(rows+1)/2; 
 # initializare A si b
 A = zeros(n,n);
 b = zeros(n,1);
 # primele x valori din b vor fi nule
 x = n - rows;
 
 # completare valori nenule
 for i = x+1:1:n
   b(i,1) = 1;
endfor
  # completare matrice
  for i = 1:1:rows
    for j=1:1:i
      A(index(i, j), index(i, j)) = nrVecini(i, j, rows);
      if (j!= i) 
        A(index(i, j), index( i, j+1)) = -1;
        A(index(i, j), index(i-1, j)) = -1;
      endif
      
      if( j!= 1)
      A(index(i, j), index(i, j-1)) = -1;
      A(index(i, j), index(i-1, j-1)) = -1;
      endif
      
      if(i != rows)
      A(index(i, j), index(i+1, j)) = -1;
      A(index(i, j), index(i+1, j+1)) = -1;
      endif 
        
    endfor
  endfor
  
endfunction

# calculeaza numerele din piramida pe baza indicilor i si j
function nr = index(i, j)
  nr = i * (i-1) / 2 + j;
endfunction

# functia verifica cati vecini are un anumit numar din piramida
function nr = nrVecini(i, j, rows)
  # colturile vor avea 4 vecini (2 pereti si 2 numere)
  if((i == 1)|| (i == rows && j == 1) || (i == rows && j == rows))  
    nr = 4;
  # numerele de pe laturi vor avea 5 vecini
  else if((j == 1) || (i == rows) || (i == j))
    nr = 5;
  # restul vor avea 6 vecini
  else nr = 6;
endif
endif
endfunction
