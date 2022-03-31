dir1 = getDirectory("Select the folder that contains the image files in .tif format") ;
list = getFileList(dir1);
list = Array.sort(list);
setBatchMode(true);

	for (i =0 ; i < list.length; i++) 

	{
		print(i, list[i]);
	
		
		if(endsWith(list[i], "tif" ) && indexOf(list[i], "1B") >= 0)
		{
			open(dir1+list[i]);
			title_i = getTitle();
			title_folder_i = substring(title_i, 0,  lastIndexOf(title_i, "."));
			close();
			dir1_image = dir1 + title_folder_i;
			path_dir1_image = dir1_image +"/";
			
			File.makeDirectory(dir1_image);

			notiles = 3;
		
			
				for (k = 0; k < notiles; k++) {
				for (j = 0; j < notiles; j++) {

					open(dir1 + list[i]);

					makeRectangle((getWidth/notiles)*j, (getHeight/notiles)*k, (getWidth/notiles)*(1), (getHeight/notiles)*(1));
					run("Crop");
					run("8-bit");
					width = getWidth/1;
					height = getHeight/1;

						
						saveAs("Tif", path_dir1_image + notiles*k + j + ".tif");	
						run("Normalize Local Contrast", "block_radius_x=90 block_radius_y=90 standard_deviations=1 center");

						run("Enhance Contrast...", "saturated=0.8 normalize");
						run("Size...", "width="+width + " height="+height + " constrain interpolation=Bilinear");
						run("Bandpass Filter...", "filter_large=100 filter_small=3 suppress=Horizontal tolerance=5");
						run("Bandpass Filter...", "filter_large=100 filter_small=3 suppress=Vertical tolerance=5");
						run("Job Manager");
					
						call('de.unifreiburg.unet.SegmentationJob.processHyperStack', 'modelFilename=/home/local/W2K3AGP/j.dawson/Documents/caffemodels/2d_cell_net_v0-ralf_arabidopsis_dai01_04jan2020-arabidopsis.modeldef.h5,Tile shape (px):=180x180,weightsFilename=/home/local/W2K3AGP/j.dawson/Documents/caffemodels/2d_cell_net_v0-ralf_arabidopsis_dai01_04nov2020-arabidopsis.caffemodel.h5,gpuId=all available,useRemoteHost=false,processFolder=,average=none,keepOriginal=false,outputScores=false,outputSoftmaxScores=false');	
						run("Make Binary");
						
						run("Fill Holes");
						run("EDM Binary Operations", "iterations=35 operation=open");
					
						run("Size...", "width="+ width+ " height="+height+ " constrain interpolation=Bilinear");
						run("Make Binary");
						run("EDM Binary Operations", "iterations=2 operation=dilate");
						run("Fill Holes");
						run("EDM Binary Operations", "iterations=2 operation=erode");
	   				
	   					saveAs("Tif", path_dir1_image + "Binary" + "_" + notiles*k + j + ".tif");
	
	   					selectWindow("Binary" + "_" + notiles*k + j +  ".tif");
	   					run("Make Binary");
	   					run("Fill Holes");
	   					
	   					run("Set Measurements...", "area standard centroid center perimeter shape feret's skewness redirect=None decimal=3");
						run("Analyze Particles...", "size=10-Infinity circularity=0.01-1.00 display add");
						updateResults(); 
				   		saveAs("Results", path_dir1_image + "Results_" + notiles*k + j + ".txt");
				   		selectWindow ("Results");
				   		run("Close");
						roiManager("Save", path_dir1_image +  "ROI_" + notiles*k + j + ".zip" );
						roiManager("reset") ;
	   					
	   					run("Close");
	   					close();
					
					
				}
			}
			
		tiledir = path_dir1_image;
		xygrid = notiles;	
		overlap = 0;

		run("Grid/Collection stitching", "type=[Grid: row-by-row] order=[Right & Down                ] grid_size_x="+ xygrid + " grid_size_y="+ xygrid + " tile_overlap="+ overlap +" first_file_index_i=0 directory=" + tiledir + " file_names={i}.tif output_textfile_name=TileConfiguration.txt fusion_method=[Linear Blending] regression_threshold=0.30 max/avg_displacement_threshold=2.50 absolute_displacement_threshold=3.50 computation_parameters=[Save memory (but be slower)] image_output=[Fuse and display] output_directory=[" + tiledir +"]");
   	    saveAs("Tiff", tiledir + "Fused_Raw.tif");   	    
    	run("Close All");
    	run("Grid/Collection stitching", "type=[Grid: row-by-row] order=[Right & Down                ] grid_size_x="+ xygrid + " grid_size_y="+ xygrid + " tile_overlap="+ overlap +" first_file_index_i=0 directory=" + tiledir + " file_names=Binary_{i}.tif output_textfile_name=TileConfiguration.txt fusion_method=[Linear Blending] regression_threshold=0.30 max/avg_displacement_threshold=2.50 absolute_displacement_threshold=3.50 computation_parameters=[Save memory (but be slower)] image_output=[Fuse and display] output_directory=[" + tiledir +"]");   	    
   	    run("Make Binary");
   	    run("Watershed");
   	    saveAs("Tiff", tiledir + "Fused_Binary.tif");
   	    run("Set Measurements...", "area standard centroid center perimeter shape feret's skewness redirect=None decimal=3");
		run("Analyze Particles...", "size=10-Infinity circularity=0.01-1.00 display add");
		
		updateResults(); 
		saveAs("Results", path_dir1_image + "Results_Fused_Binary" + ".txt");
		selectWindow ("Results");
		run("Close");
		roiManager("Save", path_dir1_image +  "ROI_Fused_Binary" +  ".zip" );
		roiManager("reset") ;			
   		run("Close");
    	run("Close All");
		}
	}
setBatchMode(false);