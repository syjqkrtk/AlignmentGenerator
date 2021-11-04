for iii = 704:5000
    disp(iii);
    clearvars -except iii;
    k = 3;
    alignname = sprintf('Bacteria_%d\\Forward\\0.0_5000000.5000000\\0_1000000',iii);
    alignlist = dir(alignname);
    feature = cell(length(alignlist)-2,7);
    words = 'ACGT';
    num = zeros(length(alignlist)-2,5);

    for i = 3:length(alignlist)
        str = sprintf('%s\\%s',alignname,alignlist(i).name);
        t = strsplit(alignlist(i).name,'(');
        t2 = strsplit(t{2},'.');
        feature{i-2,1} = t2{1};
        t3 = strsplit(t2{2},'_');
        feature{i-2,2} = t3{1};
        file = fopen(str,'r');
        a = fscanf(file,'%s');
        if length(a) ~= 0
            b = strsplit(a,'Plus');
            c = b{3};
            d = (c=='A')+2*(c=='C')+3*(c=='G')+4*(c=='T')+(c=='a')+2*(c=='c')+3*(c=='g')+4*(c=='t');
            d(d==0) = [];
            temp = zeros(4^k,1);
            for j = 1:length(d)-k+1
                word = 0;
                for l = 1:k
                    word = word + (d(j+l-1)-1)*4^(l-1);
                end
                temp(word+1,1)= temp(word+1,1) + 1;
            end
            [e f] = sort(temp,'descend');
            f = f-1;
            num(i-2,1) = f(1);
            num(i-2,2) = f(2);
            num(i-2,3) = f(3);
            num(i-2,4) = f(4);
            num(i-2,5) = f(5);
            feature{i-2,3} = sprintf('%c%c%c',words(mod(f(1),4)+1),words(mod(floor(f(1)/4),4)+1),words(mod(floor(f(1)/16),4)+1));
            feature{i-2,4} = sprintf('%c%c%c',words(mod(f(2),4)+1),words(mod(floor(f(2)/4),4)+1),words(mod(floor(f(2)/16),4)+1));
            feature{i-2,5} = sprintf('%c%c%c',words(mod(f(3),4)+1),words(mod(floor(f(3)/4),4)+1),words(mod(floor(f(3)/16),4)+1));
            feature{i-2,6} = sprintf('%c%c%c',words(mod(f(4),4)+1),words(mod(floor(f(4)/4),4)+1),words(mod(floor(f(4)/16),4)+1));
            feature{i-2,7} = sprintf('%c%c%c',words(mod(f(5),4)+1),words(mod(floor(f(5)/4),4)+1),words(mod(floor(f(5)/16),4)+1));

            fclose(file);
        end
    end

    count = 0;
    wordset = zeros(1,5);
    number = zeros(1,1);
    for i = 1:size(num,1)
        temp = (sum(wordset(:,:) == num(i,:),2)==5);
        if sum(temp) == 0
            count = count + 1;
            wordset(count,:) = num(i,:);
            number(count,1) = 1;
            position{count,1} = [str2num(feature{i,1}), str2num(feature{i,2})];
        else
            index = find(temp);
            number(index,1) = number(index,1) + 1;
            position{index,number(index,1)} = [str2num(feature{i,1}), str2num(feature{i,2})];
        end
    end

    wordacgt = cell(length(wordset),5);
    for i = 1:size(wordset,1)
        wordacgt{i,1} = sprintf('%c%c%c',words(mod(wordset(i,1),4)+1),words(mod(floor(wordset(i,1)/4),4)+1),words(mod(floor(wordset(i,1)/16),4)+1));
        wordacgt{i,2} = sprintf('%c%c%c',words(mod(wordset(i,2),4)+1),words(mod(floor(wordset(i,2)/4),4)+1),words(mod(floor(wordset(i,2)/16),4)+1));
        wordacgt{i,3} = sprintf('%c%c%c',words(mod(wordset(i,3),4)+1),words(mod(floor(wordset(i,3)/4),4)+1),words(mod(floor(wordset(i,3)/16),4)+1));
        wordacgt{i,4} = sprintf('%c%c%c',words(mod(wordset(i,4),4)+1),words(mod(floor(wordset(i,4)/4),4)+1),words(mod(floor(wordset(i,4)/16),4)+1));
        wordacgt{i,5} = sprintf('%c%c%c',words(mod(wordset(i,5),4)+1),words(mod(floor(wordset(i,5)/4),4)+1),words(mod(floor(wordset(i,5)/16),4)+1));
    end    
    
    alignname = sprintf('Bacteria_%d.mat',iii);
    save(alignname);
end