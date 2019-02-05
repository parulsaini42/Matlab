stack = zeros(1,8) ;
top=0;
choice=1;
while choice~=0
  n = input('Enter a number:1)push,2)pop,3)peek');
  switch n
    case 1
        m=input('Enter the number to push');
        push(m);
        disp('stack after push operation');
        disp(stack);
    case 2
        pop();
        disp('stack after pop operation');
        disp(stack);
    case 3
        disp('top element of stack');
        peek()
  end
  choice=input('enter 0 to exit or 1 to continue');
  
end
 
function push(a)
    global top;
    global stack;
    if top<=7
        top=top+1;
        stack(top)=a;  
    else
        disp("cannot push, stack full");
    end
    return
end
 
function pop()
    global top;
    global stack;
    if top==0
        disp("stack is empty, cannot pop");
    else
        stack(top)=0;
        top=top-1;
    end
    return
end
 
function peek()
    global top;
    global stack;
    disp(stack(top));
    return
end


