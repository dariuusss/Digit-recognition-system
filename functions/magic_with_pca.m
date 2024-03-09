function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);

  % initializare train
  train = zeros (m, n);

  % initializare miu
  miu = zeros (1, n);

  % initializare Y
  Y = zeros (m, pcs);

  % initializare Vk
  Vk = zeros (n, pcs);

  % TODO: cast train_mat la double.
  train_mat = double(train_mat);
  % TODO: calculeaza media fiecarei coloane a matricii.
  miu = mean(train_mat);

  % TODO: scade media din matricea initiala.
  train_mat = train_mat - miu;

  % TODO: calculeaza matricea de covarianta.
  train_mat_t = train_mat';
  mat_cov = (train_mat_t * train_mat ) / (m-1);

  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig
  [V,D] = eig(mat_cov);

  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  [valori_proprii,indici] = sort(diag(D),'descend');
  V = V(:,indici);

  % TODO: pastreaza doar primele pcs coloane din matricea obtinuta anterior.
  Vk = V(:,1:pcs);

  % TODO: creaza matricea Y schimband baza matricii initiale.
  Y = train_mat * Vk;

  % TODO: calculeaza matricea train care este o aproximatie a matricii initiale
  % folosindu-va de matricea Vk calculata anterior
  Vk_t = Vk';
  train = Y * Vk_t;
endfunction
