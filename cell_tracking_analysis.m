clear all;
close all;

plot_save_choice= 1;

continue_choice = 'Y';
col = {'r', 'b', 'k', 'g', 'm', 'y', 'c'};
    
root_data_folder = uigetdir('/home/local/W2K3AGP/j.dawson/scsb/Protoplasts/ExperimentData_Jonathan/Ralf_Welsch/');
tp1 = input('First time point (2,3,4 etc)? '); 
tp2 = input('Second time point (2,3,4 etc)? '); 
well_labels_path = sprintf('%s/well_label_b.txt', root_data_folder);
fileID = fopen(well_labels_path, 'r');
well_char_extract = textscan(fileID,'%s', 'delimiter', '\n');
fclose(fileID);
n_wells=length(well_char_extract{1});
tp_array(1,1) = tp1;
tp_array(1,2) = tp2;

already_computed = input('Is the tracking already done?');
if(already_computed==1)
  for(Nwell=1:n_wells)
      nn_counter = 0;
      fileID = fopen(sprintf('%s/%s_filename_log.txt', root_data_folder, well_char_extract{1}{Nwell}),'w');
      fprintf(fileID,'%s',sprintf('%s_area_circ_gt2_TP1_TP%d',well_char_extract{1}{Nwell} ,tp_array(1,2) ));
      fclose(fileID);
  end 

    
else 

