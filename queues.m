
queue = zeros(1,8) ;
front=0;
last=0;
choice=1;
while choice~=0
n = input('Enter a number:1)insert,2)delete');
  switch n
    case 1
        m=input('Enter the number to insert');
        if last>8
        disp("cannot insert, queue full");
        else
          last=last+1;
          queue(last)=m;
          if front==0
              front=last;
          end    
        end
        disp(queue);
    case 2
        if front>last | front==0
        disp("queue is empty, cannot delete");
        else
        queue(front)=0;
        front=front+1;
        disp(queue(front:8));
        end
  end  
choice=input('enter 0 to exit or 1 to continue');
  
end


  