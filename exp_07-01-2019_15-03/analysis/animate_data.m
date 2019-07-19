%% Movie Code
% Load data
load('timeline_07-01-2019_15-03.mat')
%%
fig = figure; 

cam1_dir = dir('exp3_cam1');
cam2_dir = dir('exp3_cam2');

% cam 1&2 pulse 1
cam1_indx_pulse(1) = 151;
cam2_indx_pulse(1) = 66;
subplot(6,4,1);
im_name_cam1_pulse(1) = "exp3_cam1/" + cam1_dir(cam1_indx_pulse(1)).name;
im_cam1_pulse(1) = imshow(im_name_cam1_pulse(1));
title('Cam1 pulse 1');
subplot(6,4,2);
im_name_cam2_pulse(1) = "exp3_cam2/" + cam2_dir(cam2_indx_pulse(1)).name;
im_cam2_pulse(1) = imshow(im_name_cam2_pulse(1));
title('Cam2 pulse 1')

% cam 1%2 pulse 2
cam1_indx_pulse(2) = 1754;
cam2_indx_pulse(2) = 1668;
subplot(6,4,5);
im_name_cam1_pulse(2) = "exp3_cam1/" + cam1_dir(cam1_indx_pulse(2)).name;
im_cam1_pulse(2) = imshow(im_name_cam1_pulse(2));
title('Cam1 pulse 2')
subplot(6,4,6);
im_name_cam2_pulse(2) = "exp3_cam2/" + cam2_dir(cam2_indx_pulse(2)).name;
im_cam2_pulse(2) = imshow(im_name_cam2_pulse(2));
title('Cam2 pulse 2')

% cam 1&2 pulse 3
cam1_indx_pulse(3) = 3221;
cam2_indx_pulse(3) = 3135;
subplot(6,4,9);
im_name_cam1_pulse(3) = "exp3_cam1/" + cam1_dir(cam1_indx_pulse(3)).name;
im_cam1_pulse(3) = imshow(im_name_cam1_pulse(3));
title('Cam1 pulse 3')
subplot(6,4,10);
im_name_cam2_pulse(3) = "exp3_cam2/" + cam2_dir(cam2_indx_pulse(3)).name;
im_cam2_pulse(3) = imshow(im_name_cam2_pulse(3));
title('Cam1 pulse 3')


% cam 1&2 pulse 4
cam1_indx_pulse(4) = 4945;
cam2_indx_pulse(4) = 4860;
subplot(6,4,13);
im_name_cam1_pulse(4) = "exp3_cam1/" + cam1_dir(cam1_indx_pulse(4)).name;
im_cam1_pulse(4) = imshow(im_name_cam1_pulse(4));
title('Cam1 pulse 4')
subplot(6,4,14);
im_name_cam2_pulse(4) = "exp3_cam2/" + cam2_dir(cam2_indx_pulse(4)).name;
im_cam2_pulse(4) = imshow(im_name_cam2_pulse(4));
title('Cam2 pulse 4')

% cam 1&2 pulse 5
cam1_indx_pulse(5) = 6273;
cam2_indx_pulse(5) = 6187;
subplot(6,4,17);
im_name_cam1_pulse(5) = "exp3_cam1/" + cam1_dir(cam1_indx_pulse(5)).name;
im_cam1_pulse(5) = imshow(im_name_cam1_pulse(5));
title('Cam1 pulse 5')
subplot(6,4,18);
im_name_cam2_pulse(5) = "exp3_cam2/" + cam2_dir(cam2_indx_pulse(5)).name;
im_cam2_pulse(5) = imshow(im_name_cam2_pulse(5));
title('Cam2 pulse 5')

% cam 1&2 pulse 6
cam1_indx_pulse(6) = 8264;
cam2_indx_pulse(6) = 8178;
subplot(6,4,21);
im_name_cam1_pulse(6) = "exp3_cam1/" + cam1_dir(cam1_indx_pulse(6)).name;
im_cam1_pulse(6) = imshow(im_name_cam1_pulse(6));
title('Cam1 pulse 6')
subplot(6,4,22);
im_name_cam2_pulse(6) = "exp3_cam2/" + cam2_dir(cam2_indx_pulse(6)).name;
im_cam2_pulse(6) = imshow(im_name_cam2_pulse(6));
title('Cam2 pulse 6')

% Plots & Lines
subplot(6,4,3);
ylim([1.5, 1.8]);
a1 = animatedline('Color',[0 .7 .7]);
title('Forward-Back: Pulse 1')

subplot(6,4,4);
ylim([1.5, 1.8]);
a2 = animatedline('Color',[0 .1 .1]);
title('Left Right: Pulse 1')

subplot(6,4,7);
ylim([1.5, 1.8]);
a3 = animatedline('Color',[0 .7 .7]);
title('Forward-Back: Pulse 2')

subplot(6,4,8);
ylim([1.5, 1.8]);
a4 = animatedline('Color',[0 .1 .1]);
title('Left Right: Pulse 2')

subplot(6,4,11);
ylim([1.5, 1.8]);
a5 = animatedline('Color',[0 .7 .7]);
title('Forward-Back: Pulse 3')

subplot(6,4,12);
ylim([1.5, 1.8]);
a6 = animatedline('Color',[0 .1 .1]);
title('Left Right: Pulse 3')

subplot(6,4,15);
ylim([1.5, 1.8]);
a7 = animatedline('Color',[0 .7 .7]);
title('Forward-Back: Pulse 4')

