A=[];
for k=1:5
    for j=1:5
        if k==j
            A(k,k)=5;
        elseif abs(k-j)==1
            A(k,j)=1;
        else
            A(k,j)=0;
        end
    end
end
A