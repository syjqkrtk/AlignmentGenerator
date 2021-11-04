load('data.mat');
for i = 1:9354
    forward01 = data{i,1,1};
    forward02 = data{i,1,2};
    reverse01 = data{i,2,1};
    reverse02 = data{i,2,2};
    
    str = sprintf('D:\\Download\\DataBase\\MTgenome\\MTgenome%d.txt',i);
    file = fopen(str,'r');
    a = fscanf(file,'%s');
    total = length(a);
    fclose(file);
    
    forward1 = floor(800*forward01/(total+1))+1;
    forward2 = floor(800*forward02/(total+1))+1;
    reverse1 = floor(800*reverse01/(total+1))+1;
    reverse2 = 800-floor(800*reverse02/(total+1));
    
    result = zeros(800,800,2);
    
    for j = 1:size(forward1,1)
        result(forward1(j,1),forward2(j,1),1) = result(forward1(j,1),forward2(j,1),1) + 1;
        result(forward2(j,1),forward1(j,1),1) = result(forward2(j,1),forward1(j,1),1) + 1;
        result(forward1(j,2),forward2(j,2),1) = result(forward1(j,2),forward2(j,2),1) + 1;
        result(forward2(j,2),forward1(j,2),1) = result(forward2(j,2),forward1(j,2),1) + 1;
    end
        
    for j = 1:size(reverse1,1)
        result(reverse1(j,1),reverse2(j,1),2) = result(reverse1(j,1),reverse2(j,1),2) + 1;
        result(reverse2(j,1),reverse1(j,1),2) = result(reverse2(j,1),reverse1(j,1),2) + 1;
        result(reverse1(j,2),reverse2(j,2),2) = result(reverse1(j,2),reverse2(j,2),2) + 1;
        result(reverse2(j,2),reverse1(j,2),2) = result(reverse2(j,2),reverse1(j,2),2) + 1;
    end
    
    disp(i);
    
    result2 = result/max(max(max(result)));
    img = zeros(800,800,3);
    img(:,:,3) = 1-result2(:,:,2);
    img(:,:,2) = 1-(result2(:,:,1)+result2(:,:,2))/2;
    img(:,:,1) = 1-result2(:,:,1);
    str = sprintf('MTgenome_%d.jpg',i);
    imwrite(img,str)
end