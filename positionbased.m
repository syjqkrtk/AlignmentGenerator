clear

prokaryotes = fopen("prokaryotes.csv","r");

temp = fgetl(prokaryotes);
count = 0;
flag = 0;
i = 3727;

for ii = 1:i
    temp = fgetl(prokaryotes);
    
    temp = strrep(temp,"\n","");
    temp = strrep(temp,"""","");
    
    temp = strsplit(temp, ",");
    tempspec = temp{2};
    
    spec = strsplit(tempspec,";");
    disp(spec{3});
    
    if strcmp(spec{3},'Actinobacteria')
        specnum(ii) = 1;
    end
    if strcmp(spec{3},'Gammaproteobacteria')
        specnum(ii) = 2;
    end
    if strcmp(spec{3},'Alphaproteobacteria')
        specnum(ii) = 3;
    end
    if strcmp(spec{3},'Bacteroidetes/Chlorobi group')
        specnum(ii) = 4;
    end
    if strcmp(spec{3},'Betaproteobacteria')
        specnum(ii) = 5;
    end
    if strcmp(spec{3},'Firmicutes')
        specnum(ii) = 6;
    end
    if strcmp(spec{3},'epsilon subdivisions')
        specnum(ii) = 7;
    end
%     if strcmp(spec{2},'Terrabacteria group')
%         specnum(ii) = 1;
%     if strcmp(spec{2},'Terrabacteria group')
%         specnum(ii) = 1;

    if ~strcmp(temp{8},'Complete')
        length(ii) = str2num(temp{8})*1000000;
    else
        length(ii) = str2num(temp{9})*1000000;
    end
end

for iii = 1:725
    clearvars -except length specnum iii
    str = sprintf("Bacteria_%d.mat",iii);
    load(str);
    disp(iii);
    temppos = cellfun(@(x) x/length(1,iii), position, 'un', 0);
    tempnum = sum(cellfun(@(x) numel(x),temppos),2)/2;
    for iiii = 1:size(temppos,1)
        refpos(iiii) = sum([temppos{iiii,:}])/tempnum(iiii);
    end
    refnum = tempnum/sum(tempnum);
    str = sprintf("Final_%d.mat",iii);
    save(str);
end