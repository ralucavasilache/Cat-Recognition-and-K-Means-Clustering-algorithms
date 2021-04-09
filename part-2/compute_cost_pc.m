function [cost] = compute_cost_pc(points, centroids)
 
  cost = 0;
  [n, d] = size (points);
  [NC, d] = size (centroids);
  
    for i = 1:n
      #initializare dist cu distanta de la punct la primul centroid
      dist = abs ( norm ( points(i, :) - centroids(1, :)));
      #calcularea distantei minime
      for j = 2:NC
        if (abs (norm (points(i, :) - centroids(j, :))) < dist)
           dist = abs (norm (points(i, :) - centroids(j, :)));
        endif
       endfor
       #calculare cost
       cost = cost + dist;
    endfor
     
endfunction