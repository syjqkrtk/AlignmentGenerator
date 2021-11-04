plot3(0,0,0);
xlim([0 1]);
ylim([0 1]);
zlim([-4000 4000]);
hold on
grid on
for i = 1:1
    if size(result{i},1) > 0
        %plot3(result{i}(:,1),result{i}(:,2),result{i}(:,3),'x');
        temp = (result{i}(:,3)>0).*result{i};
        temp2 = (result{i}(:,3)<0).*result{i};
        plot3(temp(:,1)/total(i),temp(:,2)/total(i),temp(:,3),'x');
        plot3(temp2(:,1)/total(i),-temp2(:,2)/total(i),temp2(:,3),'x');
%         plot3(result{i}(:,1)/total(i),result{i}(:,2)/total(i),result{i}(:,3)/total(i),'x');
    end
end