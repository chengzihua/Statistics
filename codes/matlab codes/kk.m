%% �����ı��ļ��е����ݡ�

filename = 'E:\matlab study\���ݷ���\urban.dat';
delimiter = ' ';
startRow = 2;
formatSpec = '%*q%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
% ���ı��ļ���
fileID = fopen(filename,'r');
%���ݸ�ʽ�ַ�����ȡ�����С�
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% �ر��ı��ļ���
fclose(fileID);

%% ���޷���������ݽ��еĺ���
% �ڵ��������δӦ���޷���������ݵĹ�����˲�����������롣Ҫ�����������޷���������ݵĴ��룬�����ļ���ѡ���޷������Ԫ����Ȼ���������ɽű���

%% �����������
urban = [dataArray{1:end-1}];
%% �����ʱ����
clearvars filename delimiter startRow formatSpec fileID dataArray ans;
nbins = size(urban,1)*size(urban,2);
figure(1);
subplot(2,2,1)
hist_GUA_1 = histogram(urban,nbins);
xlabel('Intensities');
ylabel('Number');
title('Complete Histogram')
subplot(2,2,2)
hist_GUA_2 = histogram(urban,nbins);
axis([0 5e+6 0 800]);
xlabel('Intensities');
ylabel('Number');
title('Restricted Histogram')

%%����ָ�����
histfit_data_1 = get_res_data(urban,8e+4);
histfit_data_2 = get_res_data(urban,2e+5);
histfit_data_3 = get_res_data(urban,5e+5);
lamda = 1/mean(histfit_data);
x=0:1:5e+6;
y1 = lamda*sum(histfit_data_1).*exp(-lamda*x);
y2 = lamda*sum(histfit_data_2).*exp(-lamda*x);
y3 = lamda*sum(histfit_data_3).*exp(-lamda*x);
figure(2);
hist_GUA_3 = histogram(urban,nbins);
hold on
axis([0 3e+6 0 800]);
exppdf_img = plot(x,y1,'c',x,y2,'r',x,y3,'b');
% set(exppdf_img,'LineWidth',2.0);
legend('Number','Threshold=8e+4 ','Threshold = 2e+5','Threshold=5e+5');
xlabel('Intensities');
ylabel('Number');
title('Restricted Histogram')
