
%************** Fig5A-F: Compare area distribution (wt, 111, 2205): 
set(groot, ...
'DefaultFigureColor', 'w', ...
'DefaultAxesLineWidth', 0.5, ...
'DefaultAxesXColor', 'k', ...
'DefaultAxesYColor', 'k', ...
'DefaultAxesFontUnits', 'points', ...
'DefaultAxesFontSize', 11, ...
'DefaultAxesFontName', 'Arial', ...
'DefaultLineLineWidth', 1, ...
'DefaultTextFontUnits', 'Points', ...
'DefaultTextFontSize', 11, ...
'DefaultTextFontName', 'Arial', ...
'DefaultAxesBox', 'off', ...
'DefaultAxesTickLength', [0.02 0.025]);
set(groot, 'DefaultAxesTickDir', 'out');
set(groot, 'DefaultAxesTickDirMode', 'manual');
edges=linspace(0,3000,100);
colors = cbrewer('qual', 'Set2', 10);
subplot(2,3,1)
histogram(TP1_TP2_area_timecourse_wt(find(TP1_TP2_area_timecourse_wt(2:end,2)>0),2).*0.2916, edges,'FaceColor', colors(1,:));
title('WT')
xlabel('Cell area ($\mu m^2$)',  'Interpreter','latex')
ylabel('Number of cells')
yl1 = ylim;
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
subplot(2,3,2)
histogram(TP1_TP2_area_timecourse_111(find(TP1_TP2_area_timecourse_111(2:end,2)>0),2).*0.2916, edges,'FaceColor', colors(2,:));
title(' #111');
xlabel('Cell area ($\mu m^2$)',  'Interpreter','latex')
ylabel('Number of cells')
yl2 = ylim;
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
subplot(2,3,3)
histogram(TP1_TP2_area_timecourse_2205(find(TP1_TP2_area_timecourse_2205(2:end,2)>0),2).*0.2916, edges,'FaceColor','r');
title('#2205');
xlabel('Cell area ($\mu m^2$)',  'Interpreter','latex')
ylabel('Number of cells')
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
yl3 = ylim;
subplot(2,3,4)
histogram(TP1_TP2_area_timecourse_wt(find(TP1_TP2_area_timecourse_wt(2:end,2)>0),1).*0.2916, edges,'FaceColor', colors(1,:));
hold on;
hold on;
xlabel('Cell area ($\mu m^2$)',  'Interpreter','latex')
ylabel('Number of cells')
yl1 = ylim;
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
subplot(2,3,5)
histogram(TP1_TP2_area_timecourse_111(find(TP1_TP2_area_timecourse_111(2:end,2)>0),1).*0.2916, edges,'FaceColor', colors(2,:));
hold on;
xlabel('Cell area ($\mu m^2$)',  'Interpreter','latex')
ylabel('Number of cells')
yl2 = ylim;
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
subplot(2,3,6)
histogram(TP1_TP2_area_timecourse_2205(find(TP1_TP2_area_timecourse_2205(2:end,2)>0),1).*0.2916, edges,'FaceColor','r');
xlabel('Cell area ($\mu m^2$)', 'FontSize',12, 'Interpreter','latex')
ylabel('Number of cells', 'FontSize', 10)
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
yl3 = ylim;
% Find leftmost xLeft
yLeft = min([yl1(1), yl2(1), yl3(1)]);
% Find rightmost xRight
yRight = max([yl1(2), yl2(2), yl3(2)]);
subplot(2,3,1);
ylim([yLeft, yRight]);
xlim([50 3000]);
subplot(2,3,2);
ylim([yLeft, 600]);
xlim([50 3000]);
subplot(2,3,3);
ylim([yLeft, 600]);
xlim([50 3000]);
subplot(2,3,4);
ylim([yLeft, yRight]);
xlim([50 3000]);
subplot(2,3,5);
ylim([yLeft, 700]);
xlim([50 3000]);
subplot(2,3,6);
ylim([yLeft, 700]);
xlim([50 3000]);


