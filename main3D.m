fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                           REDES NEURAIS ARTIFICIAIS                    |\n');
fprintf('|                              PERCEPTRON SIMPLES                        |\n');
fprintf('|                         (Prof. Ajalmar Rego da Rocha Neto)             |\n');
fprintf('|                     Acadêmico: Raul Gabriel Carvalho de Melo           |\n');
fprintf('|                                IFCE - Maracanaú                        |\n');
fprintf('+------------------------------------------------------------------------+\n');

clc;
close all;

Dif = 10; 
vetorErros = []; 
Epoca = 1;
d = 1;

taxa = 0.1;
qntdPadroes = 500;
offset = 0.1;
MaxEpocas = 100;
Tolerancia = 0.0008; 

Xx = linspace(-1,1,qntdPadroes)';
Yd = 2*Xx + 1;


noise = offset*randn(qntdPadroes,1);
Yd = 2*Xx + 1 + noise;


figure(1); hold on;
% plot3(Xx, Xz, Yd)

A = 2;
B = -1;
C = 1;
D = 1;

[x y] = meshgrid(Xx); % Generate x and y data
z = -1/C*(A*x + B*y + D); % Solve for z data
surf(x,y,z); %Plot the surface

scatter(Xx, Yd,'.', 'red')


X_ones = 1*ones(qntdPadroes, 1);
Xx = [Xx X_ones];
 
W  = randn(1, tam+1)*0.5;