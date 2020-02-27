input1 =  imread('s.jpg');
figure;
imshow(input1);
input = imresize(input1, [500 700]);

crop= imcrop(input,[40 20 200 240]);
figure;
imshow(crop);


if size(crop,3)==3 % RGB image
  gray=rgb2gray(crop);
end

threshold = graythresh(gray);
bw =~im2bw(gray,threshold);

open = bwareaopen(bw,30);

[L Ne]=bwlabel(open);

propied=regionprops(L,'BoundingBox');

for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2);
end

figure;
[r,c] = find(L==1);
n1=open(min(r):max(r),min(c):max(c));
imshow(n1);

figure;
[r,c] = find(L==2);
n1=open(min(r):max(r),min(c):max(c));
imshow(n1);

Target = n1
Template = imread('SI/h.jpg');

[r1,c1]=size(Target);
[r2,c2]=size(Template);

image22=(mean(Template));

M=[];
for (i=1:(r1-r2+1))
    for (j=1:(c1-c2+1))
        Nimage=Target(i:i+r2-1,j:j+c2-1);
        Nimage=(mean(Nimage));  % mean of image part under mask
        corr= sum(sum(Nimage.*image22));
        warning off
        M(i,j)=corr/sqrt(sum(sum(Nimage.^2)));
    end 
end
figure;
imshow(M);