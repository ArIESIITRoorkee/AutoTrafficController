clear all;
  a = arduino('com4', 'uno');
      obj1 = VideoReader('numberrr_1.avi');
      obj2 = VideoReader('numberrr_2.avi');
      obj3 = VideoReader('numberrr_3.avi');
      obj4 = VideoReader('numberrr_4.avi');
      i=1;
for l = 0 : 50  %fill in the appropriate number
    i=1+l*90;

  frame1 = read(obj1,i);
  frame2 = read(obj2,i);
  frame3 = read(obj3,i);
  frame4 = read(obj4,i);
  thisfig = figure();
  thisax = axes('Parent', thisfig);
  image(frame1, 'Parent', thisax);
  title(thisax, sprintf('Frame #%d', l));
  
img1 = frame1;
c = [34 25 24 30 32 83 171 224 266 303 321 337 359 359 370 383 388 420 455 476 520 536 595 715 715];
r = [477 457 433 414 382 338 256 210 184 120 116 107 98 73 56 48 31 25 33 65 133 165 198 303 473];
k = roipoly(img1,c,r);
    g11=rgb2gray(img1);   
    background = imopen(g11,strel('disk',15));
    g21 = g11 - background;
    g31 = imadjust(g21);
    level = graythresh(g31);
    g41 = im2bw(g31,level);
    g41 = bwareaopen(g41, 50);
     g41=g41.*k;
    [x,y]=size(g41);
        imshow(g41);
        s = 0;
        for p=1:x
            for q=1:y
            if (g41(p,q)== 1)
                s= s + (0.1-x)/(1-x)+(0.9*p/(1-x));
            end
             q=q+1;
            end
            p=p+1;
        end
 blackcount = sum(sum(k == 0));
 sat1=s*s*3*1.8/(x*y - blackcount)/100;
 
   thisfig = figure();
  thisax = axes('Parent', thisfig);
 image(frame2, 'Parent', thisax);
  title(thisax, sprintf('Frame #%d', l));
img2 = frame2;
c = [9 76 200 228 205 207 208 212 248 256 259 266 323 346 357 399 708 272 9];
r = [478 376 185 145 134 123 114 107 105 105 94 75 83 88 120 180 476 480 478];
k = roipoly(img2,c,r);
    g12=rgb2gray(img2);   
    background = imopen(g12,strel('disk',15));
    g22 = g12 - background;
    g32 = imadjust(g22);
    level = graythresh(g32);
    g42 = im2bw(g32,level);
    g42 = bwareaopen(g42, 50);
    g42=g42.*k;
    [x,y]=size(g42);
        imshow(g42);
        s = 0;
        for p=1:x
            for q=1:y
            if (g42(p,q)== 1)
                s= s + (0.1-x)/(1-x)+(0.9*p/(1-x));
            end
             q=q+1;
            end
            p=p+1;
        end
  blackcount = sum(sum(k == 0));
 sat2=s*s*3*1.8/(x*y - blackcount)/100;
 
   thisfig = figure();
  thisax = axes('Parent', thisfig);
  image(frame3, 'Parent', thisax);
  title(thisax, sprintf('Frame #%d', l));
img3 = frame3;
c = [3 65 292 311 313 310 334 345 371 392 432 452 465 482 488 500 720 3 ];
r = [473 444 291 263 257 215 240 237 239 265 284 288 293 293 309 335 458 473];
k = roipoly(img3,c,r);
    g13=rgb2gray(img3);   
    background = imopen(g13,strel('disk',15));
    g23 = g13 - background;
    g33 = imadjust(g23);
    level = graythresh(g33);
    g43 = im2bw(g33,level);
    g43 = bwareaopen(g43, 50);
    g43=g43.*k;
    [x,y]=size(g43);
        imshow(g43);
        s = 0;
        for p=1:x
            for q=1:y
            if (g43(p,q)== 1)
                s= s + (0.1-x)/(1-x)+(0.9*p/(1-x));
            end
             q=q+1;
            end
            p=p+1;
        end
blackcount = sum(sum(k == 0));
 sat3=s*s*3*1.8/(x*y - blackcount)/100;
 
   thisfig = figure();
  thisax = axes('Parent', thisfig);
  image(frame4, 'Parent', thisax);
  title(thisax, sprintf('Frame #%d', l));
img4 = frame4;
c = [122 111 100 105 105 127 135 149 172 292 546];
r = [477 309 47 34 25 23 28 45 61 166 476 ];
k = roipoly(img4,c,r);
    g14=rgb2gray(img4);   
    background = imopen(g14,strel('disk',15));
    g24 = g14 - background;
    g34 = imadjust(g24);
    level = graythresh(g34);
    g44 = im2bw(g34,level);
    g44 = bwareaopen(g44, 50);
    
g44=g44.*k;
    [x,y]=size(g44);
        imshow(g44);
        s = 0;
        for p=1:x
            for q=1:y
            if (g44(p,q)== 1)
                s= s + (0.1-x)/(1-x)+(0.9*p/(1-x));
            end
             q=q+1;
            end
            p=p+1;
        end
blackcount = sum(sum(k == 0));
        sat4 =(s*s*3*1.8/(x*y - blackcount))/100;
 sat=sat1+sat2+sat3+sat4;
 t1=60*sat1/sat;
  t2=60*sat2/sat;
   t3=60*sat3/sat;
    t4=60*sat4/sat;
writeDigitalPin(a, 11, 0);
writeDigitalPin(a, 2, 0);
writeDigitalPin(a, 13, 0);
writeDigitalPin(a, 8, 0);
writeDigitalPin(a, 5, 0);
writeDigitalPin(a, 3, 0);
writeDigitalPin(a, 4, 1); %2,5,8,11 red
writeDigitalPin(a, 5, 1); %3,6,9,12 yellow
writeDigitalPin(a, 8, 1); %4,7,10,13 green
writeDigitalPin(a, 11, 1);
    pause(t1-2);
    writeDigitalPin(a, 6, 1);
writeDigitalPin(a, 5, 0);
    pause(2);
writeDigitalPin(a, 2, 1);
    writeDigitalPin(a, 6, 0);
    writeDigitalPin(a, 7, 1);
writeDigitalPin(a, 4, 0);
    pause(t2 - 2);
writeDigitalPin(a, 9, 1);
writeDigitalPin(a, 8, 0);
 pause(2);
writeDigitalPin(a, 9, 0);
writeDigitalPin(a, 10, 1);
writeDigitalPin(a, 5, 1);
writeDigitalPin(a, 7, 0);
pause(t3 -2);
writeDigitalPin(a, 12, 1);
writeDigitalPin(a, 11, 0);
pause(2);
writeDigitalPin(a, 12, 0);
writeDigitalPin(a, 13, 1);
writeDigitalPin(a, 8, 1);
writeDigitalPin(a, 10, 0);
pause(t4);
writeDigitalPin(a, 3, 1);
writeDigitalPin(a, 2, 0);
end;
clear a;