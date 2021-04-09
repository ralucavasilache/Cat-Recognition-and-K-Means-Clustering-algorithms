function [centroids] = clustering_pc(points, NC)
   
    [n,d] = size(points);
    # fiecare linie i ii este coresp clusterului i
    # fiecare liie i contine : pe pozitia 1 - nr de 
    # puncte care revin clusterului i, pe urmatoarele pozitii
    # indicii corespunzatori punctelor
    clust = zeros(NC, 10);
    centroids = zeros(NC, d);
    centroids_next = zeros(NC, d);
    poz = 0;
    MAX = 1000000;
    MIN = 0.00001;
  #initializare cluster conform cerintei
    for i = 1:1:n
        x = mod(i, NC);
        if(x == 0)
            x = NC;
        endif
        clust(x, 1) = clust(x, 1) + 1;
        clust(x, clust(x, 1) + 1) = i;
    endfor
 
  # calculare centroizi initiali
    for i = 1:NC
        for j = 2:clust(i, 1)+1
            centroids(i, :) = centroids(i, :) + points(clust(i, j), :);
        endfor
        centroids(i,:) = centroids(i, :)/clust(i,1);
    endfor
    
    # golire lista clustere
    for i = 1:NC
        clust(i,1) = 0;
    endfor


    while(1)
        #redistribuire puncte in cluster
        dist = MAX;
        for i = 1:n
            for j = 1:NC
                if ((abs (norm (points(i, :) - centroids(j, :)))) <= dist)
                  dist = abs (norm (points(i, :) - centroids(j, :)));
                  poz = j;
                endif
            endfor
            clust(poz, 1) = clust(poz, 1) + 1;
            clust(poz , clust(poz, 1)+1) = i;
            dist = MAX;
         endfor

         #calcuare centrozi noi
         for i = 1:NC
            for j = 2:clust(i, 1)+1
                centroids_next(i, :) = centroids_next(i, :) + points(clust(i, j), :);
            endfor
            if(clust(i, 1) != 0)
                centroids_next(i, :) = centroids_next(i,: ) / clust(i, 1);
            endif
         endfor

       #compararea centroids si centroids_next
         if (abs (norm (centroids-centroids_next)) <= MIN) # conditia de oprire
            return;
         else 
            centroids = centroids_next; # altfel, algoritmul continua
         endif
         # golire lista clustere
         for i = 1:NC
             clust(i, 1) = 0;
         endfor
         # reinitializare centroids_next
         centroids_next = zeros(NC, d);
          
    endwhile
 
endfunction
