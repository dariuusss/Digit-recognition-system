function prediction = classifyImage (im, train_mat, train_val, pcs)
  % initializare predictie.
  prediction = -1;

  % TODO: cast im la double.
  im = double(im);
  % TODO: aplica functia magic_with_pca setului de date de antrenament.
  [train,miu,Y,Vk] = magic_with_pca(train_mat,pcs);

  % TODO: scade din vectorul imagine media fiecarei coloane din train_mat.
  train = train - miu;

  % TODO: schimbati baza inmultind cu matricea Vk.
  im = im - miu;
  im = im * Vk;

  % TODO: calculati predictia folosindu-va de metoda k nearest neighbour
  % implementata anterior cu k = 5.
  prediction = KNN(train_val,Y,im,5);
endfunction