subplot(6,4,16);
ylim([1.5, 1.8]);
a8 = animatedline('Color',[0 .1 .1]);
title('Left Right: Pulse 4')


t0 = clock;
F(182500) = struct('cdata',[],'colormap',[]);
tic
for k=1:400:182501
    %pulse 1 
%     for i=1:6
%         im_name_cam1_pulse(i) = imread("exp3_cam1/" + cam1_dir(cam1_indx_pulse(i)).name);
%         im_name_cam1_pulse(i) = imread("exp3_cam1/" + cam1_dir(cam1_indx_pulse(i)).name);
%         set(im_cam1_pulse(i),'CData',im_name_cam1_pulse(i));
%         
%         im_name_cam2_pulse(i) = imread("exp3_cam2/" + cam2_dir(cam2_indx_pulse(i)).name);
%         set(im_cam2_pulse(i),'CData',im_name_cam2_pulse(i));
%         
%         cam1_indx_pulse(i) = cam1_indx_pulse(i) + 1;
%         cam2_indx_pulse(i) = cam2_indx_pulse(i) + 1;
%     end
%     im_name_cam1_pulse1 = imread("exp3_cam1/" + cam1_dir(cam1_indx_pulse1).name);
%     set(im_cam1_pulse1,'CData',im_name_cam1_pulse1);
%     im_name_cam2_pulse1 = imread("exp3_cam2/" + cam2_dir(cam2_indx_pulse1).name);
%     set(im_cam2_pulse1,'CData',im_name_cam2_pulse1);
%     % pulse 2
%     im_name_cam1_pulse2 = imread("exp3_cam1/" + cam1_dir(cam1_indx_pulse2).name);
%     set(im_cam1_pulse2,'CData',im_name_cam1_pulse2);
%     im_name_cam2_pulse2 = imread("exp3_cam2/" + cam2_dir(cam2_indx_pulse2).name);
%     set(im_cam2_pulse2,'CData',im_name_cam2_pulse2);
%     % pulse 3
%     im_name_cam1_pulse3 = imread("exp3_cam1/" + cam1_dir(cam1_indx_pulse3).name);
%     set(im_cam1_pulse3,'CData',im_name_cam1_pulse3);
%     im_name_cam2_pulse3 = imread("exp3_cam2/" + cam2_dir(cam2_indx_pulse3).name);
%     set(im_cam2_pulse3,'CData',im_name_cam2_pulse3);
%     % pulse 4
%     im_name_cam1_pulse4 = imread("exp3_cam1/" + cam1_dir(cam1_indx_pulse4).name);
%     set(im_cam1_pulse4,'CData',im_name_cam1_pulse4);
%     im_name_cam2_pulse4 = imread("exp3_cam2/" + cam2_dir(cam2_indx_pulse4).name);
%     set(im_cam2_pulse4,'CData',im_name_cam2_pulse4);
%     % pulse 5
%     im_name_cam1_pulse5 = imread("exp3_cam1/" + cam1_dir(cam1_indx_pulse5).name);
%     set(im_cam1_pulse5,'CData',im_name_cam1_pulse5);
%     im_name_cam2_pulse5 = imread("exp3_cam2/" + cam2_dir(cam2_indx_pulse5).name);
%     set(im_cam2_pulse5,'CData',im_name_cam2_pulse5);
%     % pulse 6
%     im_name_cam1_pulse6 = imread("exp3_cam1/" + cam1_dir(cam1_indx_pulse6).name);
%     set(im_cam1_pulse6,'CData',im_name_cam1_pulse6);
%     im_name_cam2_pulse6 = imread("exp3_cam2/" + cam2_dir(cam2_indx_pulse6).name);
%     set(im_cam2_pulse6,'CData',im_name_cam2_pulse6);
    
    % extract data at current time
    p1_k2 = data(2,pulses(1,k));
    p1_k3 = data(3,pulses(1,k));

    p2_k2 = data(2,pulses(2,k));
    p2_k3 = data(3,pulses(2,k));
    
    p3_k2 = data(2,pulses(3,k));
    p3_k3 = data(3,pulses(3,k));
    
    p4_k2 = data(2,pulses(4,k));
    p4_k3 = data(3,pulses(4,k));
    
    addpoints(a1, timestamps(1,pulses(1,k)), double(p1_k2))
    addpoints(a2, timestamps(1,pulses(1,k)), double(p1_k3))
    
    addpoints(a3, timestamps(1,pulses(2,k)), double(p2_k2))
    addpoints(a4, timestamps(1,pulses(2,k)), double(p2_k3))
    
    addpoints(a5, timestamps(1,pulses(3,k)), double(p3_k2))
    addpoints(a6, timestamps(1,pulses(3,k)), double(p3_k3))
    
    addpoints(a7, timestamps(1,pulses(4,k)), double(p4_k2))
    addpoints(a8, timestamps(1,pulses(4,k)), double(p4_k3))
    
    drawnow limitrate
%     F(k) = getframe(gcf);
end
disp("done");
toc
t=toc;
%%
writerObj = VideoWriter('test_movie2.avi');
writerObj.FrameRate = 10;
% open the video writer
open(writerObj);

im_fig = figure;
% write the frames to the video
 for u=1754:2058	
     % convert the image to a frame
     frame = imread("exp3_cam1/" + cam1_dir(u).name);
%      imshow(frame);
     writeVideo(writerObj, im2double(frame));
 end
 % close the writer object
 close(writerObj);
