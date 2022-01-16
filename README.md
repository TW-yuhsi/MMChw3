# MMChw3


## Hardware information
- System: Microsoft Windows 10 Pro
- Processor: Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz   2.71 GHz
- Installed RAM: 4.00 GB


## MATLAB APPS - Stereo Camera Calibrator

![image](https://github.com/TW-yuhsi/MMChw3/blob/main/figures/apps.png)

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
<summary>Reference</summary>

- https://www.mathworks.com/help/vision/ug/using-the-stereo-camera-calibrator-app.html
  
</details>




## Reference

- Checkerboard: https://atlantavinylstore.com/products/checkerboard-patterned-htv
- Tutorial for Stereo Camera Calibrator: https://www.youtube.com/watch?v=6OWGfP3nf8s
