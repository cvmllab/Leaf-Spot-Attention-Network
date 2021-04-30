clear
clc
%% gpu settings
delete(gcp('nocreate'));
numberOfWorkers = 2; % Set the number of gpu
parpool(numberOfWorkers);

%% data load
image = imageDatastore('./data',...
                      'IncludeSubfolders',true,...
                      'LabelSource','foldernames',...
                      'FileExtensions',{'.jpg'});
rng(0);
image = shuffle(image);

% Divide the data into training and validation data sets. Use 70% of the images for training and 30% for validation. splitEachLabel splits the images datastore into two new datastores.
[trainingImages,validationImages] = splitEachLabel(image, 0.7);
numTrainImages = numel(trainingImages.Labels);

%% image resize 224 224
trainingImages.ReadFcn = @customReadDatastoreImage;
validationImages.ReadFcn = @customReadDatastoreImage;

%% load network (untrained network)
load('./network/VGG16_seg_ver2_fcn_2weight_trainbefor.mat');
lgraph = lgraph_1; 

%% train
miniBatchSize = 10;
numIterationsPerEpoch = floor(numTrainImages/miniBatchSize);
options = trainingOptions('sgdm',...
    'MiniBatchSize',miniBatchSize,...
    'MaxEpochs', 30,...
    'Verbose',true,...
    'InitialLearnRate',1e-4,...
    'Plots','training-progress',...
    'ValidationData',validationImages,...
    'ExecutionEnvironment','parallel',....
    'ValidationFrequency',numIterationsPerEpoch);

netTransfer = trainNetwork(trainingImages, lgraph, options);
%% save network
save('./network/result_VGG16_seg_ver2_fcn_2weight_trainbefor.mat', 'netTransfer')

%%
function data = customReadDatastoreImage(filename)
% code from default function: 
onState = warning('off', 'backtrace'); 
c = onCleanup(@() warning(onState)); 
data = imread(filename); % added lines: 
data = data(:,:,min(1:3, end)); 
data = imresize(data,[224 224], 'method', 'bilinear');
end
