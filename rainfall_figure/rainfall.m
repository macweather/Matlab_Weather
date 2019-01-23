%-----������-----
% 1.�����ݭn�@��10�������@�������B���
% 2.�b"Ū�����"��J�ɦW
% 3.�b"�w�q�ɶ�"��J��ƪ���l�ɶ��ε����ɶ�
% 4.�b"���X�ɶ�"��J�Q�n����Ʈɶ��ζ��j
% 5.F5 
%----------------
clc;clear
%---------------------------------
%   Ū�����
    xlsFile = 'C0A92.xlsx';  % Ū�� excel ���
    rain = xlsread(xlsFile,'C0A92');
    tenmin = rain(:,2);
    tenmina = [ zeros(1,5),rain(:,2)' ];  % �ɫB�q��
    tenminb = [ zeros(1,17),rain(:,2)' ];  % 3�p�ɫB�q��
    tenminc = [ zeros(1,143),rain(:,2)' ];  % 24�p�ɫB�q��

    for i = 1:length(rain)
    hour(i) = sum(tenmina(i:i+5));
    three(i) = sum(tenminb(i:i+17));
    day(i) = sum(tenminc(i:i+143));
    end
    
%   ��X�̤j��
	[my1,iy1] = max(hour);
	[my2,iy2] = max(three);
	[my3,iy3] = max(day); 
    
%   �w�q�ɶ�
    startDate = datenum('01-01-2017'); endDate = datenum('11-01-2017');
    x = linspace(startDate,endDate,length(rain)) ; 
    
%	TODO �e��
    % plot ten minite rainfull
	yyaxis left
    bar(x,tenmin,.8,'b')	% 10min    
    ylabel('10�����B�q (mm)','fontsize',10);
    % plot 1 hour , 3 hours , 24 hours rainfull
    yyaxis right
    plot(x,hour,'r-',x,three,'m-',x,day,'g-', 'linewidth', 1.5)
    ylabel('1�p�� /3�p��/ 24�p�ɲֿn�B�q (mm)','fontsize',10);
    
    xlabel({'2017(mm/dd)'},'fontsize',10);  
    title('�s�_���۪��� �I�Q�� C0A92','fontsize',12);
    legend('10�����ֿn','1�p�ɲֿn','3�p�ɲֿn','24�p�ɲֿn')
   
% �Х̤ܳj��
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
 % ���X�ɶ�
    axis([datenum('06-01-2017'),datenum('06-04-2017'),0,max(day)+10]); %��ܷQ�n���ɶ�
    NumTicks = 4; %���j
    L = get(gca,'XLim');
    set(gca,'XTick',linspace(L(1),L(2),NumTicks))
    datetick('x','mm/dd HH ','keeplimits','keepticks')
    