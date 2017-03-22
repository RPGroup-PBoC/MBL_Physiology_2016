%We want to count the number of spots as a function of time in
%each one of our movies. Let's start with the 5' movie.

%1) Obtain a list of images corresponding to the 5' movie.
%2) Figure out the threshold by looking at a frame where
%you start to see dots.

%For each image do:
%3) Read the image
%4) Thake the threshold
%5) Count the number of spots in the image using bwlabel
%6) Save the information

%When done:
%7) Repeat for the 3' movie
%8) Plot number of spots vs. time

%Process the 5' data
%Get the list of images
D5=dir('5*.tif');

%We look at frame 41
Image=imread(D5(41).name);
%imtool(Image,[]);       %Use the [] because we're dealing
                        %with a 16-bit image
%We choose a threshold of 950
Threshold=950;

%Now go through each frame
for i=1:length(D5)
    Image=imread(D5(i).name);   %Load the image
    ImageThresh=Image>Threshold;%Take the threshold
    ImageLabel=bwlabel(ImageThresh);    %Label the image
    NSpots5(i)=max(max(ImageLabel)); %Count the spots
end

%Plot NSpots5 vs. frames
Frames5=1:length(D5);
plot(Frames5-99,NSpots5,'-r')
%Here, we subtracted 99 from the frames such that
%frame=0 corresponds to the anaphase we identified
%in the movie


%Now, repeat for the 3'

%Get the list of images
D3=dir('3*.tif');

%Now go through each frame
for i=1:length(D3)
    Image=imread(D3(i).name);   %Load the image
    ImageThresh=Image>Threshold;%Take the threshold
    ImageLabel=bwlabel(ImageThresh);    %Label the image
    NSpots3(i)=max(max(ImageLabel)); %Count the spots
end

%Plot NSpots3 vs. frames
Frames3=1:length(D3);
hold on
plot(Frames3-125,NSpots3,'-b')
hold off


    


                        
                        
                        











