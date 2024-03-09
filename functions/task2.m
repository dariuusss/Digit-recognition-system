function new_X = task2 (photo, pcs)
  [m n] = size(photo);

  % initializare matrice finala.
  new_X = zeros(m, n);

  % TODO: cast photo la double.
  photo = double(photo);

  miu = zeros(1,m);
  for i = 1:m

    for j = 1:n
      miu(1,i) = miu(1,i) + photo(i,j);
    endfor

    miu(1,i) = miu(1,i) / n;

  endfor

  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  for i = 1:m
    photo(i,1:n) = photo(i,1:n) - miu(1,i);
  endfor

  % TODO: construieste matricea Z.

  Z = photo';
  Z = Z / sqrt(n-1);

  % TODO: calculeaza matricile U, S si V din SVD aplicat matricii Z

  [U,S,V] = svd(Z);
  % TODO: construieste matricea W din primele pcs coloane ale lui V
    [nr_linii,nr_coloane] = size(V);
    W = V(1:nr_linii,1:pcs);

  % TODO: cacluleaza matricea Y

  W_t = W';
  Y = W_t * photo;
  % TODO: aproximeaza matricea initiala

   new_X = W * Y;
   for i=1:m
     new_X(i,1:n) = new_X(i,1:n) + miu(1,i);
   endfor

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction
