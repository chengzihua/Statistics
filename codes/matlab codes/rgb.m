%% ���������ڴ���sarͼ��
clc;clear
A=imread('ESAR_RGB_Annot.png');
B1 = A(:,:,1);
B2 = A(:,:,2);
B3 = A(:,:,3);
%ѡ���������
urban_area = A(1200:1599,300:1050,:);
figure(1)
imshow(urban_area)
%���������Ϊ�Ҷ�ͼ��
gray_urban_area=rgb2gray(urban_area);
%��������ĻҶ�ͼ��ֱ��ͼ
hist_GUA = imhist(gray_urban_area);
%ֱ��ͼ���⻯
histeq_urban_img =histeq(gray_urban_area,256);
histeq_urban =  imhist(histeq_urban_img);
%���ƾ�����ֱ��ͼͼ��
figure(2);
subplot(2,2,1);
imshow(gray_urban_area);
title('Grayscale image');
subplot(2,2,2);
bar(hist_GUA)
xlabel('Grayscale Value');
ylabel('Histogram');
subplot(2,2,3);
imshow(histeq_urban_img);
title('Balanced histogram image');
subplot(2,2,4);
bar(histeq_urban);
xlabel('Grayscale Value');
ylabel('Balanced histogram');

%��ԭʼ���ݽ��м�����Ȼ����
histfit_data = get_all_data(gray_urban_area);
mu = mean(histfit_data);
sigma = var(double(histfit_data));
x=0:300;
histfit_y = normpdf(x,mu,sqrt(sigma));
%����ͼ��
figure(3);
bar(hist_GUA/sum(hist_GUA));
hold on
hist_img = plot(histfit_y,'r-');
xlabel('Grayscale Value');
ylabel('Gaussian density');
set(hist_img,'LineWidth',2.0);
axis([0 300 0 1e-2]);
