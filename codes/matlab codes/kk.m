%% 导入文本文件中的数据。

filename = 'E:\matlab study\数据分析\urban.dat';
delimiter = ' ';
startRow = 2;
formatSpec = '%*q%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
% 打开文本文件。
fileID = fopen(filename,'r');
%根据格式字符串读取数据列。
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% 关闭文本文件。
fclose(fileID);

%% 对无法导入的数据进行的后处理。
% 在导入过程中未应用无法导入的数据的规则，因此不包括后处理代码。要生成适用于无法导入的数据的代码，请在文件中选择无法导入的元胞，然后重新生成脚本。

%% 创建输出变量
urban = [dataArray{1:end-1}];
%% 清除临时变量
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

%%进行指数拟合
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
