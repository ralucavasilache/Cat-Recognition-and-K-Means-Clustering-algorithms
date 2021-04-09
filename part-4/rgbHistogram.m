function [sol] = rgbHistogram(path_to_image, count_bins)
  
  img = imread (path_to_image); # citire imagine
  sol = zeros (1, count_bins);
  count = 256 / count_bins;
  [n, m] = size (img(:, :, 1));
  MIN = 0.0000001;
  
  for i = 1:3 * count_bins
    # primele count_bins potizii destinate pt. R
    if(i  <= count_bins)
        x = (i - 1) * (count);
        y = ((i - 1) * (count) + count);
        if ( abs (y-floor(y)) < MIN)
            y = floor(y);
        endif
        n = length ( img ( img(:, :, 1) >= x & img(:, :, 1) < y ));
        sol(i) = n;
    endif
    
    # urmatoarele count_bins potizii destinate pt. G
    if(i  > count_bins && i <= 2 * count_bins)
        x = (i - 1 - count_bins) * (count);
        y = ((i -1 - count_bins) * (count) + count);
        if ( abs (y - floor(y)) < MIN) 
          y = floor(y);
        endif
        n = length ( img ( img(:, :, 2) >= x & img(:, :, 2) < y ));
        sol(i) = n;
    endif
    
    # ultimele count_bins potizii destinate pt. B
    if(i  > 2 * count_bins )
        x = (i - 1 - 2 * count_bins) * (count);
        y = ((i - 1 - 2 * count_bins) * (count) + count);
        if ( abs (y - floor(y)) < MIN)
          y = floor(y);
        endif
        n = length ( img ( img(:, :, 3) >= x & img(:, :, 3) < y ));
        sol(i) = n;
    endif    
  endfor
endfunction
