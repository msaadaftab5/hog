function result =  trainHog
   result = 0;
    for i = 1:5
        %if i==16 || i==92
         %   continue;
        %end
        name =num2str(i) ;   
        name = strcat('D:\hog\updatedSaad\',name,'.jpg');
        %disp(name);
        img = imread(name);
        %img = rgb2gray(img);
        rslt = hog(img);
          disp(i);
        if(result == 0)
            result = rslt;
            %disp(size(result));
            %disp(size(rslt));
          
        else
            %disp(size(result));
            %disp(size(rslt));
          
            result = [result ; rslt];
        end
    end
    result = result'; %saving 1 hog in a column vector
end    