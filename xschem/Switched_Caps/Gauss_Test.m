clc
clear all
close all

x = -5:0.001:15;
y = 2*exp(-(((x-4).^2)./(3^2)));

plot(x,y)

found1 = [];
found2 = [];

for i = 1:(length(x) - 1)
    if (y(i) <= 2/sqrt(2)) & (y(i+1) >= 2/sqrt(2))
        found1 = [x(i), x(i+1)];
    end
    
    if (y(i) >= 2/sqrt(2)) & (y(i+1) <= 2/sqrt(2))
        found2 = [x(i), x(i+1)];
    end
end

integ = trapz(x,y)

boo = x == 4;
ind = find(boo);
i = 1;
integ2 = 0;
while integ2 < (0.341*integ)
    x2 = [x(ind):0.001:x(ind+i)];
    y2 = 2*exp(-(((x2-4).^2)./(3^2)));
    integ2 = trapz(x2, y2);
    i = i+1;
end

ender = x2(end);
go = ender-4;
x3 = [go:0.001:ender];
y3 = 2*exp(-(((x3-4).^2)./(3^2)));

integ3 = trapz(x3, y3)

x4 = found1(1):0.001:found2(1);
y4 = 2*exp(-(((x4-4).^2)./(3^2)));

integ4 = trapz(x4, y4)