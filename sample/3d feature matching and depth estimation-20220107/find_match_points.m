function [matchedPoints1, matchedPoints2]=find_match_points(Il,Ir)

p_left=detectSURFFeatures(Il);
p_right=detectSURFFeatures(Ir);

[features1,valid_points1] = extractFeatures(Il,p_left.Location);
[features2,valid_points2] = extractFeatures(Ir,p_right.Location);
indexPairs = matchFeatures(features1,features2,'Method','Approximate','Unique', 1);
%indexPairs = matchFeatures(features1,features2);'
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

figure(1)
showMatchedFeatures(Il,Ir,matchedPoints1,matchedPoints2);