%************** Fig5G-I: Compare area distribution tracked tp1->tp2 versus tp1->tp4 (wt, 111, 2205):
set(groot, ...
'DefaultFigureColor', 'w', ...
'DefaultAxesLineWidth', 0.5, ...
'DefaultAxesXColor', 'k', ...
'DefaultAxesYColor', 'k', ...
'DefaultAxesFontUnits', 'points', ...
'DefaultAxesFontSize', 11, ...
'DefaultAxesFontName', 'Arial', ...
'DefaultLineLineWidth', 1, ...
'DefaultTextFontUnits', 'Points', ...
'DefaultTextFontSize', 11, ...
'DefaultTextFontName', 'Arial', ...
'DefaultAxesBox', 'off', ...
'DefaultAxesTickLength', [0.02 0.025]);
set(groot, 'DefaultAxesTickDir', 'out');
set(groot, 'DefaultAxesTickDirMode', 'manual');
edges=linspace(0,3000,100);
colors = cbrewer('qual', 'Set2', 10);
subplot(2,3,1)
histogram(TP1_TP4_area_timecourse_wt(find(TP1_TP4_area_timecourse_wt(2:end,2)>0),1).*0.2916, edges,'FaceColor', colors(4,:));
hold on;
histogram(TP1_TP2_area_timecourse_wt(find(TP1_TP2_area_timecourse_wt(2:end,2)>0),1).*0.2916, edges,'FaceColor', 'm');
legend('DAI0 -> DAI3', 'DAI0 -> DAI1');
title('WT')
xlabel('Cell area ($\mu m^2$)', 'FontSize',12, 'Interpreter','latex')
ylabel('Number of cells', 'FontSize', 10)
yl1 = ylim;
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
subplot(2,3,2)
histogram(TP1_TP4_area_timecourse_111(find(TP1_TP4_area_timecourse_111(2:end,2)>0),1).*0.2916, edges,'FaceColor',colors(4,:));
hold on;
histogram(TP1_TP2_area_timecourse_111(find(TP1_TP2_area_timecourse_111(2:end,2)>0),1).*0.2916, edges,'FaceColor', 'm');
legend('DAI0 -> DAI3', 'DAI0 -> DAI1');
title('#111');
xlabel('Cell area ($\mu m^2$)', 'FontSize',12, 'Interpreter','latex')
ylabel('Number of cells', 'FontSize', 10)
yl2 = ylim;
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
subplot(2,3,3)
histogram(TP1_TP4_area_timecourse_2205(find(TP1_TP4_area_timecourse_2205(2:end,2)>0),1).*0.2916, edges,'FaceColor',colors(4,:));
hold on;
histogram(TP1_TP2_area_timecourse_2205(find(TP1_TP2_area_timecourse_2205(2:end,2)>0),1).*0.2916, edges,'FaceColor','m');
legend('DAI0 -> DAI3', 'DAI0 -> DAI1');
title('#2205');
xlabel('Cell area ($\mu m^2$)', 'FontSize',12, 'Interpreter','latex')
ylabel('Number of cells', 'FontSize', 10)
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
yl3 = ylim;
% Find leftmost xLeft
yLeft = min([yl1(1), yl2(1), yl3(1)]);
% Find rightmost xRight
yRight = max([yl1(2), yl2(2), yl3(2)]);
subplot(2,3,1);
ylim([yLeft, yRight]);
subplot(2,3,2);
ylim([yLeft, 1000]);
subplot(2,3,3);
ylim([yLeft, 1000]);


