% analyze the picture of E coli

% first we need to find the cells in the
% phase image
Phase = imread('Phase.tif');
imshow(Phase,[])

% look at the YFP signal
expression = imread('YFP_regulated.tif');
imshow(expression,[])

% look at the volume marker
marker = imread('mCherry_constitutive.tif');
imshow(marker,[])

% find a threshold for the marker image
imhist(marker,50)
threshold = 10000;
imThresh = marker > threshold;

imshow(imThresh)

% we can get rid of cells which touch the border
imThresh2 = imclearborder(imThresh);

imshow(imThresh2)

% let's sort through the objects and keep
% only the cells

% label all objects in the image
imLabel = bwlabel(imThresh2);
imshow(imLabel,[])

imtool(imLabel)

% look at object 6
Current_cell = imLabel == 6;

imshow(Current_cell)

% use the "mask" to isolate the fluorescence of the object
Fluor_cell = immultiply(Current_cell, expression);

imshow(Fluor_cell,[])

% use regionprops to find object areas
properties = regionprops(imLabel,'Area');

%  make a vector of areas
areas = [properties.Area];

hist(areas,20)

% use a area range to discard some objects
area_min = 50;
area_max = 200;

% write that goes through and keeps
% all of the objects with area between
% 50 and 200

% create a black picture the size of phase
imSorted = zeros(size(Phase));

% write a loop that finds individual cells and adds
% them to the blank image
for k = 1:max(max(imLabel))
    % if the area the right size
    if areas(k) < area_max && areas(k) > area_min
        imSorted = imSorted +(imLabel==k);
    end
end

imshow(imSorted,[])

% extract the fluorescence values

% relabel the new thresholded image
imLabel2 = bwlabel(imSorted);

% clear some variables in case we run it multiple times
clear Cell_size Cell_intensity

% find the fluorescence and size of each cell
for k = 1:max(max(imLabel2))
    Current_cell = imLabel2==k;
    Cell_size(k) = sum(sum(Current_cell));
    Fluor_cell = immultiply(Current_cell, expression);
    Cell_intensity(k) = sum(sum(Fluor_cell));
end

hist(Cell_intensity)

hist(Cell_intensity./Cell_size)

% calculate the mean of the cells
mean(Cell_intensity./Cell_size)

