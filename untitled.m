clc
clear all
close all
youxiang=load('youxiang.mat');
jiaodu = load('jiaodu.mat');
shangxian = [1.1,1.8,1.7,1.5,1.6,1.1];
hh = xlsread('附件1-飞行器参数.xlsx')
hh1 = hh(1:6,1:6)
vchu1=0.3;
vchu2=1.5;
vchu3=2.1;
vchu4=1.9;
vchu5=2.6;
vchu6=0.8;
chuyou1 = youxiang.Untitled(:,2)/850;
chuyou2 = youxiang.Untitled(:,3)/850;
chuyou3 = youxiang.Untitled(:,4)/850;
chuyou4 = youxiang.Untitled(:,5)/850;
chuyou5 = youxiang.Untitled(:,6)/850;
chuyou6 = youxiang.Untitled(:,7)/850;
yangfu = jiaodu.jiaodu*pi/180;
youliang_current1 = [vchu1];
youliang_current2 = [vchu2];
youliang_current3 = [vchu3];
youliang_current4 = [vchu4];
youliang_current5 = [vchu5];
youliang_current6 = [vchu6];

for t=2:length(yangfu)
%     if( youliang_current1(t-1)-chuyou1(t)<0||youliang_current1(t-1)==0)
%         youliang_current1(t)=0;
%     else
t
    youliang_current1(t) = youliang_current1(t-1)-chuyou1(t);
%     end
    youliang_current2(t) = youliang_current2(t-1)-chuyou2(t)+chuyou1(t);
    youliang_current3(t) = youliang_current3(t-1)-chuyou3(t);
    youliang_current4(t) = youliang_current4(t-1)-chuyou4(t);
    youliang_current5(t) = youliang_current5(t-1)-chuyou5(t)+chuyou6(t);
    youliang_current6(t) = youliang_current6(t-1)-chuyou6(t);
    [x(t),y(t),z(t)] = compute_zhixin(youliang_current1(t),youliang_current2(t),youliang_current3(t),youliang_current4(t),youliang_current5(t),youliang_current6(t),yangfu(t),hh1);
end
figure(1)
plot(1:length(youliang_current1),youliang_current1)
figure(2)
plot(1:length(youliang_current2),youliang_current2)
figure(3)
plot(1:length(youliang_current3),youliang_current3)
figure(4)
plot(1:length(youliang_current4),youliang_current4)
figure(5)
plot(1:length(youliang_current5),youliang_current5)
figure(6)
plot(1:length(youliang_current6),youliang_current6)
figure(7)
plot3(x,y,z)




