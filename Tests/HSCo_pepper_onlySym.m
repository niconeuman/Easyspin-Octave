%Este programa simula un espectro de polvo, creando una malla de phi y
%theta, y luego calculando los espectros para cada orientacion, y
%sumandolos con factores de intensidad adecuados.

clear all, close all

Bmin = 0; %in mT
Bmax = 500;
Freq = 9.456; %Frecuencia en Hz

g1 = [5.197 0 0;0 4.134 0;0 0 3.4];

Sys.S = 0.5;
Sys.g = g1;
Sys.Nucs = '59Co';
Sys.A = [500 0 0;0 400 0;0 0 300]; %MHz
Sys.lwpp = [0 2]; %mT

Vary.g = [0.2 0 0;0 0.2 0;0 0 0.2];
Vary.A = [50 0 0;0 50 0;0 0 50];

Exp.Range = [Bmin Bmax];
Exp.nPoints = 8192;
Exp.mwFreq = Freq;

[B,SimSpc] = pepper(Sys,Exp);

plot(B,SimSpc/max(SimSpc),'-r');



