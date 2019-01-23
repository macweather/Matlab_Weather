%-----說明書-----
% 1.首先需要一份10分鐘為一筆的降雨資料
% 2.在"讀取資料"填入檔名
% 3.在"定義時間"填入資料的初始時間及結束時間
% 4.在"劃出時間"填入想要的資料時間及間隔
% 5.F5 
%----------------
clc;clear
%---------------------------------
%   讀取資料
    xlsFile = 'TEST.xlsx';  % 讀取 excel 表單
    rain = xlsread(xlsFile,'C0A92');
    tenmin = rain(:,2);
    tenmina = [ zeros(1,5),rain(:,2)' ];  % 時雨量用
    tenminb = [ zeros(1,17),rain(:,2)' ];  % 3小時雨量用
    tenminc = [ zeros(1,143),rain(:,2)' ];  % 24小時雨量用

    for i = 1:length(rain)
    hour(i) = sum(tenmina(i:i+5));
    three(i) = sum(tenminb(i:i+17));
    day(i) = sum(tenminc(i:i+143));
    end
    
%   找出最大值
	[my1,iy1] = max(hour);
	[my2,iy2] = max(three);
	[my3,iy3] = max(day); 
    
%   定義時間
    startDate = datenum('01-01-2017'); endDate = datenum('11-01-2017');
    x = linspace(startDate,endDate,length(rain)) ; 
    
%	TODO 畫圖
    % plot ten minite rainfull
	yyaxis left
    bar(x,tenmin,.8,'b')	% 10min    
    ylabel('10分鐘雨量 (mm)','fontsize',10);
    % plot 1 hour , 3 hours , 24 hours rainfull
    yyaxis right
    plot(x,hour,'r-',x,three,'m-',x,day,'g-', 'linewidth', 1.5)
    ylabel('1小時 /3小時/ 24小時累積雨量 (mm)','fontsize',10);
    
    xlabel({'2017(mm/dd)'},'fontsize',10);  
    title('新北市石門區 富貴角 C0A92','fontsize',12);
    legend('10分鐘累積','1小時累積','3小時累積','24小時累積')
   
% 標示最大值
	hold on                 
	txt = ['\leftarrow ',num2str(my1),' mm/hr(max)'];text(x(iy1),hour(iy1), txt,'fontsize',10)
	hold on
	txt = ['\leftarrow ',num2str(my2),' mm/3hr(max)'];text(x(iy2),three(iy2), txt,'fontsize',10)
	hold on
	txt = ['\leftarrow ',num2str(my3),' mm/24hr(max)'];text(x(iy3),day(iy3), txt,'fontsize',10)
   %
    set(gcf,'unit','centimeters','position',[3 3 30 10])
    set(gca,'ticklength',[0.01 0.005]);
    set(gca,'tickdir','out');
    set(gca, 'XGrid', 'on');set(gca, 'YGrid', 'on');
    box off 
 % 劃出時間
    axis([datenum('06-01-2017'),datenum('06-04-2017'),0,max(day)+10]); %選擇想要的時間
    NumTicks = 4; %間隔
    L = get(gca,'XLim');
    set(gca,'XTick',linspace(L(1),L(2),NumTicks))
    datetick('x','mm/dd HH ','keeplimits','keepticks')
    