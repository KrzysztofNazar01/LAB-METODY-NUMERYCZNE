clc
clear all
close all



% set parameters for problem no. 1
a = 1;
b = 60000;
eps = 1e-3;
fun = @time;


[valVector, diffVector, ~, numOfIter] = bisect(a, b, eps, fun);

plot(valVector)
title('Pr.1, M. Bisekcji: przybliżenie wart. N w zależności od numeru iteracji', ' ');
xlabel('Numer iteracji');
ylabel('Wartość N');
saveas(gcf, 'Problem_1_MetBisekcji_Przyblizenie.png');

semilogy(2:numOfIter,diffVector);
title('Pr.1, M. Bisekcji: róznice pomiedzy wartościami N w kolejnych iteracjach', ' ');
xlabel('Numer iteracji');
ylabel('Wartość ΔN');
saveas(gcf, 'Problem_1_MetBisekcji_Roznice.png');


[valVector, diffVector, ~, numOfIter] = secant(a, b, eps, fun);

plot(valVector)
title('Pr.1, M. Siecznych: przybliżenie w zależności od numeru iteracji', ' ');
xlabel('Numer iteracji');
ylabel('Wartość N');
saveas(gcf, 'Problem_1_MetSiecznych_Przyblizenie.png');

semilogy(2:numOfIter,diffVector);
title('Pr.1, M. Siecznych: róznice pomiedzy wartosciami w kolejnych iteracjach', ' ');
xlabel('Numer iteracji');
ylabel('Wartość ΔN');
saveas(gcf, 'Problem_1_MetSiecznych_Roznice.png');



% set parameters for problem no. 2
a = 0;
b = 50;
eps = 1e-12;
fun = @impendancy;


[valVector, diffVector, ~, numOfIter] = bisect(a, b, eps, fun);

plot(valVector)
title('Pr.2, M. Bisekcji: przybliżenie ω w zależności od numeru iteracji', ' ');
xlabel('Numer iteracji');
ylabel('Wartość ω [rad/s]');
saveas(gcf, 'Problem_2_MetBisekcji_Przyblizenie.png');

semilogy(2:numOfIter,diffVector);
title('Pr.2, M. Bisekcji: róznice ω pomiedzy wartosciami w kolejnych iteracjach', ' ');
xlabel('Numer iteracji');
ylabel('Wartość Δω [rad/s]');
saveas(gcf, 'Problem_2_MetBisekcji_Roznice.png');



[valVector, diffVector, fx, numOfIter] = secant(a, b, eps, fun);

plot(valVector)
title('Pr.2, M. Siecznych: przybliżenie ω w zależności od numeru iteracji', ' ');
xlabel('Numer iteracji');
ylabel('Wartość ω [rad/s]');
saveas(gcf, 'Problem_2_MetSiecznych_Przyblizenie.png');

semilogy(2:numOfIter,diffVector);
title('Pr.2, M. Siecznych: róznice ω pomiedzy wartosciami w kolejnych iteracjach', ' ');
xlabel('Numer iteracji');
ylabel('Wartość Δω [rad/s]');
saveas(gcf, 'Problem_2_MetSiecznych_Roznice.png');



% set parameters for problem no. 3
a = 0;
b = 50;
eps = 1e-12;
fun = @speed;


[valVector, diffVector, ~, numOfIter] = bisect(a, b, eps, fun);

plot(valVector)
title('Pr.3, M. Bisekcji: przybliżenie t[s] w zależności od numeru iteracji', ' ');
xlabel('Numer iteracji');
ylabel('Wartość t[s]');
saveas(gcf, 'Problem_3_MetBisekcji_Przyblizenie.png');

semilogy(2:numOfIter,diffVector);
title('Pr.3, M. Bisekcji: róznice pomiedzy wartosciami t[s] w kolejnych iteracjach', ' ');
xlabel('Numer iteracji');
ylabel('Wartość Δt[s]');
saveas(gcf, 'Problem_3_MetBisekcji_Roznice.png');



[valVector, diffVector, ~, numOfIter] = secant(a, b, eps, fun);

plot(valVector)
title('Pr.3, M. Siecznych: przybliżenie t[s] w zależności od numeru iteracji', ' ');
xlabel('Numer iteracji');
ylabel('Wartość t[s]');
saveas(gcf, 'Problem_3_MetSiecznych_Przyblizenie.png');

semilogy(2:numOfIter,diffVector);
title('Pr.3, M. Siecznych: róznice pomiedzy wartosciami t[s] w kolejnych iteracjach', ' ');
xlabel('Numer iteracji');
ylabel('Wartość Δt[s]');
saveas(gcf, 'Problem_3_MetSiecznych_Roznice.png');




