%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%actividad 1

%a) Desplegar la imagen original y su histograma (comando MATLAB imhist)

figure (1)
%imagen pinos
p = imread ('pinos512.tif');
subplot(1,2,1);
imshow(p);
title('Pinos Original');

%histograma
subplot(1,2,2);
imhist(p)
title('Histograma');
ylim([0 14000]);

%b) Ecualizar el histograma de la imagen (comando MATLAB histeq). Desplegar la imagen resultante y el histograma ecualizado.

figure (2)
%imagen pinos ecualizada 
p_eq = histeq(p);
pos0 = [0.1 0.6 0.79 0.37];
subplot('Position',pos0)
imshow(p_eq);
title('Pinos Ecualizada');

%histoograma de imagen pinos 
pos1 = [0.04 0.03 0.45 0.56];
subplot('Position',pos1)
imhist(p)
title('Histograma Original');
ylim([0 14000]);


%histograma de imagen pinos ecualizada 

pos2 = [0.52 0.03 0.45 0.56];
subplot('Position',pos2)
imhist(p_eq);
title('Histograma Ecualizado');
ylim([0 14000]);


%c) Ecualizar el histograma usando 128, 64, 32, 16, 8 y 2 niveles de cuantización. Desplegar las imágenes e histogramas resultantes.

figure (3)

%imagen pinos ecualizada a 128
p_eq128 = histeq(p,128);
pos0 = [0.0 0.54 0.165 0.50];
subplot('Position',pos0);
imshow(p_eq128);
title('Ecualizada 128');

%Historgrama pinos ecualizada 128

pos1 = [0.0 0.03 0.16 0.50];
subplot('Position',pos1)
imhist(p_eq128);
title('Histograma Ecualizado 128');
ylim([0 14000]);


%imagen pinos ecualizada a 64
p_eq64 = histeq(p,64);
pos2= [0.167 0.54 0.165 0.50];
subplot('Position',pos2)
imshow(p_eq64);
title('Ecualizada 64');

%Historgrama pinos ecualizada 64
pos3 = [0.1634 0.03 0.16 0.50];
subplot('Position',pos3)
imhist(p_eq64);
title('Histograma Ecualizado 64');
ylim([0 14000]);

%imagen pinos ecualizada a 32
p_eq32 = histeq(p,32);
pos4 = [0.3333 0.54 0.165 0.50];
subplot('Position',pos4)
imshow(p_eq32);
title('Ecualizada 32');

%Historgrama pinos ecualizada 32

pos5 = [0.328 0.03 0.165 0.50];
subplot('Position',pos5)
imhist(p_eq32);
title('Histograma Ecualizado 32');
ylim([0 14000]);

%imagen pinos ecualizada a 16
p_eq16 = histeq(p,16);
pos6 = [0.50 0.54 0.165 0.50];
subplot('Position',pos6)
imshow(p_eq16);
title('Ecualizada 16');

%Historgrama pinos ecualizada 16

pos7 = [0.497 0.03 0.165 0.50];
subplot('Position',pos7)
imhist(p_eq16);
title('Histograma Ecualizado 16');
ylim([0 14000]);

%imagen pinos ecualizada a 8
p_eq8 = histeq(p,8);
pos8 = [0.6666 0.54 0.165 0.50];
subplot('Position',pos8)
imshow(p_eq8);
title('Ecualizada 8');

%Historgrama pinos ecualizada 8
pos9 = [0.665 0.03 0.165 0.50];
subplot('Position',pos9)
imhist(p_eq8);
title('Histograma Ecualizado 8');
ylim([0 14000]);

%imagen pinos ecualizada a 2
p_eq2 = histeq(p,2);
pos10 = [0.8333 0.54 0.165 0.50];
subplot('Position',pos10)
imshow(p_eq2);
title('Ecualizada 2');

%Historgrama pinos ecualizada 2
pos11 = [0.833 0.03 0.165 0.50];
subplot('Position',pos11)
imhist(p_eq2);
title('Histograma Ecualizado 2');
ylim([0 14000]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Actividad 2

%a) Desplegar las imágenes satelitales cortando o eliminando las zonas donde la información es nula. Desplegar además el histograma correspondiente a cada una de ellas.

figure (4)
zonaA = imread ('zona_A.tif');
zonaB = imread ('zona_B.tif');
subplot(2,2,[1,2]);
imshow(zonaA);
title('zona A');
subplot(2,2,[3,4]);
imshow(zonaB);
title('zona B');


figure (5)
%imagenes cortadas 
zonaAc = imcrop(zonaA,[0 0 1700 1500]);%zona A recortada 
zonaBc = imcrop(zonaB,[1701 0 2500 1500]);%zona B recortada
%zona A
subplot(2,2,1);
imshow(zonaAc);
title('Zona A');

%Histograma A
subplot(2,2,2);
imhist(zonaAc)
title('Histograma zona A');
ylim([0 40000]);

%zona B
subplot(2,2,3);
imshow(zonaBc);
title('Zona B');

%Histograma B
subplot(2,2,4);
imhist(zonaBc)
title('Histograma zona B');
ylim([0 40000]);


%b) Desplegar el mosaico que resulta de unir las dos imágenes satelitales sin el uso de la técnica de especificación del histograma.

