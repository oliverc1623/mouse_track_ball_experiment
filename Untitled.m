
cam1_frames = intersect(find(data(4,:) <=1.5) +1,find(data(4,:) >1.5));
cam2_frames = intersect(find(data(5,:) <=1.5) +1,find(data(5,:) >1.5));

cam1_timeup = timestamps(cam1_frames);
cam2_timeup = timestamps(cam2_frames);

%% Laser code
laser_frames = intersect(find(data(6,:) <=1.5) +1,find(data(6,:) >1.5));
epoch_start_times = [176197 1137488 2017827 3052049 3848254 5043138 5673241];
epoch_end_times = laser_frames(diff(laser_frames)>40000);
epoch_end_times = [epoch_end_times 5853241];
%% Look at running
plot(timestamps, smoothdata(data(2,:)), '-')
hold on
scatter(timestamps(epoch_start_times), 2*ones(7,1), 'kx')

%% object pos frames
object_timeup = set_timestamp(1, data, 1.5)

%% fb frames
fb_timeup = set_timestamp(2, data, 1.7)

%% my_difference function
new_laser_frames = laser_frames

for i = 1:length(laser_frames)+1
     new_laser_frames(1,i) = laser_frames(i) - laser_frames(i+1)
end

%% Movie Code
% 1. Load data: done
%% 2. Draw/render draw/render scenario at time tk
a1 = animatedline('Color',[0 .7 .7]);

for k=1:100:length(data(2,1:2195848))
    % extract data at current time
    t_k = data(2,k);
    addpoints(a1, timestamps(1,k), double(t_k))
    drawnow limitrate
end
% 3. Take snapshot of scenario
% 4. Advance time to tk+1
% 5. Save Movie

%%
pulse1 = 176197:358697;
pulse2 = 1137488:1319988;
pulse3 = 2017827:2200327;
pulse4 = 3052049:3234549;
pulse5 = 3848254:4030754;
pulse6 = 5043138:5225638;
% pulse7 = 5673241:5853241;

pulses = [pulse1; pulse2; pulse3; pulse4; pulse5; pulse6];
%%
cam1_epoch1_frames = 151:456;
cam1_epoch2_frames = 1754:2058;
cam1_epoch3_frames = 3221:3525;
cam1_epoch4_frames = 4945:5250;
cam1_epoch5_frames = 6273:
cam1_epoch6_frames = 8264:
cam1_epoch7_frames = 9314:

cam2_epoch1_frames = 66:370;
cam2_epoch2_frames = 1668:1972;
cam2_epoch3_frames = 3135:3439;
cam2_epoch4_frames = 4860:5164;
cam2_epoch5_frames = 6187
cam2_epoch6_frames = 8178
%% 
function frames = set_timestamp(row, data, thresh)
    frames = intersect(find(data(row,:)<=thresh)+1, find(data(row,:)>thresh));
end