for(Nwell=[1:n_wells ] )
    clearvars -except root_data_folder well_char_extract tp_array n_wells well_labels_path tp2 Nwell;
    legend_counter = 0;
    nn_counter = 0;
    
    while(nn_counter<2)
        data_folder = sprintf('%s/Tob19C_%s_TP%d',root_data_folder,well_char_extract{1}{Nwell} ,tp_array(1,nn_counter+1));
        addpath(genpath(data_folder));

        legend_counter =legend_counter+1;
        cell_counter = 0 ;
        
        tp(nn_counter+1) = {data_folder(end-2:end)};
        
        day_number(nn_counter+1) = nn_counter+1;

        result = dir(fullfile(data_folder, sprintf('*Binary.txt', day_number(nn_counter+1)))); 
        image = dir(fullfile(data_folder, '*Raw.tif')); 
        roi = dir(fullfile(data_folder, '*Binary.zip')); 
        roiname=[roi.folder filesep roi.name];
        eval(['i_' int2str(day_number(nn_counter+1)) '= imread(image.name)' ';']);

        [cvsROIs] = ReadImageJROI(roiname); 
        Xroi = zeros(length(cvsROIs),1);
        Yroi = zeros(length(cvsROIs),1);
        rectX1 = zeros(length(cvsROIs),1);
        rectY1 = zeros(length(cvsROIs),1);
        rectX2 = zeros(length(cvsROIs),1);
        rectY2 = zeros(length(cvsROIs),1);

        for i=1:length(cvsROIs) 
            XYroi= cvsROIs{i}.strName;
            Yroi(i)=str2double(XYroi(1:4));
            Xroi(i)=str2double(XYroi(6:9));
            rectX1(i)=cvsROIs{i}.vnRectBounds(1);
            rectX2(i)=cvsROIs{i}.vnRectBounds(3);
            rectY1(i)=cvsROIs{i}.vnRectBounds(2);
            rectY2(i)=cvsROIs{i}.vnRectBounds(4);
        end

    eval(['rectxy1_' int2str(day_number(nn_counter+1)) '= [rectX1 rectY1]' ';']);
    eval(['rectxy2_' int2str(day_number(nn_counter+1)) '= [rectX2 rectY2]' ';']);
    eval(['rectxy1_' int2str(day_number(nn_counter+1)) '( rectxy1_' int2str(day_number(nn_counter+1)) '==0)=0.001;' ]);
    eval(['rectxy2_' int2str(day_number(nn_counter+1)) '( rectxy2_' int2str(day_number(nn_counter+1)) '==0)=0.001;' ]);


    result_file = result.name;
    opts = detectImportOptions(result_file);
    opts.SelectedVariableNames = {'Area', 'Circ_' 'X', 'Y'};
    T = readtable(result_file, opts);
    area = T.Area;
    eval(['area_' int2str(day_number(nn_counter+1)) '= T.Area' ';']);
    eval(['circ_' int2str(day_number(nn_counter+1)) '= T.Circ_' ';']);
    eval(['xy_' int2str(day_number(nn_counter+1)) '= [T.X T.Y]' ';']);
    eval (['t' int2str(nn_counter+1) '= size(xy_' int2str(day_number(nn_counter+1)) ');']);   %initialize 't1' for the first time point; later used in 'rangesearch()' below
    eval (['t' int2str(nn_counter+1) '= xy_' int2str(day_number(nn_counter+1)) ';']);

    if(nn_counter >0)
        epsilon = 80; %input('Enter nearest neighbor threshold: ')%;

        a_min_threshold = 0;
        a_threshold = 1000000000; %input('Enter upper limit of area in DAI 2 ')%;
        
        eval([ 'a_submax_id = find(area_' int2str(day_number(nn_counter+1)) '<a_threshold & area_' int2str(day_number(nn_counter+1)) '>a_min_threshold );' ]);
        eval(['a_submax' '= zeros(length(area_' int2str(nn_counter+1) '),1) ;'   ]) ;%initialize
        eval(['area_timecourse' '= zeros(length(area_' int2str(nn_counter+1) '),1) ;'   ]) ;%initialize
        eval(['id_timecourse' '= zeros(length(area_' int2str(nn_counter+1) '),1) ;'   ]) ;%initialize
        eval(['a_submax(a_submax_id, :) = area_' int2str(nn_counter+1) '(a_submax_id,:);' ]);
        eval([ 'area_timecourse(a_submax_id, :) =  area_' int2str(day_number(nn_counter+1)) '(a_submax_id)' ';']); %initialize 'area_timecourse' for horizontal concatonating of AREA timecourse
         eval([ 'circ_timecourse(a_submax_id, :) =  circ_' int2str(day_number(nn_counter+1)) '(a_submax_id)' ';']);
        eval(['t' int2str(nn_counter+1) '= zeros(length(area_' int2str(nn_counter+1) '),2) ;'   ]) ;%initialize
        eval([ 't' int2str(nn_counter+1) '(a_submax_id,:)= xy_' int2str(day_number(nn_counter+1)) '(a_submax_id, :);' ]);
        eval(['[idx ,  D  ] =' 'rangesearch(t' int2str(nn_counter) ',' 't' int2str(nn_counter+1)  ', epsilon , ''Distance'', ''euclidean'' )' ';']);

        id_curr_nonempt=find(~cellfun(@isempty, idx));
        id_prev_nonempt=cell2table(idx(id_curr_nonempt));
        id_prev_nonempt=table2array(id_prev_nonempt);
        [D_nearest, id_nearest] = cellfun(@min, D, 'UniformOutput', false); 

        %replace empty cells by 0's.
        tf = cellfun('isempty', idx);
        idx(tf)={0};

        for k=1:length(idx)
            if(length(idx{k})>1)
                [val_nearest, ind_nearest] =(min(D{k}));
                idx{k} = idx{k}(ind_nearest);
            end
            clear val_nearest;
            clear ind_nearest;
        end

        %* "id_with_zeros" converts the above cell into array. 
        %**works only if a given cell element has ONLY ONE entry. Need to adapt for the case with multiple entries**
        id_with_zeros = [idx{:}]';
        eval(['idx_' int2str(day_number(nn_counter)) '_' int2str(day_number(nn_counter+1)) '= id_with_zeros ;'   ]);
        id_of_non_zeros = find(id_with_zeros);
        id_of_non_zeros_in_t2 = id_with_zeros(find(id_with_zeros));
        id_curr_nonempt = find(id_with_zeros~=0);
        id_prev_nonempt = id_with_zeros(find(id_with_zeros~=0));
        eval (['id_' int2str(day_number(nn_counter)) '_' int2str(day_number(nn_counter+1)) '= id_curr_nonempt;']);

        %EXTRACT AREAS/PERIMETERS of CELLS in the two compared timepoints
        eval(['area_' int2str(day_number(nn_counter)) '_' int2str(day_number(nn_counter+1)) '= zeros(length(id_with_zeros),1) ;'   ]);
        eval(['area_' int2str(day_number(nn_counter)) '_' int2str(day_number(nn_counter+1)) '( id_of_non_zeros,: )'  '= area_' int2str(day_number(nn_counter)) '(id_of_non_zeros_in_t2,:) ;'   ]);
        
        eval([ 'area_timecourse = horzcat(' 'area_timecourse' ',' 'area_' int2str(day_number(nn_counter)) '_' int2str(day_number(nn_counter+1)) ');'  ]);
        eval(['circ_' int2str(day_number(nn_counter)) '_' int2str(day_number(nn_counter+1)) '= zeros(length(id_with_zeros),1) ;'   ]);
        eval(['circ_' int2str(day_number(nn_counter)) '_' int2str(day_number(nn_counter+1)) '( id_of_non_zeros,: )'  '= circ_' int2str(day_number(nn_counter)) '(id_of_non_zeros_in_t2,:) ;'   ]);

        eval([ 'circ_timecourse = horzcat(' 'circ_timecourse' ',' 'circ_' int2str(day_number(nn_counter)) '_' int2str(day_number(nn_counter+1)) ');'  ]);
        eval([ 'id_timecourse = horzcat(' 'id_timecourse' ',' 'idx_' int2str(day_number(nn_counter)) '_' int2str(day_number(nn_counter+1)) ');'  ]);

    end
    nn_counter = nn_counter +1;

    clear time;
    clear pos;
    clear epsilon;
    clear id_curr_nonempt;
    clear id_prev_nonempt;
    clear idx;
    clear id_with_zeros;
    clear id_nearest;
    clear id_nearest_array;
    clear length_idx;
    clear D;
    clear D_nearest;
    clear tf_idnearest;
    clear cell_counter;
    
    end 


    %******* for exporting simply area of cells that have expanded area greater than two times (doubled) *******
    if(nn_counter>1)
    area_growth_rate_gt2 = area_timecourse(find(area_timecourse(:,2)>0 & (area_timecourse(:,1))./(area_timecourse(:,2))>=2), :);
    circ_growth_rate_gt2 = circ_timecourse(find(area_timecourse(:,2)>0 & (area_timecourse(:,1))./(area_timecourse(:,2))>=2), :);
    id_area_growth_rate_gt_2 =(find(area_timecourse(:,2)>0 & area_timecourse(:,1)./area_timecourse(:,2)>=2));
    area_growth_rate_factor = zeros(length(area_timecourse),1);    
    area_growth_rate_factor(find(area_timecourse(:,2)>0),1) = area_timecourse(find(area_timecourse(:,2)>0),1)./area_timecourse(find(area_timecourse(:,2)>0),2);
    
    end
    area_circ_growth_rate_gt_2(:,1:2) = area_growth_rate_gt2;
    area_circ_growth_rate_gt_2(:,3:4) = circ_growth_rate_gt2;
    
    area_circ_growth_rate(:,1:2) = area_timecourse;
    area_circ_growth_rate(:,3:4) = circ_timecourse;
    
    idcs = strfind(data_folder, '/');
    plot_dir = data_folder(1:idcs(end)-1);
    well_char = well_char_extract{1}{Nwell};


    output_area_circ_gt2_tp_text = sprintf('area_circ_gt2_%s_%s', tp{1}, tp{2});
    output_name_area_circ_gt2 = sprintf('%s_%s', well_char, output_area_circ_gt2_tp_text);
    output_name_area_circ_well_tp = sprintf('%s_%s_%s_%s', well_char, 'area_circ',tp{1}, tp{2} );
    
    fid = fopen(sprintf('%s_filename_log.txt', well_char),'wt');
    fprintf(fid, output_name_area_circ_gt2);
    fclose(fid);
    movefile(sprintf('%s_filename_log.txt', well_char), plot_dir);

    dlmwrite(sprintf('%s.txt', output_name_area_circ_gt2), area_circ_growth_rate_gt_2, 'delimiter', ' ');
    movefile(sprintf('%s.txt', output_name_area_circ_gt2), plot_dir);
    dlmwrite(sprintf('%s.txt', output_name_area_circ_well_tp), area_circ_growth_rate, 'delimiter', ' ');
    movefile(sprintf('%s.txt', output_name_area_circ_well_tp), plot_dir);
    ncell_store(1,1)=length(xy_1);
    ncell_store(1,2)=length(area_growth_rate_gt2);
    dlmwrite(sprintf('%s_%s_%s_N_cell.txt', well_char, tp{1}, tp{2}), ncell_store,'delimiter', ' ');
    movefile(sprintf('%s_%s_%s_N_cell.txt', well_char, tp{1}, tp{2}), plot_dir);

end
end





