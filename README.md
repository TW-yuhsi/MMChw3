# MMChw3


## Hardware information
- System: Microsoft Windows 10 Pro
- Processor: Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz   2.71 GHz
- Installed RAM: 4.00 GB


## MATLAB

<details>
<summary>Stereo Camera Calibrator</summary>
  
![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/apps.png)
  
</details>



<details>
<summary>Add Images from folders</summary>

- Load Stereo Images
  - Folder for images from camera 1: ~\checkerboard\camera_left_cropped
  - Folder for images from camera 2: ~\checkerboard\camera_right_cropped
  - Size of checkerboard square: 5 millimeters

![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/loadImgs.png)
  
- View Images and Detected Points

![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/imagesLoaded.png)
The Data Browser pane displays a list of image pairs with IDs. These image pairs contain a detected pattern. To view an image, select it from the Data Browser pane.

</details>



<details>
<summary>Calibrate</summary>

Once you are satisfied with the accepted image pairs, click the Calibrate button on the Calibration tab. The default calibration settings assume the minimum set of camera parameters. Start by running the calibration with the default settings. After evaluating the results, you can try to improve calibration accuracy by adjusting the settings and adding or removing images, and then calibrate again.
  
![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/calibrate.png)
  
</details>





<details>
<summary>Evaluate Calibration Results</summary>

You can evaluate calibration accuracy by examining the reprojection errors, examining the camera extrinsics, or viewing the undistorted image. For best calibration results, use all three methods of evaluation.  

![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/afterCalibrate.png)
  
</details>







<details>
<summary>Show Rectified Images</summary>

To view the effects of stereo rectification, on the Calibration tab, in the View section, select Show Rectified. If the calibration is accurate, the images become undistorted and row-aligned.

![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/showRectified.png)
  
</details>





<details>
<summary>Note</summary>

Checking the rectified images is important even if the reprojection errors are low. For example, if the pattern covers only a small percentage of the image, the distortion estimation might be incorrect, even though the calibration resulted in few reprojection errors.The following image shows an example of this type of incorrect estimation for a single camera calibration.

![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/smallPercentage/o_1.png)
![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/smallPercentage/o_2.png)
![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/smallPercentage/o_3.png)
  
</details>



<details>
<summary>Output Parameters (stereoParams)</summary>
  
```text
stereoParams = 

  stereoParameters with properties:

   Parameters of Two Cameras
        CameraParameters1: [1×1 cameraParameters]
        CameraParameters2: [1×1 cameraParameters]

   Inter-camera Geometry
        RotationOfCamera2: [3×3 double]
     TranslationOfCamera2: [-1.198719818854255e+02 -0.400536334957486 -0.025750814320411]
        FundamentalMatrix: [3×3 double]
          EssentialMatrix: [3×3 double]

   Accuracy of Estimation
    MeanReprojectionError: 0.057242729028599

   Calibration Settings
              NumPatterns: 10
              WorldPoints: [42×2 double]
               WorldUnits: 'mm'
```

</details>







<details>
<summary>Reference</summary>

- https://www.mathworks.com/help/vision/ug/using-the-stereo-camera-calibrator-app.html
  
</details>


## Main

<details>
<summary>Functions</summary>

- `find_match_points`
  - `detectSURFFeatures`
  
    points = detectSURFFeatures(I) 
    
    returns a SURFPoints object, points, containing information about SURF features detected in the 2-D grayscale input image I. The detectSURFFeatures function implements the Speeded-Up Robust Features (SURF) algorithm to find blob features.
  
  - `extractFeatures`
  
    [features,validPoints] = extractFeatures(I,points)
  
    returns extracted feature vectors, also known as descriptors, and their corresponding locations, from a binary or intensity image.

    The function derives the descriptors from pixels surrounding an interest point. The pixels represent and match features specified by a single-point location. Each single-point specifies the center location of a neighborhood. The method you use for descriptor extraction depends on the class of the input points.
  
  - `matchFeatures`
  
  indexPairs = matchFeatures(features1,features2)
  
  returns indices of the matching features in the two input feature sets. The input feature must be either binaryFeatures objects or matrices.
  
  - `showMatchedFeatures`
  
  showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2)
  
  displays a falsecolor overlay of images I1 and I2 with a color-coded plot of corresponding points connected by a line. matchedPoints1 and matchedPoints2 contain the coordinates of corresponding points in I1 and I2. The input points can be M-by-2 matrices of M number of [x y] coordinates, or SURFPoints, MSERRegions, ORBPoints, BRISKPoints, or cornerPoints object.
  
</details>






<details>
<summary>Reference</summary>

- `detectSURFFeatures`: https://www.mathworks.com/help/vision/ref/detectsurffeatures.html
- `extractFeatures`: https://www.mathworks.com/help/vision/ref/extractfeatures.html
- `matchFeatures`: https://www.mathworks.com/help/vision/ref/matchfeatures.html
- `showMatchedFeatures`: https://www.mathworks.com/help/vision/ref/showmatchedfeatures.html

  
</details>


<details>
<summary>Figures</summary>

1. Grayscale images
2. 
  
</details>




## MeshLab



<details>
<summary>Reference</summary>

- https://www.meshlab.net/
  
</details>






## Reference

- Checkerboard: https://atlantavinylstore.com/products/checkerboard-patterned-htv
- Tutorial for Stereo Camera Calibrator: https://www.youtube.com/watch?v=6OWGfP3nf8s
