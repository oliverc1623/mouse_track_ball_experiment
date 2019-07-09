%% Movie Code
% Load data
load('timeline_07-01-2019_15-03.mat')
%% 2. Draw/render draw/render scenario at time tk
figure; 
subplot(2,2,1);
a1 = animatedline('Color',[0 .7 .7]);
title('Forward-Back: Pulse 1')

subplot(2,2,2);
a2 = animatedline('Color',[0 .1 .1]);
title('Left Right: Pulse 1')

tic
for k=176197:100:358698
    % extract data at current time
    p1_k2 = data(2,k);
    p1_k3 = data(3,k);
    addpoints(a1, timestamps(1,k), double(p1_k2))
    addpoints(a2, timestamps(1,k), double(p1_k3))
    drawnow limitrate
    pause(.0162)
end
toc
t=toc;
% 3. Take snapshot of scenario
% 4. Advance time to tk+1
% 5. Save Movie
%%
pulse1 = 176197:400:358698;
pulse2 = 1137488:400:1319989;
pulse3 = 2017827:400:2200329;
pulse4 = 3052049:400:3234552;
pulse5 = 3848254:400:4030759;
pulse6 = 5043138:400:5225641;
pulse7 = 5673241:100:5853241;

pulses = [pulse1; pulse2; pulse3; pulse4; pulse5; pulse6];
%%
fig = figure; 
subplot(6,2,1);
a1 = animatedline('Color',[0 .7 .7]);
title('Forward-Back: Pulse 1')

subplot(6,2,2);
a2 = animatedline('Color',[0 .1 .1]);
title('Left Right: Pulse 1')

subplot(6,2,3);
a3 = animatedline('Color',[0 .7 .7]);
title('Forward-Back: Pulse 2')

subplot(6,2,4);
a4 = animatedline('Color',[0 .1 .1]);
title('Left Right: Pulse 2')

subplot(6,2,5);
a5 = animatedline('Color',[0 .7 .7]);
title('Forward-Back: Pulse 3')

subplot(6,2,6);
a6 = animatedline('Color',[0 .1 .1]);
title('Left Right: Pulse 3')

subplot(6,2,7);
a7 = animatedline('Color',[0 .7 .7]);
title('Forward-Back: Pulse 4')

subplot(6,2,8);
a8 = animatedline('Color',[0 .1 .1]);
title('Left Right: Pulse 5')


t0 = clock;
k = 1;
F(182500) = struct('cdata',[],'colormap',[]);
tic
while etime(clock, t0) <= 30
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
    k = k + 1;
    F(k) = getframe(gcf);
end
disp("done");
toc
t=toc;
%%
cam1_dir = dir('exp3_cam1');

writerObj = VideoWriter('test_movie.avi');
writerObj.FrameRate = 10;
% open the video writer
open(writerObj);

im_fig = figure;
% write the frames to the video
 for u=151:456	
     % convert the image to a frame
     frame = imread("exp3_cam1/" + cam1_dir(u).name);
     imshow(frame);
%      writeVideo(writerObj, im2double(frame));
 end
 % close the writer object
 close(writerObj);
