%% Initialize epochs
epoch_end_times = initialize_ends_epochs(data(6,:));
epoch_start_times = initialize_start_epochs(data, 12570000);
%% Initialize signal data
mat_fb_data = getDataMatrix(uminus(convert_data(data(2,:))), 55, -10, 45, epoch_start_times);
mat_lr_data = getDataMatrix(uminus(convert_data(data(3,:))), 55, -10, 45, epoch_start_times);
smooth_mat_fb_data = smoothdata(mat_fb_data, 2, 'movmean', 3000);
smooth_mat_lr_data = smoothdata(mat_lr_data, 2, 'movmean', 3000);
x_axis = linspace(-10, 45, 6000*55);
%% get camera frames
cam1_timeup = timestamps(intersect(find(data(4,:) <=1.5) +1,find(data(4,:) >1.5)));
cam2_timeup = timestamps(intersect(find(data(5,:) <=1.5) +1,find(data(5,:) >1.5)));
%% plot means of bouts
plot_psth(smooth_mat_fb_data,smooth_mat_lr_data, x_axis);
%% plot each bout
plot_names = ["Without Object", "Object Left", "Object Right", ...
    "Object Right (Not Touching)", "Objet left not touching"];
% plot_each_bout(smooth_mat_fb_data, x_axis,"Forward/Back",2);
% plot_each_bout(smooth_mat_lr_data, x_axis,"Left/Right",1);
plot_each_bout(smooth_mat_lr_data, x_axis,"Left/Right",3);

%% plot heatmaps
plot_heatmap(smooth_mat_fb_data, "Forward/Back");
plot_heatmap(smooth_mat_lr_data, "Left/Right");
%% get laser pulse start times
function time_stamps = initialize_start_epochs(in_data, length_of_data)
    time_stamps = [];
    i = 1;
    while i < length_of_data
      if in_data(6,i) > 4
          time_stamps = [time_stamps i];
          i = i + 600001;
      end
      i = i + 1;
    end
end
%% get laser pulse end times
function end_epochs = initialize_ends_epochs(in_data)
    laser_frames = intersect(find(in_data(1,:) <=1.5) +1,find(in_data(1,:) >1.5));
    epoch_end_times = laser_frames(diff(laser_frames)>40000);
    end_epochs = epoch_end_times;
    end_epochs = [end_epochs 12011313];
end
%% Creates matrix of bouts as a function of time
function mat = getDataMatrix(input_signal, sample_size, start_time, ...
    end_time, start_epochs)
    mat_data = zeros(20, 6000*sample_size, 'single'); % samples which is roughly a full second /because 6000Hz
    for i = 1:20
        mat_data(i, :) = input_signal(start_epochs(i)+start_time*6000 +1 : start_epochs(i)+end_time*6000);
    end
    mat = mat_data;
end

%% plot each bout function
function plot_each_bout(in_data, xaxis, name, test)
    figure;
    test_names = ["without object" "left touching" "right touching" ...
        "right not touching" "left not touching"];
    Colors = ['b' 'g' 'r' 'c' 'm'];
%     subplot(121)
    hold on
    if test ==1         
        for k = 1:20
            if mod(k,5) == 0
                 plot(xaxis, in_data(k,:),'color',Colors(5),'linewidth',1) 
            else 
                 plot(xaxis, in_data(k,:),'color',Colors(mod(k,5)),'linewidth',1) 
            end
        end
        legend(test_names);
    else
        for k = test:5:20
            if mod(k,5) == 0
                 plot(xaxis, in_data(k,:),'color',Colors(5),'linewidth',1) 
            else 
                 plot(xaxis, in_data(k,:),'color',Colors(mod(k,5)),'linewidth',1) 
            end
        end
        legend(test_names(test));
    end
    title(name);
    set(gcf, 'units','normalized','outerposition',[0 0 1 1]); % Maximize figure.
end
%%
function plot_psth(in_fb_data, in_lr_data, x_axis)
    figure;
    subplot(2,1,1)
    plot(x_axis, mean(in_fb_data));
    ylabel("Disp(mm)")
    xlabel("Time(s)")
    title("Forward/Back");
    subplot(2,1,2)
    plot(x_axis, mean(in_lr_data));
    ylabel("Disp(mm)")
    xlabel("Time(s)")
    title("Left/Right")
end

%% plot heatmaps
function plot_heatmap(in_data, name)
    figure;
    imagesc(in_data);
    title(name);
    ylabel("Bouts");
    colorbar;
end

%%
function converted_data = convert_data(in_data)
    converted_data = ((in_data(1,:)*(4095/3.3)-2000)/4)/70.8662;
end
