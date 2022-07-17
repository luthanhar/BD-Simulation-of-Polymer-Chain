clc
clear
v=500;
delt=0.001;
n=10^5;
r1=zeros(3,1);
r2=zeros(3,1);
r2(1,1)=sqrt(500);
rms=0;
fileid=fopen('diya.txt','w');
fprintf(fileid,"Rend*        delt* \n");

for i= 1:n
    uvector1=2*rand(3,1)-1;
    uvector1=uvector1/norm(uvector1);
    uvector2=2*rand(3,1)-1;
    uvector2=uvector2/norm(uvector2);
    Rend=r2(:,i)-r1(:,i);
    normi(i)=norm(Rend);
    rms=rms+normi(i)^2;
    Rend2=(normi(i)/v)^2;
    S=delt*(3-Rend2)/((1-Rend2)*v);
    r1(:,i+1)=r1(:,i)+ sqrt(6*delt)*uvector1  +  S*Rend;
    r2(:,i+1)=r2(:,i)+ sqrt(6*delt)*uvector2  -  S*Rend;

end
Rend(:,n+1)=r2(:,n+1)-r1(:,n+1);
normi(n+1)=norm(Rend(:,n+1));
rms=sqrt((rms+normi(n+1)^2)/(n+1));
disp("RMS VALUE IS : ")
disp(rms);
time=[0:0.001:n*delt];
rmsv=repelem(rms,n+1);

figure(1)   
plot(  time,normi,'b-',time,rmsv,'k-');
legend("Rend*","RMS value");
xlabel("t*");
ylabel("Rend*");


fprintf(fileid,"%f    %f\n",[normi;time]);
fclose(fileid);