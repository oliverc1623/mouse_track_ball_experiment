
cam1_frames = intersect(find(data(4,:) <=1.5) +1,find(data(4,:) >1.5));
cam2_frames = intersect(find(data(5,:) <=1.5) +1,find(data(5,:) >1.5));

cam1_timeup = timestamps(cam1_frames);
cam2_timeup = timestamps(cam2_frames);

%% Laser code
laser_frames = intersect(find(data(6,:) <=1.5) +1,find(data(6,:) >1.5));

%% Look at running
plot(timestamps, y_FB, '-')
hold on
scatter(timestamps(epoch_starts2), 2*ones(7,1), 'kx')

%% Remove position noise
d1 = designfilt('lowpassfir','PassbandFrequency',0.25, ...
         'StopbandFrequency',0.35,'PassbandRipple',0.5, ...
         'StopbandAttenuation',65,'DesignMethod','kaiserwin',...
         'SampleRate', 100);
y_LR = filtfilt(d1,double(data(3,:)));

plot(timestamps, y_L)

%% smooth disp noise
window = 10000;
coeff = ones(1,window)/window;
avg_LR = filter(coeff, 1, data(2,:));
plot(timestamps(1,:), avg_LR(1,:))

%% object pos frames
object_timeup = set_timestamp(1, data, 1.5)

%% fb frames
fb_timeup = set_timestamp(2, data, 1.7)


%% match epoch timestamps with indices
% epoch_starts2 = epoch_starts
% 
% for i=1:length(timestamps)
%     if timestamps(i) == 

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
function frames = set_timestamp(row, data, thresh)
    frames = intersect(find(data(row,:)<=thresh)+1, find(data(row,:)>thresh));
end
