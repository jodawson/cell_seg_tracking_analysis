%clear all;
clearvars -except T*_* test*
stat_plot_choice=0;
means_array_cont = zeros(12,1);
means_array_tea = zeros(12,1);
tp1 = input('First time point (1,2,3,4 etc)? ');
tp2 = input('Second time point (2,3,4 etc)? ');
extract_data_folder = uigetdir('/home/local/W2K3AGP/j.dawson/scsb/Protoplasts/ExperimentData_Jonathan/Ralf_Welsch/');
%filename_op = sprintf('analysis_tp17_%s_%s_%s_eps%d_amin%d_amax%d.png',tp{1},tp{2},well_char,epsilon, a_min_threshold, a_threshold);
well_labels_path = sprintf('%s/well_label_b.txt', extract_data_folder);
fileID = fopen(well_labels_path, 'r');
well_char_extract = textscan(fileID,'%s', 'delimiter', '\n');
fclose(fileID);
n_wells=length(well_char_extract{1});
plot_dir_stat_ncell_area_gt_2 = extract_data_folder;
%filename_op = input('Enter the filename for saving analysis(end with .ps) ');
fileID2 = fopen('wellid_ncell_2.txt', 'a');
fprintf(fileID2,'%s %s %s %s %s %s %s %s %s %s %s %s\n', 'WellID', 'CellNumber_Tracked_TP1', 'CellNumber_Tracked_Growthrate_2', 'CellNumber_Tracked_Growthrate_less_2', 'CellNumber_Tracked_Growthrate_ratio','Percentage_Tracked_Growthrate_2', 'Percentage_Tracked_Growthrate_2_Circ_0p9', 'mean_start_area_tracked_Growthrate_2','deviation', 'Mean_growth_rate', 'gr_deviation', 'Replicate');
heatmap_wellid_char = {};
heatmap_wellid_num = {};
area_growth_rate_above_wt_vert=zeros(1,4);
area_growth_rate_above_111_vert=zeros(1,4);
area_growth_rate_above_194_vert=zeros(1,4);
area_growth_rate_above_2205_vert=zeros(1,4);
area_growth_rate_less_wt_vert=zeros(1,4);
area_growth_rate_less_111_vert=zeros(1,4);
area_growth_rate_less_194_vert=zeros(1,4);
area_growth_rate_less_2205_vert=zeros(1,4);
area_timecourse_wt_vert=zeros(1,4);
area_timecourse_111_vert=zeros(1,4);
area_timecourse_194_vert=zeros(1,4);
area_timecourse_2205_vert=zeros(1,4);

