function [ sol ] = hsvHistogram(path_to_image, count_bins)
  # initializare variabile
  img = imread(path_to_image);
  sol = zeros(1, 3 * count_bins);
  [n,m] = size(img(:, :, 1));
  H = zeros(n, m);
  S = zeros(n, m);
  V = zeros(n, m);
  R = img(:, :, 1);
  G = img(:, :, 2);
  B = img(:, :, 3);
  R1 = double(R) / 255;
  G1 = double(G) / 255;
  B1 = double(B) / 255;
  Cmax = max(max(R1, G1), B1);
  Cmin = min(min(R1, G1), B1);
  dif = Cmax - Cmin;
     
     # calcularea matricilor H S si V
     H(dif == 0) = 0;
     H(Cmax == R1 & dif != 0) = 60*mod(((G1(Cmax == R1 & dif!=0) - B1(Cmax == R1 & dif!=0))./ dif(Cmax == R1 & dif!=0)), 6);
     H(Cmax == G1 & dif != 0) = 60*(((B1(Cmax == G1 & dif != 0) - R1(Cmax == G1 & dif != 0)) ./ dif(Cmax == G1 & dif!=0)) .+ 2);
     H(Cmax == B1 & dif !=0 ) = 60*(((R1(Cmax == B1 & dif != 0) - G1(Cmax == B1 & dif != 0)) ./ dif(Cmax == B1 & dif !=0 )) .+ 4);
     S(Cmax == 0) = 0;
     S(Cmax != 0) = dif(Cmax != 0) ./ Cmax(Cmax != 0);
     
     H = H / 360;
     V = Cmax;

    count = double(1.01 / count_bins);
    MIN = 0.000001;
  # obtinerea histogramei hsv 
  for i = 1:3*count_bins
    if(i  <= count_bins)
        x = (i - 1) * (count);
        y = ((i - 1) * (count) + count);
        if (abs (y-floor(y)) < MIN)
          y = floor(y);
        endif
        n = length(H(H >= x & H < y ));
        sol(i) = n;
    endif
    
    if(i  > count_bins && i <= 2 * count_bins)
         x = (i - 1 - count_bins) * (count);
        y = ((i -1 - count_bins) * (count) + count);
        if(abs (y - floor(y)) < MIN) 
          y = floor(y);
        endif
        n = length(S(S >= x & S < y ));
        sol(i) = n;
    endif
    
    if(i  > 2 * count_bins )
        x = (i - 1 - 2 * count_bins) * (count);
        y = ((i - 1 - 2 * count_bins) * (count) + count);
        if (abs (y-floor(y)) < MIN)
          y = floor(y);
        endif
        n = length(V(V >= x & V < y ));
        sol(i) = n;
    endif 
    
  endfor
  
endfunction