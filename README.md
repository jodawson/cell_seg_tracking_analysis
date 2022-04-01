These codes were developed for Dawson et al. 2022 'Determination of Protoplast Growth Properties using Quantitative Single-Cell Tracking Analysis'

**Nomenclature of image files:**
- Image files obtained from microscopy should be in the '.tif' 
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
  Tob19C_2B_TP1.tif, Tob19C_2B_TP2.tif,..., Tob19C_12D_TP2.tif}
  Deviations from this hierarchy will require some small adjustments to the tracking code so that the correct image files are found.
- The parent folder that contains all the image files also contains a text file (such as .txt format) which contains a list of all the well names (such as 1B,2B...) with one well name per line. 
  

**Flow of code execution**
- Start ImageJ and open and run the IJ code 'Process_DIC_Tobacco_3.ijm'
    - When you start the code execution a GUI will appear that will ask for the directory/folder where all the image files (in .tif format) are stored,           select the correct folder 
    - When the process started by running this code ends the parent folder containing all the image files will be populated by sub-folders 
- 