for n= 1:n_wells

    path_area_timecourse = sprintf('%s/%s_%s_TP%s_TP%s.txt', extract_data_folder, well_char_extract{1}{n}, 'area_circ',num2str(tp1), num2str(tp2) );
    
    area_timecourse_readin = dlmread(path_area_timecourse);
    area_growth_rate_above_1_readin = area_timecourse_readin(find(area_timecourse_readin(:,2)>0 & (area_timecourse_readin(:,1))./(area_timecourse_readin(:,2))>1), :);
    area_growth_rate_less_1_readin = area_timecourse_readin(find(area_timecourse_readin(:,2)>0 & (area_timecourse_readin(:,1))./(area_timecourse_readin(:,2))<=1), :);
   if(str2double(regexp(well_char_extract{1}{n},'\d*','Match'))>=1 & str2double(regexp(well_char_extract{1}{n},'\d*','Match'))<=4 & ismember(well_char_extract{1}{n}(isletter(well_char_extract{1}{n})), ['B' 'C' 'D'])==1)
        %area_growth_rate_vert = sprintf('%s_area_growth_rate','wt');
        area_growth_rate_above_wt_vert = vertcat(area_growth_rate_above_wt_vert,area_growth_rate_above_1_readin);
        area_growth_rate_less_wt_vert = vertcat(area_growth_rate_less_wt_vert,area_growth_rate_less_1_readin);
        area_timecourse_wt_vert = vertcat(area_timecourse_wt_vert,area_timecourse_readin);

    elseif(str2double(regexp(well_char_extract{1}{n},'\d*','Match'))>=5 & str2double(regexp(well_char_extract{1}{n},'\d*','Match'))<=6  & ismember(well_char_extract{1}{n}(isletter(well_char_extract{1}{n})), ['B' 'C' 'D'])==1)
        %area_growth_rate_vert = sprintf('%s_area_growth_rate','111');
        area_growth_rate_above_111_vert = vertcat(area_growth_rate_above_111_vert,area_growth_rate_above_1_readin);
        area_growth_rate_less_111_vert = vertcat(area_growth_rate_less_111_vert,area_growth_rate_less_1_readin);
        area_timecourse_111_vert = vertcat(area_timecourse_111_vert, area_timecourse_readin);
    elseif(str2double(regexp(well_char_extract{1}{n},'\d*','Match'))>=7 & str2double(regexp(well_char_extract{1}{n},'\d*','Match'))<=9  & ismember(well_char_extract{1}{n}(isletter(well_char_extract{1}{n})), ['B' 'C' 'D'])==1)
        %area_growth_rate_vert = sprintf('%s_area_growth_rate','194');
        area_growth_rate_above_194_vert = vertcat(area_growth_rate_above_194_vert,area_growth_rate_above_1_readin);
        area_growth_rate_less_194_vert = vertcat(area_growth_rate_less_194_vert,area_growth_rate_less_1_readin);
        area_timecourse_194_vert = vertcat(area_timecourse_194_vert, area_timecourse_readin);
    elseif(str2double(regexp(well_char_extract{1}{n},'\d*','Match'))>=10 & str2double(regexp(well_char_extract{1}{n},'\d*','Match'))<=12  & ismember(well_char_extract{1}{n}(isletter(well_char_extract{1}{n})), ['B' 'C' 'D'])==1)
       % area_growth_rate_vert = sprintf('%s_area_growth_rate','2205'); 
        area_growth_rate_above_2205_vert = vertcat(area_growth_rate_above_2205_vert,area_growth_rate_above_1_readin);
        area_growth_rate_less_2205_vert = vertcat(area_growth_rate_less_2205_vert,area_growth_rate_less_1_readin);
       area_timecourse_2205_vert = vertcat(area_timecourse_2205_vert, area_timecourse_readin);
    end

    normalized_ncell_area_growth_rate_above(n,1) = length(area_growth_rate_above_1_readin)/(length(find(area_timecourse_readin(:,2)>0))); 
    %normalized_ncell_area_growth_rate_gt_2_circ_gt_0p8(n,1) = length(find(area_growth_rate_above_1_readin(:,3)>0.8))/(length(find(area_timecourse_readin(:,2)>0))); 
    normalized_ncell_area_growth_rate_gt_2_circ_gt_0p8(n,1) =length(find(area_timecourse_readin(:,2)>400)); 
    mean_start_area_tracked_growth_rate_gt_2(n,1) = mean(area_growth_rate_above_1_readin(:,2));
    deviation_start_area_tracked_growth_rate_gt_2(n,1) = std(area_growth_rate_above_1_readin(:,2));
    mean_growth_rate_tracked(n,1) = mean(area_growth_rate_above_1_readin(:,1)./area_growth_rate_above_1_readin(:,2));
    deviation_growth_rate_tracked(n,1) = std(area_growth_rate_above_1_readin(:,1)./area_growth_rate_above_1_readin(:,2));
    tot_ncell_tp1 = length(find(area_timecourse_readin(:,2)>0));
    tracked_ncell_above = length(area_growth_rate_above_1_readin);
    tracked_ncell_less = length(area_growth_rate_less_1_readin);
    fprintf(fileID2, '%s %d %d %d %.2f %.3f %.3f %.3f %3f %3f %.3f %s\n',well_char_extract{1}{n} , tot_ncell_tp1, tracked_ncell_above,tracked_ncell_less,tracked_ncell_above/tracked_ncell_less, normalized_ncell_area_growth_rate_above(n,1),normalized_ncell_area_growth_rate_gt_2_circ_gt_0p8(n,1), mean_start_area_tracked_growth_rate_gt_2(n,1), deviation_start_area_tracked_growth_rate_gt_2(n,1),mean_growth_rate_tracked(n,1),deviation_growth_rate_tracked(n,1),'XX');
    
    heatmap_wellid_char = [ heatmap_wellid_char, well_char_extract{1}{n}(2:2)];
    heatmap_wellid_char = string( heatmap_wellid_char);
    heatmap_wellid_char = unique(heatmap_wellid_char);
    heatmap_wellid_num = [ heatmap_wellid_num, well_char_extract{1}{n}(1:1)];
    heatmap_wellid_num = string( heatmap_wellid_num);
    heatmap_wellid_num = unique(heatmap_wellid_num);
