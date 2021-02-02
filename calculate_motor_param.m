
data = load('motor.txt')
% convert rpm to rad/s
data(:,3) = data(:,3)./9.5492965964254;
% convert thrust from gram to N
data(:,4) = data(:,4)./1000*9.81;
% convert pwm from 1000~2000 to 0~1
data(:,2) = (data(:,2)-1000).*1e-3;

figure;
plot(data(:,2), data(:,3), 'b*');
p=polyfit(data(1:5,2),data(1:5,3),1);
x = 0.2:0.01:1;
y = p(1)*x+p(2);
hold on;
plot(x,y,'r-')
xlabel('pwm,0~1');
ylabel('motor speed, rad/s');

k = p(1)
p = p(2)

figure;
plot(data(:,3), data(:,4), 'b*');
p=polyfit(data(1:5,3),data(1:5,4),2);
x = 100:10:1200;
y = p(1)*x.^2+p(2)*x+p(3);
hold on;
plot(x,y,'r-')
xlabel('motor speed, rad/s');
ylabel('thrust, N');

cT = p(1)