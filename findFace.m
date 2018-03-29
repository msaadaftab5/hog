function [scale xcoord ycoord]=findFace(img)
if(size(img,3)>1)
    img = rgb2gray(img);
end
%scaling not handled
diff=0;
first = false;
    %for s=1:0.1:2
        %A = [s 0 0;0 s 0;0 0 1];
        %t = affine2d(A);
        %img2 = imwarp(img,t);    
    
        x = size(img,1);
        y = size(img,2);

            for i=1:100:x-799
                for j=1:100:y-799
                    segment = img(i:i+799,j:j+799);
                    segment = imresize(segment,[100 100]);
                    result = isFace(segment);
                    if(first == false)
                        first = true;
                        scale = 1;
                        xcoord = i;
                        ycoord = j;
                        diff=min(result);
                    else
                        if (diff>min(result))
                            scale = 1;
                            xcoord = i;
                            ycoord = j;
                            diff=min(result);
                        end
            
                    end
            
                end
                
            end
        
            
    
%end

end