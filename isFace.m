function diff = isFace(img)
    
    img = imresize(img,[100 100]);
    load matlab.mat;
    summa = sum(result);
    imhog = sum(hog(img));
    imhog = ones(1,size(result,2)).*imhog;
    diff = summa - imhog;
    diff = (diff.^2).^0.5;

end