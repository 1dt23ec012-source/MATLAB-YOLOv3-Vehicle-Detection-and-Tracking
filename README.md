#  Real-Time Vehicle Detection and Tracking using YOLOv3 in MATLAB

> A MATLAB-based computer vision project implementing real-time vehicle detection and multi-object tracking using the YOLOv3 deep learning model and Kalman Filter-based tracking.

![MATLAB](https://img.shields.io/badge/MATLAB-R2020b+-orange)
![YOLOv3](https://img.shields.io/badge/YOLO-v3-blue)
![Computer%20Vision](https://img.shields.io/badge/Computer%20Vision-Project-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

# Project Overview

This project presents a real-time vehicle detection and tracking system developed using MATLAB's Deep Learning and Computer Vision Toolboxes. A pretrained YOLOv3 model is used to detect vehicles from video streams, while MATLAB's Multi-Object Tracker (Kalman Filter + Hungarian Assignment) maintains unique identities for detected vehicles across consecutive frames.

The system demonstrates how deep learning and object tracking techniques can be integrated for intelligent traffic monitoring and surveillance applications.

---

#  Objectives

- Detect multiple vehicles in real-time video streams.
- Track detected vehicles across consecutive frames.
- Assign unique IDs to moving vehicles.
- Visualize detection and tracking results.
- Demonstrate real-time computer vision using MATLAB.

---

#  System Workflow

```text
Input Video
      │
      ▼
Frame Extraction
      │
      ▼
YOLOv3 Vehicle Detection
      │
      ▼
Bounding Box Generation
      │
      ▼
Kalman Filter + Hungarian Assignment
      │
      ▼
Vehicle Tracking
      │
      ▼
Display Annotated Video
```

---

#  Technologies Used

- MATLAB R2020b+
- Deep Learning Toolbox
- Computer Vision Toolbox
- Image Processing Toolbox
- Automated Driving Toolbox
- YOLOv3 (Darknet-53 COCO)
- Kalman Filter
- Hungarian Assignment Algorithm

---

#  Repository Structure

```text
MATLAB-YOLOv3-Vehicle-Detection-and-Tracking
│
├── code/
│   ├── vehicle_tracking.m
│   └── helper_functions.m
│
├── images/
│   ├── workflow.png
│   ├── output1.png
│   ├── output2.png
│   └── output3.png
│
├── demo/
│   └── demo_video.mp4
│
├── report/
│   └── Project_Report.pdf
│
└── README.md
```

---

#  Detection Pipeline

The implemented system performs the following sequence:

1. Read input video.
2. Extract individual frames.
3. Detect vehicles using pretrained YOLOv3.
4. Filter detections based on confidence.
5. Track vehicles using MATLAB's Multi-Object Tracker.
6. Assign unique IDs.
7. Display annotated output video.

---

#  Vehicle Classes

The project detects the following COCO vehicle classes:

- Car
- Bus
- Truck
- Motorbike

---

#  Results

The developed system successfully:

- Detects multiple vehicles simultaneously.
- Maintains object identities across frames.
- Generates real-time bounding boxes.
- Displays tracking IDs.
- Processes recorded traffic videos within MATLAB.

Example outputs include:

- Vehicle Detection
- Multi-object Tracking
- Bounding Box Annotation
- Vehicle ID Assignment

---

#  Dataset

This implementation uses MATLAB's pretrained **YOLOv3 Darknet-53 COCO** detector.

No custom dataset was used or redistributed.

Reference dataset:

**Microsoft COCO (Common Objects in Context)**

---

#  Applications

- Intelligent Traffic Monitoring
- Smart City Surveillance
- Autonomous Vehicles
- Parking Management
- Road Safety Analytics
- Vehicle Counting Systems

---

#  Future Improvements

- Train a custom YOLO model.
- Integrate Deep SORT for improved tracking.
- Improve low-light performance.
- Deploy on NVIDIA Jetson devices.
- Real-time webcam implementation.
- Vehicle speed estimation.

---

#  Sample Output

(Add your screenshots here)

Example:

```
images/output1.png

images/output2.png

images/output3.png
```

---

#  References

- MATLAB Computer Vision Toolbox
- MATLAB Deep Learning Toolbox
- YOLOv3 (Darknet-53)
- Microsoft COCO Dataset

---

#  Author

**Aryan R Gowda**

Electronics & Communication Engineering

Dayananda Sagar Academy of Technology and Management (DSATM)

Bengaluru, Karnataka, India

---

## ⭐ If you found this project useful, consider giving this repository a star.
