clear all
close all
format long
fM_flag=1;
eM_flag=0;
load cameraParams2p
Ix=cameraParams.ImageSize(1);
Iy=cameraParams.ImageSize(2);
Il=imread('stereo-corridor_l.gif');
Ir=imread('stereo-corridor_r.gif');
%Il = imread('viprectification_deskLeft.png');
%Ir = imread('viprectification_deskRight.png');
Il=imresize(Il,[Ix,Iy]);
Ir=imresize(Ir,[Ix,Iy]);
figure(1)
subplot(1,3,1)
imshow(Il)
subplot(1,3,2)
imshow(Ir)
%load stereoParams2P
% Ils=stereoParams.CameraParameters1.ImageSize;
% Irs=stereoParams.CameraParameters2.ImageSize;
% Il=imread('WIN_20201217_15_36_57_Pro.jpg');
% Ir=imread('WIN_20201217_15_37_07_Pro.jpg');
% Il=rgb2gray(imresize(Il,Ils));
% Ir=rgb2gray(imresize(Ir,Irs));

%Retrieve the locations of the corresponding points for each image.
if(fM_flag==1)
%p_left=detectHarrisFeatures(Il);
%p_right=detectHarrisFeatures(Ir);
[matchedPoints1,matchedPoints2]=find_match_points(Il,Ir)

%Retrieve the locations of the corresponding points for each image.

%%% estimate fundemental matrix by excluding outlier points

[fMatrix, epipolarInliers, status] = estimateFundamentalMatrix(...
  matchedPoints1, matchedPoints2, 'Method', 'RANSAC', ...
  'NumTrials', 10000, 'DistanceThreshold', 0.01, 'Confidence', 99);

if status ~= 0 || isEpipoleInImage(fMatrix, size(Il)) ...
  || isEpipoleInImage(fMatrix', size(Ir))
  error(['Either not enough matching points were found or '...
         'the epipoles are inside the images. You may need to '...
         'inspect and improve the quality of detected features ',...
         'and/or improve the quality of your images.']);
end

%%% show matched points and epipolar line

%%% Epipole of fMatrix: [Uf,Sf,Vf]=svd(fMatrix);
%%% epole_l=Uf(:,3);epole_r=Vf(:,3)
%%% The epipole on Il is the svector associated with the smallest singular value of E'
%%% The epipole on Ir is the svector associated with the smallest singular value of E                   

[inlierPoints1,inlierPoints2]=filter_match_points_ep(epipolarInliers, fMatrix, Il, Ir, matchedPoints1, matchedPoints2)

[relativeOrientation, relativeLocation] = relativeCameraPose(fMatrix,cameraParams,cameraParams,inlierPoints1,inlierPoints2);

[rotationOfCamera2,translationOfCamera2] = cameraPoseToExtrinsics(relativeOrientation, relativeLocation);
baselength=0.015;   %%% distance between two cameras. it should be obtained from stereo camera calibration
%%% you don't need to do this if you have done stereo calibration
 stereoParams = stereoParameters(cameraParams, ...       
     cameraParams, rotationOfCamera2, baselength*translationOfCamera2);
%%% you don't need to do this if you have done stereo calibration

end

if(eM_flag==1)
%%% Compute Essential Matrix and inlier points %%%
%inv_intK=inv(cameraParams.IntrinsicMatrix);1
%matchedEPoints1=matchedPoints1*inv_intK(1:2,1:2)+ones(size(matchedPoints1,1),1)*inv_intK(3,1:2);
%matchedEPoints2=matchedPoints2*inv_intK(1:2,1:2)+ones(size(matchedPoints2,1),1)*inv_intK(3,1:2);
eIl = undistortImage(Il,cameraParams);
eIr = undistortImage(Ir,cameraParams);
imagePoints1 = detectSURFFeatures(eIl);
imagePoints2 = detectSURFFeatures(eIr);
features1 = extractFeatures(eIl,imagePoints1,'Upright',true);
features2 = extractFeatures(eIr,imagePoints2,'Upright',true);
indexPairs = matchFeatures(features1,features2);
matchedPoints1 = imagePoints1(indexPairs(:,1));
matchedPoints2 = imagePoints2(indexPairs(:,2));
figure(1)
subplot(1,3,3)
showMatchedFeatures(eIl,eIr,matchedPoints1,matchedPoints2);
title('Putative Matches')

[E,inliers] = estimateEssentialMatrix(matchedPoints1,matchedPoints2, cameraParams);

inlierEPoints1 = matchedPoints1(inliers, :);
inlierEPoints2 = matchedPoints2(inliers, :);
% [Un,Sn,Vn]=svd(E);
%  Sn(3,3)=0;
%  E=Un*Sn*Vn';
%  [Un,Sn,Vn]=svd(E);
 eMatrix=E;

%%% Compute Essential Matrix and inlier points %%%
 
%%% Compute translation and rotation of two cameras from fundamental matrix
%%% notice: the translation is up to a scale, the output translationOfCamera2
%%%         is the direction of the translation vector between two cameras

%[rotationOfCamera2,translationOfCamera2] = relativeCameraPose(fMatrix,cameraParams,cameraParams,inlierPoints1,inlierPoints2);

[relativeOrientation, relativeLocation] = relativeCameraPose(eMatrix,cameraParams,cameraParams,inlierEPoints1,inlierEPoints2);
[ErotationOfCamera2,EtranslationOfCamera2]= cameraPoseToExtrinsics(relativeOrientation, relativeLocation);
end

 [J1_full, J2_full] = rectifyStereoImages(Il, Ir, stereoParams, ...
     'OutputView', 'full');
 
 [matchedPoints1,matchedPoints2]=find_match_points(J1_full, J2_full)
 
 [fMatrix, epipolarInliers, status] = estimateFundamentalMatrix(...
     matchedPoints1, matchedPoints2, 'Method', 'RANSAC', ...
     'NumTrials', 10000, 'DistanceThreshold', 0.01, 'Confidence', 99);
 [inlierPoints1,inlierPoints2]=filter_match_points_ep(epipolarInliers, fMatrix, J1_full, J2_full, matchedPoints1, matchedPoints2)

 
 
 disparityRange=[-8,24];
 disparityMap = disparity(J1_full, J2_full, 'BlockSize', 31, ...
      'DisparityRange', disparityRange);

figure;
subplot(1,3,1)
imshow(J1_full)
subplot(1,3,2)
imshow(J2_full)
subplot(1,3,3)
imshow(disparityMap, [0, 32]);
title('Disparity Map');
colormap jet
%colorbar

% 
% %%% Now, the 3d depth can be estimated %%%
% 
xyzPoints = reconstructScene(disparityMap, stereoParams);
ptTexture=cat(3,J1_full,J1_full,J1_full);
ptcloud = pointCloud(xyzPoints,'color', ptTexture);
ptcloud = removeInvalidPoints(ptcloud);
pcwrite(ptcloud,'recon_scene.ply')


