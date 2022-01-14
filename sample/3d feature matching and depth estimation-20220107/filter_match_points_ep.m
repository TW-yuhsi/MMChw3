function [inlierPoints1,inlierPoints2]=filter_match_points_ep(epipolarInliers, fMatrix, Il, Ir, matchedPoints1, matchedPoints2)
inlierPoints1 = matchedPoints1(epipolarInliers, :);
inlierPoints2 = matchedPoints2(epipolarInliers, :);
figure;
subplot(1,3,1)
showMatchedFeatures(Il, Ir, inlierPoints1, inlierPoints2);
legend('Inlier points in I1', 'Inlier points in I2');
% subplot(1,2,2)
%showMatchedFeatures(Il, Ir, inlierPoints1, inlierEPoints2);
%legend('Inlier Epoints in I1', 'Inlier Epoints in I2');

%%% epipolar lines are determined by epipole and matched points

epiLines1 = epipolarLine(fMatrix',inlierPoints2);
epiLines2 = epipolarLine(fMatrix,inlierPoints1);
points1 = lineToBorderPoints(epiLines1,size(Il));
points2 = lineToBorderPoints(epiLines2,size(Ir));

subplot(1,3,2)
imshow(Il)
hold
plot(inlierPoints1(:,1),inlierPoints1(:,2),'ro')
line(points1(:,[1,3])',points1(:,[2,4])');
subplot(1,3,3)
imshow(Ir)
hold
plot(inlierPoints2(:,1),inlierPoints2(:,2),'ro')
line(points2(:,[1,3])',points2(:,[2,4])');
