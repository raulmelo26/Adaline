fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                           REDES NEURAIS ARTIFICIAIS                    |\n');
fprintf('|                              PERCEPTRON SIMPLES                        |\n');
fprintf('|                         (Prof. Ajalmar Rego da Rocha Neto)             |\n');
fprintf('|                     Acad�mico: Raul Gabriel Carvalho de Melo           |\n');
fprintf('|                                IFCE - Maracana�                        |\n');
fprintf('+------------------------------------------------------------------------+\n');

clc;
close all;

% Vari�veis iniciais
Dif = 10; 
vetorErros = []; 
Epoca = 1;
d = 1;

taxa = 0.1;
qntdPadroes = 500;
offset = 0.1;
MaxEpocas = 100;
Tolerancia = 0.0008; 

% DADOS ARTIFICIAIS
X = linspace(-1,1,qntdPadroes)';
Yd = 2*X + 1;
reta = Yd;

noise = offset*randn(qntdPadroes,1);
Yd = 2*X + 1 + noise;
retaNoise = Yd;

figure(1); hold on;
plot(X, reta,'black')
scatter(X, retaNoise,'.', 'red')
tam = size(X,2);

X_ones = 1*ones(qntdPadroes, 1);
X = [X X_ones];
 
W  = randn(1, tam+1)*0.5;

while (Dif > Tolerancia) && (Epoca < MaxEpocas)  
    [vetorErros(d),W] = funcEpoca(X,Yd,W,taxa);

    if(Epoca>1)
      Dif = abs(vetorErros(Epoca - 1) - vetorErros(d));
    end
    Epoca = Epoca + 1;
    d = d+1;
   
end 

MSE = mean(vetorErros);
RMSE = sqrt(MSE);
d = std(vetorErros);


fprintf('RMSE: %.3f\n',RMSE);
fprintf('Desvio padr�o: %.3f\n',d);

fprintf('N�mero de �pocas: ');
disp(Epoca);
fprintf('Erro atingido: ');
disp(Dif);

% Formula do livro
retaW = W(1)*X + W(2);
plot(X, retaW,'blue');
title('Regress�o');
legend('Reta real','Erros','Reta Obtida');








