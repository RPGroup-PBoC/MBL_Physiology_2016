
% look at a picture of a cell
colony = imread('colony_growth_01.tif');
imshow(colony)

% scale the image to the min and max of the pixel values
imshow(colony,[])

% automatically find the names of all images in a folder
images = dir('*.tif');

images

images(1).name

% to find a threshold value to identify the cells
colony = imread(images(1).name);

imshow(colony,[])

% look at the pixel values, use pixel region
imtool(colony,[])

% a good threshold value is 150
% see if the threshold
threshold = 140;
colony_thresh = colony > threshold;

imshow(colony_thresh)

% estimate the area of the colony
% by adding up the pixels
sum(sum(colony_thresh))

%%%% Let the students try by themselves
% write a loop to analyze all 61 images
% 1. read in the image
% 2. apply the threshold
% 3. calcuate the area
% 4. record the area in a vector called 'area'


% first read in the images by number
i = 1;

colony = imread(images(i).name);

% save the data in a vector called area
area = [];

for i = 1:61
colony = imread(images(i).name);
colony_thresh = colony>threshold;
area(i) = sum(sum(colony_thresh));
end

% plot area vs. time
% create a vector of time
% pictures are 5 minutes apart
time = 0:5:300; % time in minutes

plot(time,area)

% have as CVS file
csvwrite('data.csv',[area;time])

plot(time, log(area),'o')


% convert area to number of cells
num_cells = area / area(5);

% fit for the r (1/min)
fitk = polyfit(time, log(num_cells),1);

fitk

% calculate the doubling
log(2) / fitk(1)

