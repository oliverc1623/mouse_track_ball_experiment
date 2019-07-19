% Initialize signal data
signal_x = data(2,:);
signal_y = data(3,:);

% Initialize epoch times
epoch_start_times = [176197 1137488 2017827 3052049 3848254 5043138 5673241];
epoch_end_times = initialize_ends_epochs(data); 
%% 
mat_data = zeros(7, 6000*55, 'single'); % samples which is roughly a full second /because 6000Hz
for i = 1:7
    mat_data(i, :) = signal_x(epoch_start_times(i)-10*6000 +1 : epoch_start_times(i)+45*6000);
end

subplot(2,2,1)
plot(linspace(-10, 45, 6000*55), smoothdata(mean(mat_data)))

subplot(2,2,2)
plot(linspace(-10, 45, 6000*55), smoothdata(mean(mat_data)))

%% test function
mat_fb_data = getDataMatrix(signal_x, 55, -10, 45, epoch_start_times);
mat_lr_data = getDataMatrix(signal_y, 55, -10, 45, epoch_start_times);
%% Plot average bouts samples
subplot(2,2,1)
plot(linspace(-10, 45, 6000*55), smoothdata(mean(mat_fb_data)))

subplot(2,2,2)
plot(linspace(-10, 45, 6000*55), smoothdata(mean(mat_lr_data)))

%% Plot each bout 
subplot(7,1,1)
plot(linspace(-10, 45, 6000*55), smoothdata(mat_fb_data(1,:)))
titlex("Bout Number 1");
xlabel("Time(s)");
ylabel("Forward and Back Displacement");

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
