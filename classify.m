function answer = classify(result,class,data,threshold,this)

    count = zeros(1766,1);
    for i = 1:1766
        if sum(result{i}) > 0
%             disp(data);
%             disp(size(result{i}));
            temp = repmat(data,size(result{i},1),1) - result{i};
            count(i) = sum(sum(temp.^2,2) < threshold);
        end
    end
    
    threshold2 = 0;
    accuracy = 0;
    for i = 1:100
        temp2 = (sum((count>=i).*(class==this))).*(sum((count<i).*(class~=this)))/(sum(class==this,1)*(sum(class~=this,1)));
        if accuracy < temp2
            accuracy = temp2;
            threshold2 = i;
        %else
            %break;
        end
    end
    
    answer = [accuracy threshold2];
end
