clear;
species{1} = {'Archaea','Bacteria'};
species{2} = {'Crenarchaeota','Euryarchaeota','Actinobacteria','Proteobacteria','Aquificae','Bacteroidetes','Chlorobi','Chlamydiae','Chloroflexi','Cyanobacteria','Deinococcus-Thermus','Firmicutes','Verrucomicrobia','Planctomycetes','Spirochaetes','Thermotogae'};
load('labeling.mat');
number = zeros(16,1);

class = zeros(1766,1);
for num = 1:1766    
    if length(total{num,1}) > 0
        index = find(cellfun('length',regexp(species{2},total{num,2})) == 1);
        number(index) = number(index) + 1;
        if size(index,2) > 0
            class(num) = index;
        end
    end
    
    disp(num);
end

save('dataaaa.mat');