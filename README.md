These codes were developed for Dawson et al. 2022 'Determination of Protoplast Growth Properties using Quantitative Single-Cell Tracking Analysis'

**General Comments**
All files necessary for using extra plugins in ImageJ (such as Template Matchig) are stored in our Github's subfolder 'ImageJ_plugins'. These files should be copied into the 'plugins' folder of ImageJ.

**Nomenclature of image files:**
- All image files obtained from microscopy should be in the '.tif' format
- Each image file should be named in the following manner: Experimentcode_WellrowWellcolumn_Timepoint
- For example: 
    - Our images were recorded in a 96 plate well (rows=B,C,D and columns=1,2,3...,12); 
    - The experiment code for one particular experiment was given to be: Tob19C
    - Each timepoint was labelled as TP, i.e., DAI0 labelled as TP1, DAI1 as TP2, DAI2 as TP3, DAI3 as TP4
    - Therefore, an image with filename 'Tob19C_1B_TP1' means recording of the well 1B on DAI0 of the experiment Tob19C
- Any deviation from this nomenclature for image filenames will require adjustment in the provided source codes

**Data architecture required for running the scripts:**
- All the image files of all the wells and all the timepoints from one experiment are stored in 1 parent folder (for clear identification, name the parent   folder with the Experiment code mentioned in the preceeding section). 
  For example, the folder hierarchy for the experiment labeled experiment code Tob19C will be Tob19C>{Tob19C_1B_TP1.tif, Tob19C_1B_TP2.tif,...,             
  Tob19C_2B_TP1.tif, Tob19C_2B_TP2.tif,..., Tob19C_12D_TP2.tif}.
  Deviations from this hierarchy will require some small adjustments to the tracking code so that the correct image files are found.
- The parent folder that contains all the image files [also contains a text file in .txt format] (such as the uploaded file **well_label_b.txt**) which contains a list of all the well names (such as 1B,2B...) with one well name per line. 
  

**Flow of code execution**
- (0) Each image: Within each well across timepoints (DAI0, DAI1, DAI2...) images should be aligned to correct for any major shifts that can occur during         recording. This alignment is done in ImageJ using the plugin 'Template Matching'. The resulting aligned images **should replace** the original images       in the parent folder. To perform alignment processing on the images, the ImageJ code '...' should be run in ImageJ. 
- (1) Start ImageJ and open and run the IJ code 'Process_DIC_Tobacco_3.ijm'
    - When you start the code execution a GUI will appear that will ask for the directory/folder where all the image files (in .tif format) are stored,           select the correct folder. 
    - The above process initiated by running '**Process_DIC_Tobacco_3.ijm**' creates within the parent folder multiple sub-folders, one sub-folder for each           image (a sub-folders name is the same as its corresponding image) in which the deep learning based image segmentation results are stored.
    - Each sub-folder of its corresponding image, i.e., the image of a particular well and timepoint, consists of: (a) Roi file of the segmented cells,           (b) Binary image (.tif format) of segmented cells, (c) Result file (.txt file) containing various measurements of the segmented cells in the binary         image. 
- (2) In the next step, load another ImageJ code '**Process_DIC_CellCluster_Filter.ijm**'
    - This code runs through each sub-folder (that corresponds to each image file) and further processes, using ImageJ plugin 'Spleckle Inspector', the           binary image stored in that sub-folder and saves a new binary image in which all clusters of cells touching each other are removed. The new binary         image is again analysed and the new result files are stored in the .txt format. 
- (3) Third step involves running the Matlab code '**cell_tracking_analysis.m**'
    - Running this code will prompt the user to enter the first time point, whether 1 or 2 or 3 etc. (1 corresponds to TP1, 2 to TP2 etc.) and the folder,       this would be the parent folder, in which the image files and their corresponding sub-folders are stored. 
- (4) Fourth step involves running the Matlab code '**statistical_data_analysis.m**' 
    - After this code is successfully executed, the Matlab workspace will be populated with various tables, arrays and cell structures which are used to         plot various distributions, statistical measurements etc. which are reported in this article. 
- As an aid to understand how the data in the Matlab's workspace generated after the execution of step (4) is used, a Matlab script file                    '**manuscript_figure_plotting_script.m**' is uploaded. In this file various Matlab scripts used to generate each figure reported in this article is          presented.   
