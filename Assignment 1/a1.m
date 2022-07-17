clc
clear
a=input("Enter upto what time do you want the analysis ")
n=input("How many intervals do you want to divide the time into? ")
d= a/(n+1);
i=1;
v1(1)=0;
vel(1)=0;

for t=d:d:a
    v1(i+1)=v1(i)+ d*( (( 7050/8050)*9.8)-((9*v1(i))/(2*10^(-7)*8050)) );
    vel(i+1)=analytical(t);
    i=i+1;
    
end
t= 0:d:a;
plot(t,v1,'r--',t,vel,'g-');
xlabel("time");
ylabel("velocity");
legend('numerical','Analytical');

function vel = analytical(t)
vel= 7050*(2/9)*10^(-7)*9.8*(1-exp(  (-9/2)*(10^7)*t/8050 ));
end