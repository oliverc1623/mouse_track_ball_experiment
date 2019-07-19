% Initialize signal data
signal_fb = data(2,:);
signal_lr = data(3,:);
signal_object = data(1,:);

%% get camera frames
cam1_frames = intersect(find(data(4,:) <=1.5) +1,find(data(4,:) >1.5));
cam2_frames = intersect(find(data(5,:) <=1.5) +1,find(data(5,:) >1.5));

cam1_timeup = timestamps(cam1_frames);
cam2_timeup = timestamps(cam2_frames);
%% Initialize epoch times
epoch_start_times = [176197 1137488 2017827 3052049 3848254 5043138 5673241];
epoch_end_times = initialize_ends_epochs(data); 
%% convert movement data from volts to cm
converted_signal_fb = convert_data(signal_fb);
converted_signal_lr = convert_data(signal_lr);

%% get data matrix
mat_fb_data = getDataMatrix(converted_signal_fb, 55, -10, 45, epoch_start_times); 
mat_lr_data = getDataMatrix(converted_signal_lr, 55, -10, 45, epoch_start_times);
mat_object_data = getDataMatrix(signal_object, 55, -10, 45, epoch_start_times);
x_axis = linspace(-10, 45, 6000*55);
%% smooth data
smooth_mat_fb_data = smoothdata(mat_fb_data, 2, 'gaussian', 30010);
smooth_mat_lr_data = smoothdata(mat_lr_data, 2, 'movmean', 30010);

%%
figure;
subplot(2,1,1)
plot(x_axis, mean(smooth_mat_fb_data));
% pre_bout_onset_x = ([-5,0]);
% post_bout_onset_x = ([0,5]);
% bout_onset_y = [1.63966,1.63966];
% bout_onset_y2 = [1.6861,1.686];
% hold on
% II=patch([pre_bout_onset_x fliplr(pre_bout_onset_x)],[bout_onset_y fliplr(bout_onset_y2)], 'r');
% alpha(0.1)
% hold on
% I=patch([post_bout_onset_x fliplr(post_bout_onset_x)],[bout_onset_y fliplr(bout_onset_y2)], 'b');
% alpha(0.1);
ylabel("Displacement (cm)")
xlabel("Time (s)")
title("Forward/Back");

subplot(2,1,2)
plot(x_axis, mean(smooth_mat_lr_data));
% pre_bout_onset_x = ([-5,0]);
% post_bout_onset_x = ([0,5]);
% bout_onset_y = [1.5877,1.5877];
% bout_onset_y2 = [1.7007,1.7007];
% hold on
% II=patch([pre_bout_onset_x fliplr(pre_bout_onset_x)],[bout_onset_y fliplr(bout_onset_y2)], 'r');
% alpha(0.1)
% hold on
% I=patch([post_bout_onset_x fliplr(post_bout_onset_x)],[bout_onset_y fliplr(bout_onset_y2)], 'b');
% alpha(0.1);
ylabel("Displacement (cm)")
xlabel("Time (s)")
title("Left/Right")

%% Plot each bout 
plot_each_bout(smooth_mat_fb_data)

%% plot heatmaps
plot_heatmap(smooth_mat_fb_data)

%% Plot average bouts samples
figure();
subplot(2,1,1)
plot_mean_bouts(mat_fb_data, "Forward Back", 1)
subplot(2,1,2)
plot_mean_bouts(mat_lr_data, "Left Right", 1)

%% Creates matrix of bouts as a function of time
function mat = getDataMatrix(input_signal, sample_size, start_time, ...
    end_time, start_epochs)

    mat_data = zeros(7, 6000*sample_size, 'single'); % samples which is roughly a full second /because 6000Hz
    for i = 1:7
        mat_data(i, :) = input_signal(start_epochs(i)+start_time*6000 +1 : start_epochs(i)+end_time*6000);
    end
    mat = mat_data;
end

function end_epochs = initialize_ends_epochs(in_data)
    laser_frames = intersect(find(in_data(6,:) <=1.5) +1,find(in_data(6,:) >1.5));
    epoch_end_times = laser_frames(diff(laser_frames)>40000);
    epoch_end_times = [epoch_end_times 5855744];
    end_epochs = epoch_end_times;
end

%% plot each bout function
function plot_each_bout(in_data)
    for i=1:7
        subplot(7,1,i)
        plot(linspace(-10, 45, 6000*55), in_data(i,:));
        ylabel("Displacement (cm)")
        xlabel("Time (s)")
        title("Bout " + i)
    end
end

%% plot heatmaps
function plot_heatmap(in_data)
    imagesc(in_data)
    colorbar;
end

%%
function converted_data = convert_data(in_data)
    converted_data = ((in_data(1,:)*(4095/3.3)-2000)/4)/708.66;
end
