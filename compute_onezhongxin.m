function [x_zhongxin,y_zhongxin,z_zhongxin] = compute_onezhongxin(youliang_current,yangfu,a)

chang = a(4);
kuan = a(5);
gao = a(6);
qidian = [a(1)-chang/2,a(2)-kuan/2,a(3)-gao/2];
ymin = qidian(2);
ymax = ymin+kuan;
zmin = qidian(3);
ceMianji = youliang_current/kuan;
[alt1,alt2] = compute_fanwei(ceMianji,chang,gao);
if(yangfu>alt1)
    zmax = zmin + gao;
    xmin = qidian(1);
    detax = (2*ceMianji/gao-gao/tan(yangfu))/2;
    xmax =@(z) xmin+(gao-(z-zmin))/tan(yangfu)+detax;
elseif(yangfu<=alt1&&yangfu>=alt2)
    
    zmax = zmin + sqrt(ceMianji*tan(yangfu));
    xmin = qidian(1);
    xmax =@(z)xmin + (zmax-z)/tan(yangfu);
elseif(yangfu>-alt2&&yangfu<alt2)
    if(yangfu<0)
        h = -yangfu;
    else
        h=yangfu;
    end
    zmax = zmin + (2*ceMianji/chang+chang*tan(h))/2;
    xmin =qidian(1);
    xmax =@(z)xmin+(zmax-z)/tan(yangfu);
elseif(yangfu<=-alt2&&yangfu>=-alt1)
    xmax = qidian(1)+chang;
    zmax = zmin + sqrt(ceMianji*tan(-yangfu));
    xmin = @(z)xmax - (zmax-z)/tan(-yangfu);
elseif(yangfu<-alt1)
    zmax = zmin + gao;
    xmax =  qidian(1)+chang;
    detax = (2*ceMianji/gao-gao/tan(-yangfu))/2;
    xmin =@(z)xmax-detax-(z-zmax)/tan(-yangfu);
end


x_zhongxin = integral3(@(x,y,z)x,xmin,xmax,ymin,ymax,zmin,zmax,'Method','tiled')/youliang_current;
y_zhongxin = integral3(@(x,y,z)y,xmin,xmax,ymin,ymax,zmin,zmax,'Method','tiled')/youliang_current;
z_zhongxin = integral3(@(x,y,z)z,xmin,xmax,ymin,ymax,zmin,zmax,'Method','tiled')/youliang_current;
end


