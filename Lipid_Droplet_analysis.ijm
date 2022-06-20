//This macro has been elaborated to process and analyse quantitatively the volume and number of lipid droplets in HepG2 cells. 
 
waitForUser("Important", "This macro is developed for a 16-bit and .tif images.");
waitForUser("Important", "This macro is developed for a 2 channel image. Please, be sure your image of interest is in channel 2.");
	
	inputDir = getDirectory("Choose your input channel folder");
	outputDir = getDirectory("Choose your map output folder");
	filelist = getFileList(inputDir); 
	
	for (i = 0; i < lengthOf(filelist); i++) {
		if (endsWith(filelist[i], ".tif")) { 
        	open(inputDir + File.separator + filelist[i]); 
       		name = getTitle(); 
        	rename("image_" + i); 
		}
		
		selectWindow("image_" + i);
		run("Duplicate...", "title=duplicate duplicate");
		run("Duplicate...", "title=substract duplicate");
		run("Gaussian Blur...", "sigma=10 stack");
		imageCalculator("Subtract create stack", "duplicate", "substract");
		selectWindow("Result of duplicate");
		run("Split Channels");
		selectWindow("image_" + i);
		close();
		selectWindow("substract");
		close();
		selectWindow("duplicate");
		close();
		selectWindow("C1-Result of duplicate");
		close();
		selectWindow("C2-Result of duplicate");
		run("Brightness/Contrast...");
		run("Enhance Contrast", "saturated=0.35");
		waitForUser("Important", "please, select the region of the duplicate you want to analise and press OK");
		run("Duplicate...", "title=Final duplicate");
		selectWindow("Final");
		waitForUser("Important", "choose the Duplicate stack option in the next information box and the number of slides to analise");
		run("Duplicate...");
		selectWindow("Final-1");
		run("3D Objects Counter", "threshold=600 slice=15 min.=10 max.=125829120 objects statistics summary");	
		selectWindow("Objects map of Final-1");
		saveAs("Tiff", outputDir + "/Objects map of image" + i + ".tif");
		waitForUser("Important", "Please, save the log results into an excel document and press OK");	
		selectWindow("Objects map of image" + i + ".tif");
		close();
		selectWindow("Final");
		close();
		selectWindow("Final-1");
		close();
		selectWindow("C2-Result of duplicate");
		close();
	}

