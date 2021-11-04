species{1} = {'Archaea','Bacteria'};
species{2} = {'Crenarchaeota','Euryarchaeota','Actinobacteria','Proteobacteria','Aquificae','Bacteroidetes','Chlorobi','Chlamydiae','Chloroflexi','Cyanobacteria','Deinococcus-Thermus','Firmicutes','Verrucomicrobia','Planctomycetes','Spirochaetes','Thermotogae'};

load('opt.mat');

REon = zeros(12288,16);
REoff = zeros(12288,16);

for i = 1:12288
    for j = 1:16
        REon(i,j) = sum((total(:,12288+j)==1).*total(:,i))/sum(total(:,12288+j)==1);
        REoff(i,j) = sum((total(:,12288+j)==0).*total(:,i))/sum(total(:,12288+j)==0);
    end
end

ratio = REon./REoff;
marker = zeros(10,16);
result = zeros(10,16);

for i = 1:16
    [temp index] = sort(ratio(:,i),'descend');
    result(:,i) = temp(1:10);
    marker(:,i) = index(1:10);
end

file = fopen('RECNN0607.csv','w');

for k = 1:1555
    for i = 1:16
        for j = 1:10
            fprintf(file,'%d,',total(k,marker(j,i)));
        end
    end
    for i = 1:15
        fprintf(file,'%d,',total(k,12288+i));
    end
    fprintf(file,'%d\n',total(k,12304));
end
fclose(file);

save('opt.mat')