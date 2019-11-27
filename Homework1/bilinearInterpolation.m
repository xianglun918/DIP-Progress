%% Project 02-04
% I is the input image
% to_dpi is the dpi we want shrink / scale the image to
%%

function img = bilinearInterpolation(a,rate) 
[m,n]=size(a); 
ratex=rate-1;  
img=zeros(m+ratex*(m-1),n+ratex*(n-1)); 
for i=1:m                        
    for j=1:n         
        img(i+ratex*(i-1),j+ratex*(j-1))=a(i,j);  
    end
end
img=double(img); 
for i=1:m+ratex*(m-1) 
    for j=1:n+ratex*(n-1)    
        a=mod(j-1,rate);         
        b=mod(i-1,rate);         
        if a~=0 && b==0         
            img(i,j)=round((a*img(i,j+(rate-a))+(rate-a)*img(i,j-a))/rate);   
        end      
        if a==0 && b~=0       
            img(i,j)=round((b*img(i+(rate-b),j)+(rate-b)*img(i-b,j))/rate);   
        end       
        if a~=0 && b~=0           
            img(i,j)=round((b*(a*img(i-b,j+(rate-a))+(rate-a)*img(i-b,j-a))/rate+(rate-b)*(a*img(i+(rate-b),j+(rate-a))+(rate-a)*img(i+(rate-b),j-a))/rate)/rate);       
        end  
    end
end
img=uint8(img);

        
