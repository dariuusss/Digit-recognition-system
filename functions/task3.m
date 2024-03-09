function new_X = task3 (photo, pcs)
  [m, n] = size (photo);

  % initializare matrice finala.
  new_X = zeros (m, n);

  % TODO: cast photo la double.
  photo = double(photo);

  % TODO: calculeaza media fiecarui rand al matricii.
  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.

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

  % TODO: calculeaza matricea de covarianta.

  photo_t = photo';
  Z = photo * photo_t;
  Z = Z / (n-1);

  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig

  [V,S] = eig(Z);

  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.

  [dim1,dim2] = size(V);
  aux = zeros(dim1,1);
  [dim3,dim4] = size(S);
  for i=1:dim3-1
    for j=i+1:dim4
      if S(i,i) <= S(j,j)
        aux(1:dim1,1:1) = V(1:dim1,i:i);
        V(1:dim1,i:i) = V(1:dim1,j:j);
        V(1:dim1,j:j) = aux(1:dim1,1:1);
        schimba = S(i,i);
        S(i,i) = S(j,j);
        S(j,j) = schimba;
      endif
    endfor
  endfor





  % TODO: pastreaza doar primele pcs coloane
  % OBS: primele coloane din V reprezinta componentele principale si
  % pastrandu-le doar pe cele mai importante obtinem astfel o compresie buna
  % a datelor. Cu cat crestem numarul de componente principale claritatea
  % imaginii creste, dar de la un numar incolo diferenta nu poate fi sesizata
  % de ochiul uman asa ca pot fi eliminate.

  W = V(1:dim1,1:pcs);

  % TODO: creaza matricea Y schimband baza matricii initiale.

  W_t = W';
  Y = W_t * photo;

  % TODO: calculeaza matricea new_X care este o aproximatie a matricii initiale

  new_X = W * Y;

  % TODO: aduna media randurilor scazuta anterior.
   for i=1:m
     new_X(i,1:n) = new_X(i,1:n) + miu(1,i);
   endfor

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction
