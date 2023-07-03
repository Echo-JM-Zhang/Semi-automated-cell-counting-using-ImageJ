# Semi-automated-cell-counting-using-ImageJ
ImageJ macro used for semi-automated cell counting. 

Preparation steps:
1. Download and install ImageJ
2. Put macro file '1 - Scale and brightness.ijm' under fiji-win64\Fiji.app\macros folder. fiji-win64 (or other names depending on your operating system) locates where you download and install ImageJ)

How to Use these macro to speed up cell counting:
1. File -> Open -> '2 - Clear and measure2.ijm'
2. click run
3. In the pop up window, select file you want to count
4. Enter number of ROI (region of interest) in your file (how many regions you are planning to counting)
5. Select all your ROIs (refer to an ATLAS for this step)
6. Contrast and brightness will be automatically adjusted. A window will pop up show the area of the first ROI (you can adjust '1 - Scale and brightness.ijm' in corresponding to your image scale)
7. Adjust the threshold to choose cells
8. Enter number of despeckles you want to apply (despeckle will wash out noise)
9. Click 'yes' if you want to run watershed and 'no' if not. (watershed will breakdown gathered cells)
10. The number of cells in the region will be shown in the pop up window. Record the number and click OK. This would automatically open the same image and continue for the next ROI until all ROIs are analyzed
