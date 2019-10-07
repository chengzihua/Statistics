%% 此程序用于实现指数函数绘图
% y = 1/sigma^2*exp(-x/(sigma^2))
%% 指数分布密度函数图
x=linspace(0,7,50);
y1 = exppdf(x,1/2);
y2 = exppdf(x,1);
y3 = exppdf(x,2);
exppdf_img = plot(x,y1,'k',x,y2,'r',x,y3,'b');
xlabel('X');
ylabel('Exponential Densities');
set(exppdf_img,'LineWidth',2.0);
legend('sigma^2 = 1/2','sigma^2 = 1','sigma^2 = 2');

%%  累积分布函数
figure(2);
z1 = expcdf(x,1/2);
z2 = expcdf(x,1);
z3 = expcdf(x,2);
expcdf_img = plot(x,z1,'k',x,z2,'r',x,z3,'b');
xlabel('X');
ylabel('Exponential Cumulative Distribution Functions');
set(expcdf_img,'LineWidth',2.0);
legend('sigma^2 = 1/2','sigma^2 = 1','sigma^2 = 2');

%% 指数分布的半对数坐标图
figure(3);

expcdf_scale_img = semilogy(x,y1,'k',x,y2,'r',x,y3,'b');
axis([0 7 0 2]); % 设置坐标轴在指定的区间
xlabel('X');
ylabel('Semilogarithmic scale of the Exponential distribution');
set(expcdf_scale_img,'LineWidth',2.0);
legend('sigma^2 = 1/2','sigma^2 = 1','sigma^2 = 2');
