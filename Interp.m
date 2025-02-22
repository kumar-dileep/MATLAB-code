linterp = @fun;                %Initilizing function. Run linterp(x,v,xq) from command window
function aq = fun(x, v, xq);    % Defining function Aq: Resultant linear interpolated values.
    [a1, b1]=size(x);  
    [a2, b2]=size(v);
    [a3, b3]=size(xq);

    if a1>1
        x=x';   %To convert x into row matrix if entered x is a column matrix.
    end

    if a2>1
        v=v' %To convert v into row matrix if entered v is a column matrix.

    end
   
    if a3>1
        xq=xq' %To convert xq into row matrix if entered xq is a column matrix.

    end

    if length(x)~=length(v)
        fprintf('Error: Size of sample points and their values must be same');
    return;
    end


    mxv= cat(1,x,v);           % Cancatenate x and v;
    sxv=sortrows(mxv');        % Sort values x in ascending order, along with respective values of v.
    x=sxv(:,1);                % Seperate x
    v=sxv(:,2) ;               % Seperate v
    %%%%The following six line for detecting repeated values in x   %%%% 
    xc=circshift(x,-1);
        xd=x-xc;
        if any(xd == 0)
            fprintf('Sample point must be unique');
            return;
        end
    %%%%%%%%%%%%%end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    xq=xq';                  %Defined xq where interpolated data to be detemined.
    I=discretize(xq,x);     % Determining location in x (nearby or equal) for each elements of xq
    m= find(~isnan(I)) ;    % results location of non-NaN elements of I.
    n=rmmissing(I);         % Results non-NaN elements of I.
    xq=xq' ;                % Transpose 
    xqs=xq(m)'  ;           % xqs results in m non-NaN elements of xq.
    cq= v(n)+(v(n+1)-v(n)).*(xqs-x(n))./(x(n+1)-x(n)); % Equation for interploation for xq(m).
    aq=NaN(size(xq'));       % Make a array of size xq with NaN elements
    aq(m')=cq';              % Embedded the NaN of aq with the element of cq at the respective m locations
    aq=aq' ;                 % Transpose aq
end                          % end of Program.
