function [Q, R] = Householder(A)
	% Q = matricea ortogonala
	% R = matricea superior triunghiulara
	[lin, col] = size(A);
	Q = eye(lin);
	k = min(lin-1, col);
  
	for c = 1 : k
  
    % calculare reflector Householder
    sigma = sign(A(c, c)) * norm(A(c : lin, c));
		vp = zeros(lin, 1);
		vp(c, 1) = A(c, c) + sigma;
		vp(c+1:lin, 1) = A(c + 1:lin, c);
    
		b = sigma * vp(c);
	
		if (b != 0)
      % transformare coloana c din Ap
      A(c + 1:lin, c) = 0;
      A(c, c) = -sigma;

  	  %transformare coloanele 1:col din H
		  for i = 1:lin
		    tau = vp(c:lin, 1)' * Q(c:lin, i) / b;
		    Q(c:lin, i) = Q(c:lin, i) - tau * vp(c:lin, 1);
		  endfor
      
      %transformare coloanele c+1:col din Ap
      for i = c + 1 : col
		    tau = vp(c:lin, 1)' * A(c:lin, i) / b;
		    A(c:lin, i) = A(c:lin, i) - tau * vp(c:lin, 1);
		  endfor
    
    endif
  
  endfor 
	R = A;
	Q = Q';
endfunction
