clear;
species{1} = {'Archaea','Bacteria'};
species{2} = {'Crenarchaeota','Euryarchaeota','Actinobacteria','Proteobacteria','Aquificae','Bacteroidetes','Chlorobi','Chlamydiae','Chloroflexi','Cyanobacteria','Deinococcus-Thermus','Firmicutes','Verrucomicrobia','Planctomycetes','Spirochaetes','Thermotogae'};
load('labeling.mat');
number = zeros(16,1);

file = fopen('total.csv','w');

for num = 1:1766
    str = sprintf('Bacteria_%d.jpg',num);
    img = imread(str);
    [sizey, sizex, sizez] = size(img);          %이미지 파일의 x,y,color 크기

    
    if length(total{num,1}) > 0
        index = find(cellfun('length',regexp(species{2},total{num,2})) == 1);

        if (index==3) | (index==4) | (index==12)
            number(index) = number(index) + 1;
            
            for k = 1:3
                for i = 1:64
                    for j = 1:64
                        fprintf(file,'%d,',255-img(i,j,k));
                    end
                end
            end
            for i = 1:length(species{2})-1
                if index == i
                    fprintf(file,'1,');
                else
                    fprintf(file,'0,');
                end
            end
            if index == length(species{2})
                fprintf(file,'1');
            else
                fprintf(file,'0');
            end
            fprintf(file,'\n');
        end
    end
    
    disp(num);
end

fclose(file);
save('dataa.mat');