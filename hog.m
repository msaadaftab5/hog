function result = hog(face)
%face is a 50 x 50 face image in gray scale

%if(size(face,3) ~=1)
 %   face=rgb2gray(face);
%end

gradX = [1 0 -1]';
gradY = gradX';

faceX = conv2(face,gradX,'same');
faceY = conv2(face,gradY,'same');

% disp(size(faceX));
% disp(size(faceY));

mgn = ((faceX.^2 + faceY.^2)).^0.5;

%disp(size(mgn));

block1X  = faceX(1:50,1:50);
block2X = faceX(1:50,51:100);
block3X = faceX(51:100,1:50);
block4X = faceX(51:100,51:100);

block1Y  = faceY(1:50,1:50);
block2Y = faceY(1:50,51:100);
block3Y = faceY(51:100,1:50);
block4Y = faceY(51:100,51:100);


desc1 = GetBlockHog(block1X,block1Y,mgn,1);
desc2 = GetBlockHog(block2X,block2Y,mgn,2);
desc3 = GetBlockHog(block3X,block3Y,mgn,3);
desc4 = GetBlockHog(block4X,block4Y,mgn,4);

result = [desc1 desc2 desc3 desc4];


end

function dscr = GetBlockHog(blockX,blockY,mgn,bnum)

    xFactor = 0;
    yFactor = 0;
    if(bnum==1)

    elseif(bnum==2)
        yFactor = 50;
    elseif(bnum==3)
        xFactor = 50;
    else
        xFactor = 50;
        yFactor = 50;
    end
    
    dscr = 0;


 for i=1:49
    for j=1:49
            tmp = zeros(1,12);


            dir =  atan(blockY(i,j)/blockX(i,j));
            dir = round(radtodeg(dir));
            if(dir < 0)
                dir = dir+360;
            end
            tmp(getDir(dir)) = tmp(getDir(dir))+mgn(i+xFactor,j+yFactor);

            dir =  atan(blockY(i,j+1)/blockX(i,j+1));
            dir = round(radtodeg(dir));
            if(dir < 0)
                 dir = dir+360;
            end
            
            tmp(getDir(dir)) = tmp(getDir(dir))+mgn(i+xFactor,j+yFactor);
            
            dir =  atan(blockY(i+1,j)/blockX(i+1,j));
            dir = round(radtodeg(dir));
            if(dir < 0)
                 dir = dir+360;
            end
            
            tmp(getDir(dir)) = tmp(getDir(dir))+mgn(i+xFactor,j+yFactor);
            
            dir =  atan(blockY(i+1,j+1)/blockX(i+1,j+1));
            dir = round(radtodeg(dir));
            if(dir < 0)
                 dir = dir+360;
            end
            
            tmp(getDir(dir)) = tmp(getDir(dir))+mgn(i+xFactor,j+yFactor);
            
            if dscr == 0
                dscr = tmp;
            else
                dscr = [dscr tmp];
            end
    end
end
    

end



function bin = getDir(dir)
        if(dir >=0 && dir<=30)
            bin=1;
        elseif(dir>30 && dir<=60)
                bin=2;
        elseif(dir>60 && dir<=90)
                bin=3;
        elseif (dir>90 && dir<=120)
                bin=4;
        elseif(dir>120 && dir<=150)
                bin=5;
        elseif(dir>150 && dir<=180)
                bin=6;
        elseif(dir>180 && dir<=210)
                bin=7;
        elseif(dir>210 && dir<=240)
                bin=8;
        elseif(dir>240 && dir<=270)
                bin=9;
        elseif(dir>270 && dir<=300)
                bin=10;
        elseif(dir>300 && dir<=330)
                bin=11;
        else
                bin=12;
       end
end

