%%%%%%%%%%% Md Shakahwat Hossen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% pDF of Kappa mu fading channel %%%% %%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
kappa=3.0000001; % values of fading parameters
mu =3.50;
N=10^6;
m = sqrt( kappa/((kappa+1))) ; % Mean of in phase and quadrature
%component
s = sqrt( 1/(2*(kappa+1)) );%variance of in phase and quadrature
 %component
ni=zeros(1,N); nq=zeros(1,N);
 for j=1:2*mu
 if mod(j,2)==1
 norm1=m/sqrt(2)+s*randn(1,N);
 ni=ni+norm1.^2;
 else
 norm2=m/sqrt(2)+s*randn(1,N);
 nq=nq+norm2.^2;
 end
 end
 h=sqrt(ni+nq)/sqrt(mu);
 theta = 2*pi*rand(1,N);
 h=h.*cos(theta)+sqrt(-1)*h.*sin(theta);
 %% To obtain non uniform phase of the generated coefficients
 % sn=[?1 1];
 % h=(sn((rand(1,N)>0.5)+1).?sqrt(ni) ...
 %+sn((rand(1,N)>0.5)+1).?sqrt(?nq))/sqrt(mu);
 habs=abs(h);
 ksdensity(habs.^2); 
 hold on; %Plots the PDF of envelope
 ksdensity(habs); %Plots the PDF of power
 
