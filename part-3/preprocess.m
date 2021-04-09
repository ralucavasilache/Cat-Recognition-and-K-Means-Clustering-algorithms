function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
   
   # construire path catre fiecare set de imagini
   cats_path = path_to_dataset;
   noncats_path = path_to_dataset;
   cats_path = strcat(cats_path, "cats/");
   noncats_path = strcat(noncats_path, "not_cats/");
   
   # extragere nume pentru fiecare set de imagini
   cats_imgs = getImgNames(cats_path);
   noncats_imgs = getImgNames(noncats_path);
   
   # extragere nr de imagini din fiecare set
   [n1, m1] = size(cats_imgs);
   [n2, m2] = size(noncats_imgs);
   
   # initializare X si y
   X = zeros(n1+n2, 3 * count_bins);
   y = ones(n1+n2, 1);
   
   # completarea vectorului y cu etichetele corespunzatoare
   for i = n1+1:n1+n2
     y(i, 1) = -1;
   endfor
   
   
   for i = 1:n1
     # construire path catre fiecare imagine
     # din setul de date cu imagini care contin pisici
     pic = strcat (cats_path, cats_imgs(i, 1:m1));
     # pentru RGB
     if (strcmp (histogram, "RGB") == 1)
        sol = rgbHistogram (pic, count_bins);
     endif
     # pentru HSV
     if (strcmp (histogram, "HSV") == 1)
        sol = hsvHistogram(pic, count_bins);
     endif
      # completarea lui X
      X(i, 1:3 * count_bins) = sol;
  endfor
  

   for i = 1:n2
     # construire path catre fiecare imagine
     # din setul de date cu imagini care nu contin pisici
     pic = strcat (noncats_path, noncats_imgs(i, 1:m2));
     #pentru RGB
     if (strcmp (histogram, "RGB") == 1)
        sol = rgbHistogram (pic, count_bins);
      endif
      # pentru HSV
      if (strcmp (histogram, "HSV") == 1)
        sol = hsvHistogram (pic, count_bins);
      endif
      # completarea lui X
      X(i + n1, 1:3 * count_bins) = sol;
    endfor
    
endfunction
