clc
clear
delt=0.001;
n=10^5;
r(1,1)=0;
r(1,2)=0;
r(1,3)=0;
m=10^4;
msd=zeros(m,1);
fileid=fopen('diya.txt','w');
fprintf(fileid,"MSD        delt* \n");

for i= 1:n
    uvector=2.*rand(1,3)-[1,1,1];
    uvector=uvector./norm(uvector);
    r(i+1,:)=sqrt(6*delt).*uvector+r(i,:);

end

for i=1:m
    
    for j= 1:m+1-i
        msd(i,1)=msd(i,1)+sum((r(j+i,:)-r(j,:)).^2);   
    end
    msd(i,1)=msd(i,1)./(m+1-i);
    xaxis(i,1)=i*delt;
end
figure(1)   
plot(r(:,1),r(:,2));
xlabel("x*");
ylabel("y*");


figure(2)

plot([0;xaxis],[0;msd]);
xlabel("t*");
ylabel("MSD");
P=polyfit([0;xaxis(1:5)],[0;msd(1:5)],1);
msd(:,2)=xaxis(:,1);
fprintf(fileid,"%f %f\n",msd');
fclose(fileid);
diffusivity=P(1,1)/6

    