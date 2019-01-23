clear
%採用utf-8編碼
feature('DefaultCharacterSet', 'UTF8');

xlsFile='L1A820_1112.xlsx'; 
rain= xlsread(xlsFile,'L1A820_1112'); 
y = rain(:,1);
y1 = rain(:,4); 

startDate = datenum (2017, 10, 10, 8, 0, 0);
endDate   = datenum (2017, 10, 12, 8, 40, 0);
x = linspace(startDate,endDate,293);

%digx=linspace(startDate,endDate,22028);
%digy=25;

plot(x,y,'R',x,y1,'G')




set ( gca, 'XTick', [startDate:7:endDate] )
xticks([startDate:7:endDate])
%xticklabels({'6/1','8/13','10/15'})
datetick('x','HH','keeplimits')
%axis([startDate,endDate,0,60])
grid on	
title('2017/11/12 A9 29.7K Rainfall Sequential Diagram雨量統計表')
xlabel('Time (11/10 0800~11/12 0800)')
ylabel('Rainfall(mm)')
    

