# MMChw3


## Hardware information
- System: Microsoft Windows 10 Pro
- Processor: Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz   2.71 GHz
- Installed RAM: 4.00 GB
- Left camera: iPhone 8 / Right camera: iPhone 7


## MATLAB R2021a


### Image pre-processing

<details>
<summary>Resize</summary>

  `imgResize.m`

</details>


### Camera Calibrator

![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/Camera%20Calibrator/app.png)

<details>
<summary>Add Images from folders</summary>

  - Load Stereo Images
    - Folder for images from left camera: ~\checkerboard\camera_left_resized
    - Folder for images from rihgt camera: ~\checkerboard\camera_right_resiezd
    - Size of checkerboard square: 30 millimeters

      ![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/Camera%20Calibrator/loadSize.png)

  - View Images and Detected Points


    ![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/Camera%20Calibrator/imgLoaded.png)

</details>



<details>
<summary>Calibrate</summary>
  
  ![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/Camera%20Calibrator/calibrated.png)

  After calibrate each camera, export the parameter to Workspace with name and save them as `cameraParamsL` and `cameraParamsR`, respectively.
</details>







### Stereo Camera Calibrator

![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/Stereo%20Camera%20Calibrator/app.png)




<details>
<summary>Add Images from folders</summary>

- Load Stereo Images
  - Folder for images from camera 1: ~\checkerboard\camera_left_cropped
  - Folder for images from camera 2: ~\checkerboard\camera_right_cropped
  - Size of checkerboard square: 5 millimeters

    ![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/Stereo%20Camera%20Calibrator/loadSize.png)
  
- View Images and Detected Points (check whether the orientation of each coordinate are same)

  ![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/Stereo%20Camera%20Calibrator/imgLoaded.png)
  The Data Browser pane displays a list of image pairs with IDs. These image pairs contain a detected pattern. To view an image, select it from the Data Browser pane.

</details>



<details>
<summary>Calibrate</summary>

  Once you are satisfied with the accepted image pairs, click the Calibrate button on the Calibration tab. The default calibration settings assume the minimum set of camera parameters. Start by running the calibration with the default settings. After evaluating the results, you can try to improve calibration accuracy by adjusting the settings and adding or removing images, and then calibrate again.

  ![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/Stereo%20Camera%20Calibrator/calibrated.png)
  
  You can evaluate calibration accuracy by examining the reprojection errors, examining the camera extrinsics, or viewing the undistorted image. For best calibration results, use all three methods of evaluation.  
</details>








<details>
<summary>Show Rectified Images</summary>

  To view the effects of stereo rectification, on the Calibration tab, in the View section, select Show Rectified. If the calibration is accurate, the images become undistorted and row-aligned.

  ![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/Stereo%20Camera%20Calibrator/rectifiedImg.png)
  
  After rectified each pair of images, export the parameter to Workspace with name and save it as `stereoParams`.
</details>





<details>
<summary>Note</summary>

Checking the rectified images is important even if the reprojection errors are low. For example, if the pattern covers only a small percentage of the image, the distortion estimation might be incorrect, even though the calibration resulted in few reprojection errors.The following image shows an example of this type of incorrect estimation for a single camera calibration.

![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/smallPercentage/o_1.png)
![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/smallPercentage/o_2.png)
![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/smallPercentage/o_3.png)
  
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

- `filter_match_points_ep`
  
  - 
  
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
- Checkerboard2: https://markhedleyjones.com/projects/calibration-checkerboard-collection 
- disparityBM: https://www.mathworks.com/help/vision/ref/disparitybm.html
- disparitySGM: https://www.mathworks.com/help/vision/ref/disparitysgm.html