%%******************Fig 6: area distribution composition growth_rate>1 and
%%growth_rate<1
set(groot, ...
'DefaultFigureColor', 'w', ...
'DefaultAxesLineWidth', 0.5, ...
'DefaultAxesXColor', 'k', ...
'DefaultAxesYColor', 'k', ...
'DefaultAxesFontUnits', 'points', ...
'DefaultAxesFontSize', 11, ...
'DefaultAxesFontName', 'Arial', ...
'DefaultLineLineWidth', 1, ...
'DefaultTextFontUnits', 'Points', ...
'DefaultTextFontSize', 11, ...
'DefaultTextFontName', 'Arial', ...
'DefaultAxesBox', 'off', ...
'DefaultAxesTickLength', [0.02 0.025]);
% set the tickdirs to go out - need this specific order
set(groot, 'DefaultAxesTickDir', 'out');
set(groot, 'DefaultAxesTickDirMode', 'manual');
edges=linspace(0,3000,100);
colors = cbrewer('qual', 'Set1', 10);
subplot(2,2,1)
histogram(area_timecourse_wt_vert(find(area_timecourse_wt_vert(2:end,2)>0),1).*0.2916, edges,'FaceColor', colors(1,:), 'EdgeColor', colors(2,:));
hold on;
histogram(area_growth_rate_less_wt_vert(2:end,1).*0.2916, edges, 'FaceColor', colors(7,:), 'EdgeColor', colors(2,:));
hold on;
histogram(area_growth_rate_above_wt_vert(2:end,1).*0.2916, edges, 'FaceColor', colors(3,:), 'EdgeColor', colors(2,:), 'FaceAlpha',0.8);
legend('tracked', 'tracked + g<1', 'tracked + g>1');
title('wt', 'FontWeight','Normal');
xlabel('Cell area ($\mu m^2$)',  'Interpreter','latex')
ylabel('Number of cells')
yl1 = ylim;
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
subplot(2,2,2)
histogram(area_timecourse_111_vert(find(area_timecourse_111_vert(2:end,2)>0),1).*0.2916, edges,'FaceColor', colors(1,:), 'EdgeColor', colors(2,:));
hold on;
histogram(area_growth_rate_less_111_vert(2:end,1).*0.2916, edges, 'FaceColor', colors(7,:), 'EdgeColor', colors(2,:));
hold on;
histogram(area_growth_rate_above_111_vert(2:end,1).*0.2916, edges, 'FaceColor', colors(3,:), 'EdgeColor', colors(2,:), 'FaceAlpha',0.8);
legend('tracked',  'tracked + g<1', 'tracked + g>1');
title('#111', 'FontWeight','Normal');
xlabel('Cell area ($\mu m^2$)',  'Interpreter','latex')
ylabel('Number of cells')
yl2 = ylim;
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
subplot(2,2,3)
histogram(area_timecourse_2205_vert(find(area_timecourse_2205_vert(2:end,2)>0),1).*0.2916, edges,'FaceColor', colors(1,:), 'EdgeColor', colors(2,:));
hold on;
histogram(area_growth_rate_less_2205_vert(2:end,1).*0.2916, edges,'FaceColor', colors(7,:), 'EdgeColor', colors(2,:));
hold on;
histogram(area_growth_rate_above_2205_vert(2:end,1).*0.2916, edges, 'FaceColor', colors(3,:), 'EdgeColor', colors(2,:), 'FaceAlpha',0.8);
legend('tracked',  'tracked + g<1', 'tracked + g>1');
title('#2205', 'FontWeight','Normal');
xlabel('Cell area ($\mu m^2$)',  'Interpreter','latex')
ylabel('Number of cells')
box off;
set(gca,'linewidth',1.1)
set(gca,'FontSize',12)
yl3 = ylim;
% Find leftmost xLeft
yLeft = min([yl1(1), yl2(1), yl3(1)]);
% Find rightmost xRight
yRight = max([yl1(2), yl2(2), yl3(2)]);
subplot(2,2,1);
ylim([yLeft, yRight]);
subplot(2,2,2);
ylim([yLeft, 900]);
subplot(2,2,3);
ylim([yLeft, 900]);


%%***********Fig7A: Statistical One-way ANOVA analysis *********************%%
H=notBoxPlot(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, cont))), cell2mat(T2.controlcode(find(contains(T2.control, cont)))));
set([H.data],'MarkerSize',3)
set([H.mu],'color','w', 'LineWidth',1.4)
%set([H.med],'color',':y', 'LineWidth',1.4)
%J=jet(10);
for ii=1:length(H)
set(H(ii).sdPtch,'FaceColor',colors(ii,:),...
'EdgeColor','none')
set(H(ii).semPtch,'FaceColor',colors(ii,:)*0.5,...
'EdgeColor','none')
end
box on
set(gca,'TickDir','Out')
set(gca,'linewidth',1.5)
%str=sprintf('p = %.2g',p_an); %if No floting varibale number, use %d
%annotation('textbox',[0.6 0.2 0.6 0.6],'String',str,'FitBoxToText','on', 'EdgeColor', 'none');
ylim([0 1.5])
%xticklabels([string(unique(T2.control(find(contains(T2.control, cont))), 'stable')')])
xticklabels({'wt', '#111', '#2205'})
xtickangle(45)
xlabel('',  'Interpreter','latex');
ylabel('$\frac{n_{g>1}}{n_{g<1}}$', 'Fontsize',34,'Interpreter','latex', 'FontName','Arial');
title('Comparison of control data', 'FontSize', 12,  'FontWeight','Normal')
set(gca,'box','off')
grid  off
mysigstar(gca, [1 2], max([mean(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'wt_{control}')))) mean(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'bag111_{control}')))) mean(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'bag2205_{control}'))))])+...
max([std(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'wt_{control}')))) std(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'bag111_{control}')))) std(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'bag2205_{control}'))))])+0.2, p_an_12);
mysigstar(gca, [1 3], max([mean(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'wt_{control}')))) mean(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'bag111_{control}')))) mean(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'bag2205_{control}'))))])+...
max([std(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'wt_{control}')))) std(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'bag111_{control}')))) std(T2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2.control, 'bag2205_{control}'))))])+0.3, p_an_13);
ylim([0 2])
yticks([0 0.5 1 1.5 2])
grid on


