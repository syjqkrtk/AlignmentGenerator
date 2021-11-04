% load('data.mat')
for j = 7965:9354
    Str = sprintf('MTgenome_%d\\Forward\\0.0_5000000.5000000\\0_1000000',j);

    diff = 1850;

    list = ls(Str);
    seq1 = zeros(size(list,1)-2,2);
    seq2 = zeros(size(list,1)-2,2);
    score = zeros(size(list,1)-2,1);
    identity = zeros(size(list,1)-2,3);
    gap = zeros(size(list,1)-2,3);

    for i = 3:size(list,1)
        filename = sprintf('%s\\%s',Str,list(i,:));
        file = fopen(filename,'r');
        temp = fgetl(file);
        seq1(i-2,:) = sscanf(temp, 'Seq1 : %d - %d');
        temp = fgetl(file);
        seq2(i-2,:) = sscanf(temp, 'Seq2 : %d - %d');
        temp = fgetl(file);
        score(i-2,:) = sscanf(temp, 'Score : %d');
        temp = fgetl(file);
        identity(i-2,:) = sscanf(temp, 'Identity : %d / %d (%d %%)');
        temp = fgetl(file);
        gap(i-2,:) = sscanf(temp, 'Gap : %d / %d (%d %%)');
        fclose(file);
    end
    data{j,1,1} = seq1;
    data{j,1,2} = seq2;
    data{j,1,3} = score;
    data{j,1,4} = identity;
    data{j,1,5} = gap;
    
    Str = sprintf('MTgenome_%d\\Reverse\\0.0_5000000.5000000\\0_1000000',j);

    diff = 1850;

    list = ls(Str);
    seq1 = zeros(size(list,1)-2,2);
    seq2 = zeros(size(list,1)-2,2);
    score = zeros(size(list,1)-2,1);
    identity = zeros(size(list,1)-2,3);
    gap = zeros(size(list,1)-2,3);

    for i = 3:size(list,1)
        filename = sprintf('%s\\%s',Str,list(i,:));
        file = fopen(filename,'r');
        temp = fgetl(file);
        seq1(i-2,:) = sscanf(temp, 'Seq1 : %d - %d');
        temp = fgetl(file);
        seq2(i-2,:) = sscanf(temp, 'Seq2 : %d - %d');
        temp = fgetl(file);
        score(i-2,:) = sscanf(temp, 'Score : %d');
        temp = fgetl(file);
        identity(i-2,:) = sscanf(temp, 'Identity : %d / %d (%d %%)');
        temp = fgetl(file);
        gap(i-2,:) = sscanf(temp, 'Gap : %d / %d (%d %%)');
        fclose(file);
    end
    data{j,2,1} = seq1;
    data{j,2,2} = seq2;
    data{j,2,3} = score;
    data{j,2,4} = identity;
    data{j,2,5} = gap;
    
    disp(j)
end

save('data.mat');