D=1;                      %durata 1sec
Per=40;                   %perioada 40sec
Fr=1/Per;                 %frecventa
t=-2*Per:2*Per;           %rezolutia temporala
N=50;                     %nr de coeficienti:50
w=2*pi*Fr;                %pulsatia
%semnal initial,dreptunghiular
Si=square(w*t,D/Per*100);     
C=zeros(1,N);               % initialiarea coeficientilor  
A=zeros(1,N);               % ca vectori de N zerouri
%semnal reconstruit
Sr=0;                     
for k=1:1:N                                 %reconstruirea semnalului initial
 X=@(t)square(w*t,D/Per*100).*exp(-w*t*1j*(k-25)); %functia
 C(k)=Fr*integral(X,0,Per);  %determinarea
 A(k+1)=2*abs(C(k));         %coeficientilor
 Sr=Sr+C(k)*exp(w*t*1j*(k-25));              %semnalul reconstruit
end
plot(t,Si,"green"),grid,title("Semnalul initial(verde) si cel reconstruit(albastru)"); %graficul semnalului initial
hold on; %pentru pastrarea graficului initial
plot(t,Sr,"blue");  %se suprapun 2 grafice ale celor 2 semnale(initial si reconstruit)
hold off;
figure;
A(1)=A(N+1);
stem(0:N,A,"black"),title("Spectrul de amplitudini");  %afiserea spectrului de amplitudini

% Semnal dreptunghiular, cu durata D=1sec
% Pentru aceasta tema am reconstruit un semnal folosind
% un numar N=50 de coeficienti avand o eroare destul de 
% mica fata de semnalul original. Pentru a obtine o eroare
% cat mai mica, numarul de coeficienti trebuie sa fie cat 
% mai mare. Avem 2 grafice, in primul sunt reprezentate 
% cele 2 semnale suprapuse(initial si reconstruit), iar
% in cel de-al doilea avem spectrul de amplitudini.
