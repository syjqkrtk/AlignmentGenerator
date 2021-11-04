clear;
load('dataaaa.mat');
load('cell.mat');
classdat = cell(16,1);
classnum = zeros(16,1);
standard = cell(16,1);
maxk = 5;
maxl = 10;
% number x [position, size, threshold]

for i = 1:1766
    if class(i) > 0
        classnum(class(i)) = classnum(class(i))+1;
        classdat{classnum(class(i))} = result{i};
    end
end

for i = 1:16
    temp = 0;
    threshold = 0;
    count = 0;
    for j = 1:classnum(i)
        for k = 1:size(classdat{i},1)
            disp(i);
            disp(j);
            disp(k);
            for l = maxl:maxl
                temp2 = classify(result,class,classdat{i}(k,:),0.05,i);
                count = count + 1;
                temp(count) = temp2(1);
                threshold(count) = temp2(2);
            end
        end
    end
    [temp3 index] = max(temp);
    standard{i} = [index,threshold(index),1];
end

save('result_0920.mat');