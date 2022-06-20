//This macro has been elaborate to analyse quantitatively the levels of colocalisation of two different proteins

//First, some warnings will appear to remember the user the effects of this macro
waitForUser("Important", "Please, change the names of the channels to C1 and C2 respectively");
waitForUser("Important", "Please remember to remove the results log and the excel from previously runned macros or it will overwrite the data");
waitForUser("Important", "Please remember that this macro is thought for 9 slides images");

//Preprocessing channel 2
selectWindow("C2");
run("Duplicate...", "title=Substract duplicate");
selectWindow("C2");
run("Subtract Background...", "rolling=15 stack");
selectWindow("Substract");
run("Gaussian Blur...", "sigma=10 stack");
selectWindow("C2");
imageCalculator("Subtract create stack", "C2","Substract");
selectWindow("Result of C2");
setAutoThreshold("Default dark");
run("Threshold...");
waitForUser("In case of incorrect threshold adjust it manually and press ok");
run("Convert to Mask", "method=Default background=Dark black");
run("Erode", "stack");
run("Dilate", "stack");

//Preprocessing channel 1

selectWindow("C1");
run("Duplicate...", "title=Substract duplicate");
selectWindow("C1");
run("Subtract Background...", "rolling=15 stack");
selectWindow("Substract");
run("Gaussian Blur...", "sigma=10 stack");
selectWindow("C1");
imageCalculator("Subtract create stack", "C1","Substract");
selectWindow("Result of C1");
setAutoThreshold("Default dark");
run("Threshold...");
waitForUser("In case of incorrect threshold adjust it manually and press ok");
run("Convert to Mask", "method=Default background=Dark black");
run("Erode", "stack");
run("Dilate", "stack");

//Important step, multiplication of both binary images, we obtain only the pixels that co-localise, with value = 1
imageCalculator("Multiply create stack", "Result of C1","Result of C2");

//Measuring of de colocalisation channel
selectWindow("Result of Result of C1");
run("Duplicate...", "duplicate range=2-9");
selectWindow("Result of Result of C1-1");
run("Duplicate...", "duplicate range=2-8");
run("Duplicate...", "duplicate range=2-7");
run("Duplicate...", "duplicate range=2-6");
run("Duplicate...", "duplicate range=2-5");
run("Duplicate...", "duplicate range=2-4");
run("Duplicate...", "duplicate range=2-3");
run("Duplicate...", "duplicate range=2-2");
selectWindow("Result of Result of C1");
run("Create Selection");
run("Measure");
selectWindow("Result of Result of C1-1");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of Result of C1-2");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of Result of C1-3");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of Result of C1-4");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of Result of C1-5");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of Result of C1-6");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of Result of C1-7");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of Result of C1-8");
run("Create Selection");
run("Measure");
close();

//Measuring of Channel 1
selectWindow("Result of C1");
run("Duplicate...", "duplicate range=2-9");
selectWindow("Result of C1-1");
run("Duplicate...", "duplicate range=2-8");
run("Duplicate...", "duplicate range=2-7");
run("Duplicate...", "duplicate range=2-6");
run("Duplicate...", "duplicate range=2-5");
run("Duplicate...", "duplicate range=2-4");
run("Duplicate...", "duplicate range=2-3");
run("Duplicate...", "duplicate range=2-2");
selectWindow("Result of C1");
run("Create Selection");
run("Measure");
selectWindow("Result of C1-1");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C1-2");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C1-3");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C1-4");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C1-5");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C1-6");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C1-7");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C1-8");
run("Create Selection");
run("Measure");
close();

//Measuring of Channel 2
selectWindow("Result of C2");
run("Duplicate...", "duplicate range=2-9");
selectWindow("Result of C2-1");
run("Duplicate...", "duplicate range=2-8");
run("Duplicate...", "duplicate range=2-7");
run("Duplicate...", "duplicate range=2-6");
run("Duplicate...", "duplicate range=2-5");
run("Duplicate...", "duplicate range=2-4");
run("Duplicate...", "duplicate range=2-3");
run("Duplicate...", "duplicate range=2-2");
selectWindow("Result of C2");
run("Create Selection");
run("Measure");
selectWindow("Result of C2-1");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C2-2");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C2-3");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C2-4");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C2-5");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C2-6");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C2-7");
run("Create Selection");
run("Measure");
close();
selectWindow("Result of C2-8");
run("Create Selection");
run("Measure");
close();

selectWindow("Substract");
close();
selectWindow("Substract");
close();
selectWindow("C2");
close();
selectWindow("C1");
close();

//Save results, remember to change the destination of the excel
saveAs("Results", "add path to destination folder");