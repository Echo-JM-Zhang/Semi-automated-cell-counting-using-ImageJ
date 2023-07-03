path = File.openDialog("Select a File");
  dir = File.getParent(path);
  name = File.getName(path);
 
open(path)

n = getNumber("Enter number of ROI", 1);
for (i=0; i<n; i++){
	waitForUser("Click OK once ROI selected");
	roiManager("add");
}

i=0
while(roiManager("count") != 0){
	//waitForUser("Click OK once image is open");
	roiManager("select", i);
	runMacro("1 - Scale and brightness.ijm");
	setBackgroundColor(0, 0, 0);
	run("Clear Outside");
	run("Measure");
	run("Subtract Background...", "rolling=25");
	run("Threshold...");
	setThreshold(47, 255);
	waitForUser("Click OK once Threshold applied");
	l = getNumber("Enter number of despeckle", 3);
	for (j=0; j<l; j++){
		run("Despeckle");
	}
	if (getBoolean("run watershed")){
		run("Watershed");
	}
	run("Analyze Particles...","size=0.00005-Infinity circularity=0.60-1.00 show=Outlines display exclude clear summarize exclude");
	selectWindow("Summary");
	waitForUser("Click OK once checked");
	cleanUp();
	roiManager("select", i);
	roiManager("delete");
	
	open(path);
}

cleanUp();

function cleanUp() {
    requires("1.30e");
    if (isOpen("Results")) {
         selectWindow("Results"); 
         run("Close" );
    }
    if (isOpen("Summary")) {
    	selectWindow("Summary");
    	run("Close");
    }  
    if (isOpen("Log")) {
         selectWindow("Log");
         run("Close" );
    }
    while (nImages()>0) {
          selectImage(nImages());  
          run("Close");
    }
}

// setBackgroundColor(0, 0, 0);
//run("Clear Outside");
//run("Measure");
//run("Subtract Background...", "rolling=25");
//run("Threshold...");
//setThreshold(47, 255);
//waitForUser("Click OK once Threshold applied");
//n = getNumber("Enter number of despeckle", 3);
//for (i=0; i<n; i++){
	//run("Despeckle");
//}
//if (getBoolean("run watershed")){
	//run("Watershed");
//}
//run("Analyze Particles...","size=0.00005-Infinity circularity=0.60-1.00 show=Outlines display exclude clear summarize exclude");
//selectWindow("Results");
//waitForUser("Click OK once checked");
//run("Close All");