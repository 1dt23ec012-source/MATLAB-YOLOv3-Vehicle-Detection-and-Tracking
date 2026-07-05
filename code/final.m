clc; clear; close all;

%% Setup
videoFile = 'C:\Users\ayush\Downloads\traffic.mp4 (2).mp4';
videoReader = VideoReader(videoFile);
videoPlayer = vision.DeployableVideoPlayer();

% Load pretrained YOLOv3 detector (make sure you have Deep Learning Toolbox Model for YOLOv3)
detector = yolov3ObjectDetector('darknet53-coco');

% Vehicle classes of interest
vehicleClasses = ["car", "bus", "truck", "motorbike"];

% Tracker setup: tracking vehicle centers with Kalman filter
tracker = multiObjectTracker( ...
    'FilterInitializationFcn', @initKalmanFilter, ...
    'AssignmentThreshold', 30, ...
    'ConfirmationParameters', [3, 5]);

frameCount = 0;
trackerInitialized = false;

% Minimum detection confidence to consider
scoreThreshold = 0.5;

while hasFrame(videoReader)
    frame = readFrame(videoReader);
    frameCount = frameCount + 1;

    % Run detection on current frame
    [bboxes, scores, labels] = detect(detector, frame);

    % Filter to vehicles and above score threshold
    idx = ismember(labels, vehicleClasses) & scores > scoreThreshold;
    bboxes = bboxes(idx, :);
    scores = scores(idx);
    labels = labels(idx);

    % Visualize raw detections for debugging
    frameWithDetections = insertObjectAnnotation(frame, 'rectangle', bboxes, cellstr(labels), 'Color', 'yellow');

    % Prepare detections for tracker: use bbox centers only
    detections = objectDetection.empty;
    for i = 1:size(bboxes,1)
        center = bboxes(i,1:2) + bboxes(i,3:4)/2;
        detections(end+1) = objectDetection(frameCount, center, 'MeasurementNoise', 1 - scores(i)); %#ok<SAGROW>
    end

    % Update tracker with detections
    if ~isempty(detections)
        confirmedTracks = tracker(detections, frameCount);
        trackerInitialized = true;
    elseif trackerInitialized
        confirmedTracks = tracker([], frameCount);
    else
        confirmedTracks = [];
    end

    % Draw tracked vehicle bounding boxes (fixed size 50x50) and IDs
    outputFrame = frameWithDetections;
    boxSize = [50 50];
    for i = 1:numel(confirmedTracks)
        cx = confirmedTracks(i).State(1);
        cy = confirmedTracks(i).State(2);
        bbox = [cx - boxSize(1)/2, cy - boxSize(2)/2, boxSize];
        id = confirmedTracks(i).TrackID;
        label = sprintf('ID: %d', id);
        outputFrame = insertObjectAnnotation(outputFrame, 'rectangle', bbox, label, 'Color', 'green');
    end

    % Display the result
    step(videoPlayer, outputFrame);

    if ~isOpen(videoPlayer)
        break;
    end
end

release(videoPlayer);

%% Local function: initialize Kalman filter for a detection
function filter = initKalmanFilter(detection)
    center = detection.Measurement; % [x y]
    initialState = [center(1); center(2); 0; 0]; % [x y vx vy]
    initialCovariance = diag([100 100 100 100]);
    filter = trackingKF('MotionModel', '2D Constant Velocity', ...
                        'State', initialState, ...
                        'StateCovariance', initialCovariance, ...
                        'MeasurementModel', [1 0 0 0; 0 1 0 0]);
end