figure (6)
union = [zonaAc,zonaBc];
subplot(1,2,1);
imshow(union)
title('Union de Imagenes');

subplot(1,2,2)
imhist(union);
title('Histograma de Union');

%c) Desplegar la zona de traslape y su histograma.

figure (7)
unionC = imcrop(union,[800 0 900 1500]);%zona de traslape 
%Imagen de zona de traslape 
subplot(1,2,1);
imshow(unionC);
title('Zona de traslape');

%Histograma zona de trslape
subplot(1,2,2)
imhist(unionC);
title('Histograma de zona A y B unidas');

%d) Desplegar las imágenes satelitales recortadas, cuyos histogramas han sido especificados con el histograma del inciso anterior. Desplegar además el histograma correspondiente a cada una de ellas.

figure (8)
%Especificacion de zona A recortada con la zona de Traslape
zonaA_Tu = imhistmatch(zonaAc,unionC);
subplot(2,2,1);
imshow(zonaA_Tu);
title('Zona A especificada de Zona Traslape')

%Histrograma de especificacion de zona A recortada con la zona de Traslape
subplot(2,2,2);
imhist(zonaA_Tu);
title('Histrograma zona A especificada de Zona Traslape')
ylim([0 90000]);

%Especificacion de zona B recortada con la zona de Traslape
zonaB_Tu = imhistmatch(zonaBc,unionC);
subplot(2,2,3);
imshow(zonaB_Tu);
title('Zona B especificada de Zona Traslape')

%Histrograma de especificacion de zona B recortada con la zona de Traslape
subplot(2,2,4);
imhist(zonaB_Tu);
title('Histograma Zona B especificada de Zona Traslape')
ylim([0 90000]);


%e) Desplegar el mosaico que resulta de unir las dos imágenes satelitales después de la especificación del histograma. Desplegar también el histograma del mosaico

figure (9)

%imagen de zona A y B especificadas unidas a 128
unionEsp = [zonaA_Tu,zonaB_Tu];
subplot(1,2,1);
imshow(unionEsp);
title('Union de Zona A y B especificadas');

%histograma de zona A y B especificadas unidas 
subplot(1,2,2);
imhist(unionEsp);
title('Histograma de Zona A y B especificadas')

%f) Especificar el histograma del mosaico usando 128, 64, 32, 16, 8 y 2 niveles de cuantización.

figure (10)

zonaB_T = imhistmatch(zonaBc, zonaA);%Especificacion de la zona B
zonaA_T = imhistmatch(zonaAc, zonaB); %Especificacion de la zona A
unionEspe = [zonaA_T,zonaB_T]; %union despues de ser especificadas

%imagen a 128 niveles de especificacion
f_eq128 = histeq(unionEspe,128);
pos0 = [0.0 0.54 0.165 0.50];
subplot('Position',pos0);
imshow(f_eq128);
title('imagnen a  128 niveles');

%Historgrama  a 128 niveles de especificacion
pos1 = [0.0 0.03 0.16 0.50];
subplot('Position',pos1)
imhist(f_eq128);
title('Histograma a 128 niveles');



%imagen  a 64 niveles de especificacion
f_eq64 = histeq(unionEspe,64);
pos2= [0.167 0.54 0.165 0.50];
subplot('Position',pos2)
imshow(f_eq64);
title('imagen a 64 niveles');

%Historgrama a 64 niveles de especificacion
pos3 = [0.1634 0.03 0.16 0.50];
subplot('Position',pos3)
imhist(f_eq64);
title('Histograma a 64 niveles');


%imagen a 32 niveles de especificacion
f_eq32 = histeq(unionEspe,32);
pos4 = [0.3333 0.54 0.165 0.50];
subplot('Position',pos4)
imshow(f_eq32);
title('Imagen a 32 niveles');

%Historgrama a 32 niveles de especificacion
pos5 = [0.328 0.03 0.165 0.50];
subplot('Position',pos5)
imhist(f_eq32);
title('Histograma a 32 niveles');


%imagen  a 16 niveles de especificacion
f_eq16 = histeq(unionEspe,16);
pos6 = [0.50 0.54 0.165 0.50];
subplot('Position',pos6)
imshow(f_eq16);
title('Imagne a 16 niveles');

%Historgrama a 16 niveles de especificacion

pos7 = [0.497 0.03 0.165 0.50];
subplot('Position',pos7)
imhist(f_eq16);
title('Histograma a 16 niveles');


%imagen  a 8 niveles de especificacion
f_eq8 = histeq(unionEspe,8);
pos8 = [0.6666 0.54 0.165 0.50];
subplot('Position',pos8)
imshow(f_eq8);
title('Imagen 8 niveles');

%Historgrama a 8 niveles de especificacion
pos9 = [0.665 0.03 0.165 0.50];
subplot('Position',pos9)
imhist(f_eq8);
title('Histograma a 8 niveles');


%imagen  a 2 niveles de especificacion
f_eq2 = histeq(unionEspe,2);
pos10 = [0.8333 0.54 0.165 0.50];
subplot('Position',pos10)
imshow(f_eq2);
title('Imagen a 2 niveles');

%Historgrama a 2 niveles de especificacion
pos11 = [0.833 0.03 0.165 0.50];
subplot('Position',pos11)
imhist(p_eq2);
title('Histograma a 2 niveles');



