%% gamma 函数绘图
% gamma(x)=int(t^x-1*exp(-t),0,N)=
%% gamma函数密度分布图
x=linspace(10^-3,5,200);
y1 = gampdf(x,1,1);
y2 = gampdf(x,3,1/3);
y3 = gampdf(x,8,1/8);
gampdf_img = plot(x,y1,'k',x,y2,'r',x,y3,'b');
xlabel('X');
ylabel('Gamma Densities');
set(gampdf_img,'LineWidth',2.0);
legend('shape=1','shape=3','shape=8');

%% 累积分布函数
figure(2);
z1 = gamcdf(x,1);
z2 = gamcdf(x,1/3);
z3 = gamcdf(x,1/8);
gamcdf_img = plot(x,z1,'k',x,z2,'r',x,z3,'b');
xlabel('X');
ylabel('Gamma Cumulative Distribution Functions');
set(gamcdf_img,'LineWidth',2.0);
legend('shape=1','shape=3','shape=8');

%% 指数分布的半对数坐标图
figure(3);

gamcdf_scale_img = semilogy(x,y1,'k',x,y2,'r',x,y3,'b');
axis([-1/100 5 0 2]); % 设置坐标轴在指定的区间
xlabel('X');
ylabel('Semilogarithmic scale of the Gamma distribution');
set(gamcdf_scale_img,'LineWidth',2.0);
legend('shape=1','shape=3','shape=8');
