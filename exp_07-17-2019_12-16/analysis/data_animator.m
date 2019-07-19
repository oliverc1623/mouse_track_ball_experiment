%% open footage directories
eye_cam_dir = dir("D:\exp-17-7-19\good_exp\eye_cam");
body_cam_dir = dir("D:\exp-17-7-19\good_exp\body_cam");
%% find cam frames and match with laser pulse time
A = uint8(zeros(600,960, 1501));
indx = 1;
for i=794:2295
    tmp_im =  eye_cam_dir(i).folder + "\" + eye_cam_dir(i).name;
    added_frame = imread(tmp_im);
    A(:,:,indx) = added_frame;
    indx = indx + 1;
end

%% 
for i=794:2295
    tmp_im =  eye_cam_dir(i).name;
    disp(tmp_im)
end