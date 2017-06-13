% Testing the image analysis. 

% Load the data. 
deltaPhaseFiles = dir('data/lacI_titration/O2_delta_phase*.tif');
deltaYFPFiles = dir('data/lacI_titration/O2_delta_auto*.tif');

% Look at the first phase image. 
phaseIm = imread(['data/lacI_titration/' deltaPhaseFiles(1).name]);

imshow(phaseIm, [])

% Before, we used imtool. Now let's just look at the image histogram. 
minPhase = min(min(phaseIm));
maxPhase = max(max(phaseIm));
imhist(phaseIm, 4000);
xlim([minPhase,maxPhase]);

% Looking at the histogram, we can choose a threshold value. 
