clear all;
N = input('Enter the Value of N: ');
IAT = [];
ST = [];
WT = [];
QL = [];
AT = [];
TSE= [];
TSB=[];
TCS=[];
% Initialization 
IAT(1) = 0;
for k = 1:N
IAT(k) = input('Enter interarrival time : ');
end
for k = 1:N
ST(k) = input('Enter Service time : ');
end

AT(1) = IAT(1);
TSE(1) = ST(1);
idle(1)=0;
TSB(1)=0;
for k = 1:N
WT(k) = 0;
QL(k) = 0;
end

%Main code for calcuation of parameters
for i = 2:N
AT(i) = AT(i-1) + IAT(i);
DIFF = AT(i) - TSE(i-1);
if DIFF < 0
   %time service begins
   TSB(i) = TSE(i-1);
   %time service ends/completion time
   TSE(i) = TSE(i-1) + ST(i) ;
   %if arrival of a customer is less the service end time of customer currently being serveced then increment queue. 
   if i>2
      if (AT(i) < TSE(i-1) || QL(i-1) == 0)
          QL(i) = QL(i-1) + 1;
      else
          QL(i) = QL(i-1);
      end
   else
      QL(i) = QL(i-1) + 1;
   end
elseif DIFF > 0
   TSB(i) = AT(i);
   %if arrival of a customer is greater the service end time of customer currently being serveced then decrewment  queue. 
   TSE(i) = AT(i) + ST(i) ;
   if QL(i-1) > 0
   QL(i) = QL(i-1) - 1;
   end
else
   QL(i) = QL(i-1);
end
%waiting time
WT(i) = TSB(i) - AT(i);
%time spent by customer in system(busy time)
TCS(i)=TSE(i)-AT(i);
end

avg_del=sum(WT)/N;
disp("average delay of system");
disp(avg_del);
busy_time=sum(TCS);
avg_util_server=(busy_time/TSE(10))*100;
disp("average delay of system");
s=0;
c=0;
for i = 1:N
   if QL(i)~=0
       s=s+QL(i);
       c=c+1;
   end
end
avg_que_len=s/c;
disp(int16(avg_que_len));
disp("utilization of system");
disp(avg_util_server);
disp("Queue status");
disp(QL)
disp("Arrival times");
disp(AT)
disp("time at which service begins");
disp(TSB)
disp("Waiting time");
disp(WT)
disp("Time at which service ends");
disp(TSE)
disp("Time for which customer is in system");
disp(TCS)



