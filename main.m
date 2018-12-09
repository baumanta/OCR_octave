%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optical Character recogintion (OCR) example
% Tanja Baumann
% 08.12.2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% read in original image
frame = imread("barcode.tif");
figure();
imshow(frame)

% crop to part containint the relevant numbers
patch_anker = [510, 1];
patch_size = [80, 800];
frame_cropped = frame(patch_anker(1):patch_anker(1)+patch_size(1) - 1, patch_anker(2):patch_anker(2)+patch_size(2)-1);
figure();
imshow(frame_cropped)

% wrte cropped image in pnm fromat, such that ocrad can use it
imwrite(frame_cropped, "frame.pnm", 'WriteMode','overwrite');

% call ocrad from commandline
system("./run_ocrad.sh frame.pnm")
