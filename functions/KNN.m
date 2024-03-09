function prediction = KNN (labels, Y, test, k)
  % initializeaza prediction
  prediction = -1;

  % initializeaza distantele
  [m, n] = size (Y);
  distance = zeros (m, 1);

  % TODO: pentru fiecare rand calculati distanta Euclidiana dintre acesta si
  % vectorul de test primit ca argument.

  for j=1:m
    distance(j) = norm(Y(j,:) - test , 2);
    endfor

  % TODO: ordonati crescator distantele si tineti minte intr-un vector primele
  % k valori care reprezinta valorile adevarate ale acestor imagini care s-au
  % dovedit a fi cele mai apropiate.
  % Hint [~,aux] = sort (...)
  [~,indici] = sort(distance,"ascend");
  k_cei_mai_aprp = labels(indici(1:k));
  % TODO: calculati predictia ca mediana celor k valori cele mai apropiate.
  prediction = median(k_cei_mai_aprp);
endfunction