%%***********Fig7B: Statistical One-way ANOVA analysis *********************%%
set(groot, ...
'DefaultFigureColor', 'w', ...
'DefaultAxesLineWidth', 0.5, ...
'DefaultAxesXColor', 'k', ...
'DefaultAxesYColor', 'k', ...
'DefaultAxesFontUnits', 'points', ...
'DefaultAxesFontSize', 11, ...
'DefaultAxesFontName', 'Arial', ...
'DefaultLineLineWidth', 1, ...
'DefaultTextFontUnits', 'Points', ...
'DefaultTextFontSize', 11, ...
'DefaultTextFontName', 'Arial', ...
'DefaultAxesBox', 'off', ...
'DefaultAxesTickLength', [0.02 0.025]);
% set the tickdirs to go out - need this specific order
set(groot, 'DefaultAxesTickDir', 'out');
set(groot, 'DefaultAxesTickDirMode', 'manual');
[p_an_12, tbl_an, stat_an] = anova1(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'wt_{control}')|contains(T2_tp1_tp2.control, 'bag111_{control}'))),...
T2_tp1_tp2.control(find(contains(T2.control, 'wt_{control}')|contains(T2_tp1_tp2.control, 'bag111_{control}'))), 'off');
close all;
[p_an_13, tbl_an, stat_an] = anova1(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'wt_{control}')|contains(T2_tp1_tp2.control, 'bag2205_{control}'))),...
T2_tp1_tp2.control(find(contains(T2_tp1_tp2.control, 'wt_{control}')|contains(T2_tp1_tp2.control, 'bag2205_{control}'))), 'off');
close all;
H=notBoxPlot(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, cont))), cell2mat(T2_tp1_tp2.controlcode(find(contains(T2_tp1_tp2.control, cont)))));
set([H.data],'MarkerSize',3)
set([H.mu],'color','w', 'LineWidth',1.4)
%set([H.med],'color',':y', 'LineWidth',1.4)
%J=jet(10);
for ii=1:length(H)
set(H(ii).sdPtch,'FaceColor',colors(ii,:),...
'EdgeColor','none')
set(H(ii).semPtch,'FaceColor',colors(ii,:)*0.5,...
'EdgeColor','none')
end
box on
set(gca,'TickDir','Out')
set(gca,'linewidth',1.5)
%str=sprintf('p = %.2g',p_an); %if No floting varibale number, use %d
%annotation('textbox',[0.6 0.2 0.6 0.6],'String',str,'FitBoxToText','on', 'EdgeColor', 'none');
ylim([0 1.5])
%xticklabels([string(unique(T2.control(find(contains(T2.control, cont))), 'stable')')])
xticklabels({'wt', '#111', '#2205'})
xtickangle(45)
xlabel('',  'Interpreter','latex');
ylabel('$\frac{n_{g>1}}{n_{g<1}}$', 'Fontsize',34,'Interpreter','latex', 'FontName','Arial');
title('Comparison of control data', 'FontSize', 12,  'FontWeight','Normal')
set(gca,'box','off')
grid  off
mysigstar(gca, [1 2], max([mean(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'wt_{control}')))) mean(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'bag111_{control}')))) mean(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'bag2205_{control}'))))])+...
max([std(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'wt_{control}')))) std(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'bag111_{control}')))) std(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'bag2205_{control}'))))])+0.2, p_an_12);
mysigstar(gca, [1 3], max([mean(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'wt_{control}')))) mean(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'bag111_{control}')))) mean(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'bag2205_{control}'))))])+...
max([std(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'wt_{control}')))) std(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'bag111_{control}')))) std(T2_tp1_tp2.CellNumber_Tracked_Growthrate_ratio(find(contains(T2_tp1_tp2.control, 'bag2205_{control}'))))])+0.3, p_an_13);
ylim([0 2])
yticks([0 0.5 1 1.5 2])
grid on


