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
<summary>Reference</summary>

- https://www.mathworks.com/help/vision/ug/using-the-stereo-camera-calibrator-app.html
  
</details>




## Reference

- Checkerboard: https://atlantavinylstore.com/products/checkerboard-patterned-htv
- Tutorial for Stereo Camera Calibrator: https://www.youtube.com/watch?v=6OWGfP3nf8s
