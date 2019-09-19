%% Project 02-04
function image = bilinearInterpolation(I, rate)
[m ,n] = size(I);
ratex = rate - 1;
image = zeros(m + ratex * (m - 1),n + ratex * (n - 1));
for i = 1:m                        
    for j = 1:n         
        image(i + ratex * (i - 1),j + ratex * (j - 1)) = I(i,j);  
    end
end
image = double(image);

for i = 1:m + ratex * (m - 1) 
    for j = 1:n + ratex * (n - 1)    
        a = mod(j - 1,rate);         
        b = mod(i - 1,rate);         
        if a ~= 0 && b == 0         
            image(i, j) = round((a * image(i, j + (rate - a))+(rate-a)*image(i,j-a))/rate);   
        end   
        if a==0 && b~=0       
            image(i,j)=round((b*image(i+(rate-b),j)+(rate-b)*image(i-b,j))/rate);   
        end       
        if a~=0 && b~=0           
            image(i,j)=round((b*(a*image(i-b,j+(rate-a))+(rate-a)*image(i-b,j-a))/rate+(rate-b)*(a*image(i+(rate-b),j+(rate-a))+(rate-a)*image(i+(rate-b),j-a))/rate)/rate);       
        end    
    end
end
image = uint8(image);
