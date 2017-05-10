
%-------rising edge detection ------%
clk=[0 0 1 1 0 0 1 1 0 0 1 1 1 0 0 1 0 0 0 0 0 1 1 0 0 1 1 0 0 1 1 1 0 0 1 0 0 0 0 0 1 1 0 0 1 1 0 0 1 1 1 0 0 1 0 0 0 0 0 1 1 0 0 1 1 0 0 1 1 1 0 0 1 0 0 0 0 0 1 1 0 0 1 1 0 0 1 1 1 0 0 1 0 0 0 0 1 0 0 0 1];
thresh=0.5
ind= clk>thresh; %-----------rising edge vector
ind=[0 diff(ind)>0]>0;

t=1:length(clk);

%--------------
s1=randi(300,1, 50);
s2=(-1)*randi(300,1, 50);
s=horzcat(s1,s2);
out=zeros(1, 100);
j=1;


c200=zeros(1,100);
c0=zeros(1,100);
cm200=zeros(1,100);

for i=1:100 
    if ind(i)==1
        c200(1, j)=s(i)>200;
        c0(1, j)=s(i)>0;
        cm200(1, j)=s(i)<-200;
             j=j+1;  
    end

end 

for i=1:100
        if c200(1,i)==1
            out(1,i)=3;
        elseif c0(1,i)==1
            out(1,i)=2;
        elseif cm200(1,i)==0
            out(1,i)=1;
        else 
            out(1,i)=0;
        end
end

outb=cellstr(dec2bin(out,2))';
e=zeros(1,100);
for k=1:100 
    e(1,k)=s(k)*ind(k);
end 
c=1;
eye=zeros(99, 3);
for k=1:98
    eye(k,:)=e(1,c:c+2);
    c=c+1
end

c=1;
a=1;
b=1;
eyeO1=[];
eyeO2=[];
eyeO3=[];
%%eye01=zeros(1);

for k=1:98
    
    if(eye(k,2)>=-300 && eye(k,2)<=-100)
        eyeO1(a)=eye(k,2);
        a=a+1;
    elseif (eye(k,2)>=-100 && eye(k,2)<=100)
        eyeO2(b)=eye(k,2);
        eye(k,2)
        b=b+1
    elseif (eye(k,2)>=100 && eye(k,2)<=300)
        eyeO3(c)=eye(k,2);
        c=c+1;
    end
        
        
end
% 3 cykle zegara zestawiæ ze sob¹ 
% t is here that we introduce SETUP and HOLD time. Setup time is defined as the minimum amount of time before the clock's active edge that the data must be stable for it to be latched correctly. Any violation may cause incorrect data to be captured, which is known as setup violation.
% 
% Hold time is defined as the minimum amount of time after the clock's active edge during which data must be stable. Violation in this case may cause incorrect data to be latched, which is known as a hold violation. Note that setup and hold time is measured with respect to the active clock edge only.