%%*********Fig 7C: Statistical anlaysis of average area growth rate*******  
 J1= hsv;
H=notBoxPlot(T2_tp1_tp3.Mean_growth_rate(find(contains(T2_tp1_tp3.control, cont))), cell2mat(T2_tp1_tp3.controlcode(find(contains(T2_tp1_tp3.control, cont)))));
set([H.data],'MarkerSize',7)
set([H.mu],'color','w', 'LineWidth',1.6)
%set([H.med],'color',':y', 'LineWidth',1.4)
for ii=1:length(H)
set(H(ii).sdPtch,'FaceColor',J1(ii,:),...
'EdgeColor','none')
set(H(ii).semPtch,'FaceColor',J1(ii,:)*0.3,...
'EdgeColor','none')
end
box on
set(gca,'TickDir','Out')
set(gca,'linewidth',1.5)
%str=sprintf('p = %.2g',p_an); %if No floting varibale number, use %d
%annotation('textbox',[0.6 0.2 0.6 0.6],'String',str,'FitBoxToText','on', 'EdgeColor', 'none');
%xticklabels([string(unique(T2.control(find(contains(T2.control, cont))), 'stable')')])
xticklabels({'wt', 'bag111', 'bag2205'})
xtickangle(45)
xlabel('',  'Interpreter','latex', 'Fontsize',12, 'FontName','Arial');
set(gca,'FontSize',14)
%ylabel('$\frac{n_{g>1}}{n_{g<1}}$', 'Fontsize',34,'Interpreter','latex', 'FontName','Arial');
ylabel('Average growth rate of tracked cells');
title('Comparison of control data', 'FontSize', 12)
set(gca,'box','off')
grid  on
hold on;
boxplot(T2_tp1_tp3.Mean_growth_rate(find(contains(T2_tp1_tp3.control, cont))), T2_tp1_tp3.controlcode(find(contains(T2_tp1_tp3.control, cont))), 'OutlierSize',25, 'Symbol', 'w.', 'Widths',0.3);
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
set(lines,'linestyle','-.', 'Color', [1 1 1 0]);
lines = findobj(gcf, 'type', 'line', 'Tag', 'Box');
set(lines,'linestyle','-.', 'Color', [1 1 1 0]);
xticklabels({'wt', '#111', '#2205'})
xtickangle(0)
xlabel('',  'Interpreter','latex', 'Fontsize',12, 'FontName','Arial');
set(gca,'FontSize',14);
ylim([0.75 1.5]);
[p_an, tbl_an, stat_an] = anova1(T2_tp1_tp3.Mean_growth_rate(find(contains(T2_tp1_tp3.control, cont))), T2_tp1_tp3.control(find(contains(T2_tp1_tp3.control, cont))), 'on');

%%**** Additional Figure 3: Density plot 
clear points
clear density
clear minvals
clear maxvals
clear xidx
clear yidx
grid = 256;   %refinement of map
subplot(1,3,3)
points_2205(:,1)= area_timecourse_2205_vert(find(area_timecourse_2205_vert(:,2)>0),2).*0.2916;
points_2205(:,2) =  (area_timecourse_2205_vert(find(area_timecourse_2205_vert(:,2)>0),1).*0.2916-area_timecourse_2205_vert(find(area_timecourse_2205_vert(:,2)>0),2).*0.2916)./(area_timecourse_2205_vert(find(area_timecourse_2205_vert(:,2)>0),2).*0.2916);
points(:,1) = points_2205(:,2);
points(:,2) = points_2205(:,1);
minvals = min(points);
maxvals = max(points);
rangevals = maxvals - minvals;
xidx = 1 + round((points(:,1) - minvals(1)) ./ rangevals(1) * (grid-1));
yidx = 1 + round((points(:,2) - minvals(2)) ./ rangevals(2) * (grid-1));
density = accumarray([yidx, xidx], 1, [grid,grid]);  %note y is rows, x is cols
imagesc(density/sum(density(:)), 'xdata', [minvals(1), maxvals(1)], 'ydata', [minvals(2), maxvals(2)]);
imagesc(density/sum(density(:)), 'xdata', [minvals(1), maxvals(1)], 'ydata', [minvals(2), maxvals(2)]);
set(gca,'YDir','normal')
caxis([0, 0.0003]);
xlim([0 3])
%ylim([1000 10000])
subplot(1,3,2)
points_111(:,1)= area_timecourse_111_vert(find(area_timecourse_111_vert(:,2)>0),2).*0.2916;
points_111(:,2) =  (area_timecourse_111_vert(find(area_timecourse_111_vert(:,2)>0),1).*0.2916-area_timecourse_111_vert(find(area_timecourse_111_vert(:,2)>0),2).*0.2916)./(area_timecourse_111_vert(find(area_timecourse_111_vert(:,2)>0),2).*0.2916);
clear points
clear density
clear minvals
clear maxvals
clear xidx
clear yidx
points(:,1) = points_111(:,2);
points(:,2) = points_111(:,1);
minvals = min(points);
maxvals = max(points);
rangevals = maxvals - minvals;
xidx = 1 + round((points(:,1) - minvals(1)) ./ rangevals(1) * (grid-1));
yidx = 1 + round((points(:,2) - minvals(2)) ./ rangevals(2) * (grid-1));
density = accumarray([yidx, xidx], 1, [grid,grid]);  %note y is rows, x is cols
imagesc(density/sum(density(:)), 'xdata', [minvals(1), maxvals(1)], 'ydata', [minvals(2), maxvals(2)]);
imagesc(density/sum(density(:)), 'xdata', [minvals(1), maxvals(1)], 'ydata', [minvals(2), maxvals(2)]);
set(gca,'YDir','normal')
caxis([0, 0.0003]);
xlim([0 3])
%ylim([1000 10000])
subplot(1,3,1)
points_wt(:,1)= area_timecourse_wt_vert(find(area_timecourse_wt_vert(:,2)>0),2).*0.2916;
points_wt(:,2) =  (area_timecourse_wt_vert(find(area_timecourse_wt_vert(:,2)>0),1).*0.2916-area_timecourse_wt_vert(find(area_timecourse_wt_vert(:,2)>0),2).*0.2916)./(area_timecourse_wt_vert(find(area_timecourse_wt_vert(:,2)>0),2).*0.2916);
clear points
clear density
clear minvals
clear maxvals
clear xidx
clear yidx
points(:,1) = points_wt(:,2);
points(:,2) = points_wt(:,1);
minvals = min(points);
maxvals = max(points);
rangevals = maxvals - minvals;
xidx = 1 + round((points(:,1) - minvals(1)) ./ rangevals(1) * (grid-1));
yidx = 1 + round((points(:,2) - minvals(2)) ./ rangevals(2) * (grid-1));
density = accumarray([yidx, xidx], 1, [grid,grid]);  %note y is rows, x is cols
imagesc(density/sum(density(:)), 'xdata', [minvals(1), maxvals(1)], 'ydata', [minvals(2), maxvals(2)]);
imagesc(density/sum(density(:)), 'xdata', [minvals(1), maxvals(1)], 'ydata', [minvals(2), maxvals(2)]);
set(gca,'YDir','normal')
caxis([0, 0.0003]);
xlim([0 3])
%ylim([1000 10000])
hold on;
colorbar('Ticks',[-5,-2,1,4,7],...
'TickLabels',{'Cold','Cool','Neutral','Warm','Hot'})
xlabel('Relative cell area growth',  'Interpreter','latex')
subplot(1,3,2)
xlabel('Relative cell area growth',  'Interpreter','latex')
subplot(1,3,3)
xlabel('Relative cell area growth',  'Interpreter','latex')
subplot(1,3,1)
ylabel('Initial cell area ($\mu m^2$)',  'Interpreter','latex')
title('WT')
subplot(1,3,2)
title('#111')
subplot(1,3,3)
title('#2205')
%%********************************************************************

