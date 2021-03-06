function [x,y,z] = compute_zhixin(youliang_current1,youliang_current2,youliang_current3,youliang_current4,youliang_current5,youliang_current6,yangfu,hh1)
[x1,y1,z1] = compute_onezhongxin(youliang_current1,yangfu,hh1(1,:));
[x2,y2,z2] = compute_onezhongxin(youliang_current2,yangfu,hh1(2,:));
[x3,y3,z3] = compute_onezhongxin(youliang_current3,yangfu,hh1(3,:));
[x4,y4,z4] = compute_onezhongxin(youliang_current4,yangfu,hh1(4,:));
[x5,y5,z5] = compute_onezhongxin(youliang_current5,yangfu,hh1(5,:));
[x6,y6,z6] = compute_onezhongxin(youliang_current1,yangfu,hh1(6,:));
zong_m = 3000+(youliang_current1+youliang_current2+youliang_current3+youliang_current4+youliang_current5+youliang_current6)*850;
mx = (youliang_current1*x1+youliang_current2*x2+youliang_current3*x3+youliang_current4*x4+youliang_current5*x5+youliang_current6*x6)*850;
my = (youliang_current1*y1+youliang_current2*y2+youliang_current3*y3+youliang_current4*y4+youliang_current5*y5+youliang_current6*y6)*850;
mz = (youliang_current1*z1+youliang_current2*z2+youliang_current3*z3+youliang_current4*z4+youliang_current5*z5+youliang_current6*z6)*850;
x = mx/zong_m;
y = my/zong_m;
z = mz/zong_m;