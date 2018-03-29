function  formatPic
   %result = 0;
    for i = 1:5
        %if i==3
         %   continue;
        %end
        name =num2str(i) ;   
        name = strcat('D:\hog\saadCV\',name,'.jpg');
        %disp(name);
        img = imread(name);
        img = rgb2gray(img);
        imshow(img);
        
        cord = ginput();
        
        img = img(cord(1,2):cord(2,2),cord(1,1):cord(2,1));
        %imshow(img);
        img = imresize(img,[100 100]);
        imwrite(img,strcat('D:\hog\updatedSaad\',num2str(i),'.jpg'));
        
    end
    %result = result'; %saving 1 hog in a column vector
end