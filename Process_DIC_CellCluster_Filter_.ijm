dir = getDirectory("Select the folder that contains the image files in .tif format");
setBatchMode(true);
processFiles(dir);
function processFiles(dir) 
{
          list = getFileList(dir);
          for (i=0; i<list.length; i++) 
          {
          	if (endsWith(list[i], "/"))
          	processFiles(""+dir+list[i]);
          	else {
          		path = dir+list[i];
          		if (endsWith(path, "Fused_Binary.tif")) {
          			notiles = 2;
                    for (k = 0; k < notiles; k++) {
				    for (j = 0; j < notiles; j++) {
				        open(path);
					    makeRectangle((getWidth/notiles)*j, (getHeight/notiles)*k, (getWidth/notiles)*(1), (getHeight/notiles)*(1));
    					run("Crop");
    					//run("8-bit");
    					width = getWidth/1;
    					height = getHeight/1;
    
    					run("Close-");
                 	    run("Duplicate...", " ");
       	                run("Watershed");
       	   	            run("Speckle Inspector", "big=Fused_Binary.tif small=Fused_Binary-1.tif redirect=None max_speckle_number=1");
       	                selectWindow("Fused_Binary.tif");
    					close();
    					selectWindow("Fused_Binary-1.tif");
    					close();
    					selectWindow("Inspector of Fused_Binary-1.tif"); 
    	   	            run("RGB Stack");
    	   	            run("Stack to Images");
    					selectWindow("Red");
    					run("Open");
			       
    	   			    saveAs("Tif", dir + "Binary" + "_" + notiles*k + j + ".tif");
    	   			    run("Close");
    	   			    }
    	   			    }
				tiledir = dir;
		        xygrid = notiles;
		        overlap = 0;

		        run("Grid/Collection stitching", "type=[Grid: row-by-row] order=[Right & Down                ] grid_size_x="+ xygrid + " grid_size_y="+ xygrid + " tile_overlap="+ overlap +" first_file_index_i=0 directory=" + dir + " file_names=Binary_{i}.tif output_textfile_name=TileConfiguration.txt fusion_method=[Linear Blending] regression_threshold=0.30 max/avg_displacement_threshold=2.50 absolute_displacement_threshold=3.50 computation_parameters=[Save memory (but be slower)] image_output=[Fuse and display] output_directory=[" + dir +"]");
   	    	    saveAs("Tiff", dir + "Fused_Binary_b.tif");
                run("Set Measurements...", "area standard centroid center perimeter shape feret's skewness redirect=None decimal=3");
    			run("Analyze Particles...", " circularity=0.05-1.00 display add");
    			updateResults(); 
    			saveAs("Results", dir + "Results_Fused_Binary" + ".txt");
    			selectWindow ("Results");
    			run("Close");
    			roiManager("Save", dir +  "ROI_Fused_Binary" +  ".zip" );
    			roiManager("reset") ;			
    	   		run("Close");
    	    	run("Close All");
    	    	}
          	}
          }
}
      setBatchMode(false);