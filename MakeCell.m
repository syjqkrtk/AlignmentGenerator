clear;
load('data.mat');
result = cell(9354,1);
result2 = cell(9354,1);

for i = 1:9354
    forward01 = data{i,1,1}/total(i);
    forward02 = data{i,1,2}/total(i);
    reverse01 = data{i,2,1}/total(i);
    reverse02 = data{i,2,2}/total(i);
    
    for j = 1:size(forward01,1)
        disp(i);
        disp(j/size(forward01,1));
        result{i}(j,1) = forward01(j,1);
        result{i}(j,2) = forward02(j,1);
        result{i}(j,3) = forward01(j,2);
        result{i}(j,4) = forward02(j,2);
%         result{i}(j,3) = max(forward01(j,2)-forward01(j,1)+1,forward02(j,2)-forward02(j,1)+1);
    end
    
    for j = 1:size(reverse01,1)
        result{i}(j+length(forward01),1) = reverse01(j,1);
        result{i}(j+length(forward01),2) = -reverse02(j,1);
        result{i}(j+length(forward01),3) = reverse01(j,2);
        result{i}(j+length(forward01),4) = -reverse02(j,2);
%         result{i}(j+length(forward01),3) = -max(reverse01(j,2)-reverse01(j,1)+1,reverse02(j,2)-reverse02(j,1)+1);
    end
end

save('cell.mat');