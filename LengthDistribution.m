for j = 1:1766
    if j ~= 1156 && j ~= 1430 && j~=1580 && j~=1738 && j~=1739
        filename = sprintf('D:\\Download\\program_reminer_ฟ๋มุ\\Bacteria_%d.txt',j);
        file = fopen(filename,'r');
        seq = fscanf(file,'%s');
        total(j) = length(seq);
        fclose(file);
    end
    disp(j);
end