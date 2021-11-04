clear;
load('result_0912.mat');

temp = 0;
for i = 1:16
    disp(i);
    count = 0;
    for j = 1:classnum(i)
%         disp(j);
        for k = 1:size(classdat{i},1)
            for l = maxl:maxl
                count = count + 1;
                if count == standard{i}(1)
                    temp2 = Copy_of_classify(result,class,classdat{i}(k,:),0.05,i);
                    disp(temp2);
                    disp(classdat{i}(k,:));
                    break;
                end
            end
        end
    end
end