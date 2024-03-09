function [train_mat, train_val] = prepare_data (name, no_train_images)
  n = 784;

  % initializare train_mat.
  train_mat = zeros (no_train_images, n);

  %initializare train_val.
  train_val = zeros (1, no_train_images);

  % TODO: incarca datele din tabelul primit ca argument.
  % HINT: functia load

  date = load(name);

  % TODO: salveaza in matricea train_mat primele no_train_images linii din
  % tabelul de imagini de antrenament.

  train_mat = date.trainX(1:no_train_images,:);

  % TODO: salveaza in vectorul train_val primele no_train_images valori ale
  % vectorului de etichete.
  train_val = date.trainY(1:no_train_images);
endfunction
