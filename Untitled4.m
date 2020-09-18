clc
close all 
clear all
x =load('x.mat')
y =load('y.mat')
z =load('z.mat')
plot3(x.x(1),y.y(1),z.z(1),'k.')
hold on
plot3(x.x,y.y,z.z,'r*')