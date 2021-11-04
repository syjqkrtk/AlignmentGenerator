species{1} = {'Archaea','Bacteria'};
species{2} = {'Crenarchaeota','Euryarchaeota','Actinobacteria','Proteobacteria','Aquificae','Bacteroidetes','Chlorobi','Chlamydiae','Chloroflexi','Cyanobacteria','Deinococcus-Thermus','Firmicutes','Verrucomicrobia','Planctomycetes','Spirochaetes','Thermotogae'};

load('dataaa.mat');

REposi = zeros(1766,10,2);
RElen = zeros(1766,10);

for i = 1:1766
    [temp index] = sort(result{i}(:,2),'descend');
    REposi(i,:,1) = result{i}(index(1:10),1);
    REposi(i,:,2) = result{i}(index(1:10),2);
    RElen(i,:) = result{i}(index(1:10),3);
end

file = fopen('RECNN0621.csv','w');

for k = 1:1766
    if length(total2{num,1}) > 0
        for j = 1:10
            fprintf(file,'%d,',REposi(k,j));
        end
        for i = 1:15
            fprintf(file,'%d,',total(k,12288+i));
        end
        fprintf(file,'%d\n',total(k,12304));
    end
end
fclose(file);

save('dataaa.mat')