end
fclose(fileID2);
movefile('wellid_ncell_2.txt', plot_dir_stat_ncell_area_gt_2);

T2 = readtable(sprintf('%s/wellid_ncell_2.txt', plot_dir_stat_ncell_area_gt_2));
vec_replicate= (contains(T2.WellID, ["B", "C", "D"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL  
T2.Replicate(vec_replicate)={'BioR'};
clear vec_replicate;
vec_replicate= (contains(T2.WellID, ["E", "F", "G", "H"]));   %% ***IF THE WELL IS F,G,H THEN LABEL AS BIOLOGICAL 
T2.Replicate(vec_replicate)={'20nM'};

% T2 = readtable(sprintf('%s/wellid_ncell_2.txt', plot_dir_stat_ncell_area_gt_2));
% nrow = size(T2,1);
% T2.control= repmat({''}, nrow, 1);
% vec_replicate= (contains(T2.WellID, ["7F", "7G","8F", "8G","10F", "10G", "11F", "11G","12F", "12G"]));   %% ***IF THE WELL IS F,G THEN LABEL AS CONT
% T2.control(vec_replicate)={'wt_{CONT}'};
% vec_replicate= (contains(T2.WellID, ["7D", "7E","8D", "8E","10D", "10E", "11D", "11E","12D", "12E"]));   %% ***IF THE WELL IS D,E THEN LABEL AS A1-2-7
% T2.control(vec_replicate)={'A1-2-7'};
% vec_replicate= (contains(T2.WellID, ["7B", "7C","8B", "8C","10B", "10C", "11B", "11C","12B", "12C"]));   %% ***IF THE WELL IS B,C THEN LABEL AS A4-3-6
% T2.control(vec_replicate)={'A4-3-6'};
% %[p_test, tbl_test, stat_test] = anova1(T2.Percentage_Tracked_Growthrate_2, T2.control, 'on');
% cont='CONT'


% vec_replicate= (contains(T2.WellID, ["B", "C"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL  
% T2.Replicate(vec_replicate)={'A4-3-6'};
% clear vec_replicate;
% vec_replicate= (contains(T2.WellID, ["D", "E"]));   %% ***IF THE WELL IS F,G,H THEN LABEL AS BIOLOGICAL 
% T2.Replicate(vec_replicate)={'A-1-2-7'};
% vec_replicate= (contains(T2.WellID, ["F","G"]));   %% ***IF THE WELL IS F,G,H THEN LABEL AS BIOLOGICAL 
% T2.Replicate(vec_replicate)={'wt_{CONT}'};

%T2 = readtable(sprintf('%s/wellid_ncell_2.txt', plot_dir_stat_ncell_area_gt_2));
nrow = size(T2,1)
T2.control= repmat({''}, nrow, 1);
T2.controlcode= repmat({''}, nrow, 1);
vec_replicate= (contains(T2.WellID, ["1B", "1C", "1D", "2B", "2C", "2D","3B", "3C", "3D", "4B", "4C", "4D"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL
T2.control(vec_replicate)={'wt_{control}'};
T2.controlcode(vec_replicate)={1};
vec_replicate= (contains(T2.WellID, ["7B", "7C", "7D", "8B", "8C", "8D", "9B", "9C", "9D"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL
T2.control(vec_replicate)={'bag194'};
vec_replicate= (contains(T2.WellID, ["5B", "5C", "5D", "6B", "6C", "6D"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL
T2.control(vec_replicate)={'bag111_{control}'};
T2.controlcode(vec_replicate)={2};
vec_replicate= (contains(T2.WellID, ["10B", "10C", "10D", "11B", "11C", "11D", "12B", "12C", "12D"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL
T2.control(vec_replicate)={'bag2205_{control}'};
T2.controlcode(vec_replicate)={3};
vec_replicate= (contains(T2.WellID, ["1E", "1F", "1G", "1H","2E", "2F", "2G", "2H","3E", "3F", "3G", "3H", "4E", "4F", "4G", "4H"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL
T2.control(vec_replicate)={'wt_{tea}'};
vec_replicate= (contains(T2.WellID, ["7E", "7F", "7G", "7H","8E", "8F", "8G", "8H", "9E", "9F", "9G", "9H"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL
T2.control(vec_replicate)={'{194}'};
vec_replicate= (contains(T2.WellID, ["5E", "5F", "5G", "5H", "6E", "6F", "6G", "6H"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL
T2.control(vec_replicate)={'111_{tea}'};
vec_replicate= (contains(T2.WellID, ["10E", "10F", "10G", "10H","11E", "11F", "11G", "11H", "12E", "12F", "12G", "12H"]));   %% ***IF THE WELL IS B,C,D,E THEN LABEL AS TECHNICAL
T2.control(vec_replicate)={'2205_{tea}'};
%[p_test, tbl_test, stat_test] = anova1(T2.Percentage_Tracked_Growthrate_2, T2.control, 'on');
cont='control';


eval(['T2_tp' num2str(tp1) '_tp' num2str(tp2) '= T2;' ]);
eval(['TP' num2str(tp1) '_TP' num2str(tp2) '_area_timecourse_wt = area_timecourse_wt_vert;']);
eval(['TP' num2str(tp1) '_TP' num2str(tp2) '_area_timecourse_111 = area_timecourse_111_vert;']);
eval(['TP' num2str(tp1) '_TP' num2str(tp2) '_area_timecourse_2205 = area_timecourse_2205_vert;']);
 

%************************Box plot with selected rows based on Control or
%TEA*******************
% [p_an, tbl_an, stat_an] = anova1(T2.Percentage_Tracked_Growthrate_2(find(contains(T2.control, cont))), T2.control(find(contains(T2.control, cont))), 'on');
% close(figure(1));
% boxplot(T2.Percentage_Tracked_Growthrate_2(find(contains(T2.control, cont))), T2.control(find(contains(T2.control, cont))), 'OutlierSize',25, 'Symbol', 'w.', 'Widths',0.3);
% hAx=gca;
% hAx.XAxis.TickLabelInterpreter='tex';            % make sure interpreter set
% for i = 2:length(hAx.XTickLabel)
% hAx.XTickLabel(i)={['\color{DarkGreen}' hAx.XTickLabel{i}]};
% end
% xlabel('',  'Interpreter','latex', 'Fontsize',12, 'FontName','Arial');
% ylabel('Average growth rate', 'Interpreter','latex', 'Fontsize',12, 'FontName','Arial');
% set(gca,'FontSize',14)
% str=sprintf('p = %.2g',p_an); %if No floting varibale number, use %d
% annotation('textbox',[0.75, 0.8, 0.1, 0.1],'String',str,'FitBoxToText','on', 'EdgeColor', 'none');
% colors = ones(4,3).*([0.2 0.2 0.2]);
% %colors = rand(4,3);
% h = findobj(gca,'Tag','Box');
% for j=1:length(h)
% patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',0.2);
% end
% lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
% set(lines, 'Color', 'b');
% hold on;
% plot([1 2 3 4],[stat_an.means(1) stat_an.means(2) stat_an.means(3) stat_an.means(4)], 'k.', 'MarkerSize', 30 );
% % get the current tick labeks
% yt = get(gca, 'YTick');
% %axis([xlim    1  (max(yt)*1.12)])
% xt = get(gca, 'XTick');
% hold on
%***************************************************