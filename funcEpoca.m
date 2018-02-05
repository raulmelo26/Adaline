function [erroq, W] = funcEpoca(X_vector, Yd_vector, W_vector, taxa) 
Erroq = 0;
Erro = 0;
  index = randperm(size(X_vector,1));
      for i = 1 : size(X_vector,1)
       
        y = W_vector*X_vector(index(i), :)';

        Erro = (Yd_vector(index(i)) - y)';
     
        W_vector =  W_vector + taxa*Erro*X_vector(index(i),:);
       
        Erroq = Erroq + Erro^2;
       
     end 
     W = W_vector;
     erroq = Erroq;
end