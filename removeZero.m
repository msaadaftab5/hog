function result = removeZero(data)
result = 0;
%comp = zeros(1,size(data,2));
for i = 1:size(data,1)
    flag = 0;
    for j = 1:size(data,2)

        if(data(i,j)~=0)
            flag =1;
            break;
        end
    end
    if flag==1
        if result == 0
            result = data(i,:);
        else
            result= [result; data(i,:)];
        end
    
end

end