%% open footage directories
eye_cam_dir = dir("D:\exp-17-7-19\good_exp\eye_cam");
body_cam_dir = dir("D:\exp-17-7-19\good_exp\body_cam");
folder_name = 'D:\exp-17-7-19\good_exp\eye_cam';
%%
laser_pulse_frames = {(794:2294) (4407:5325)};
%% find cam frames and match with laser pulse time
A = uint8(zeros(600,960, 1836));
sorted_filenames = natsortfiles({eye_cam_dir.name});
indx = 1;
for i=794:2630
    A(:,:,indx) = imread(folder_name + "\" + sorted_filenames{i});
    indx = indx + 1;
end
%% get eye cam stimulus 2
% stim4 = get_movie_chunks(stim_chunks{4}, sorted_filenames, folder_name);
most_movie = all_chunks{1};
for i=2:10
    most_movie = cat(2,most_movie, all_chunks{i});
end
%% get all the movie start & end frames
stim_chunks = get_movie_start_end(epoch_start_times, cam1_timeup, timestamps);
%%
combo = vertcat(imresize(stim2, 0.5), imresize(stim3, 0.5));
%% get starts and ends of movie chunks
function movie_cell = get_movie_start_end(epoch_start_times, cam_frames, timestamps)
    movie_cell = cell(1,20);
    for i=1:20
        % get start frame first
        start = find(round(cam_frames(1,:), 1) ==round(timestamps(epoch_start_times(i)),1));
        movie_cell{1,i} = start(1):start(1)+918;
    end
    
end
%% 
function movie_mat = get_movie_chunks(stim_chunk, sorted_filenames, folder_name)
    movie_mat = uint8(zeros(300,480,1836));
    indx = 1;
    for i=stim_chunk(1):stim_chunk(end)+919
        movie_mat(:,:,indx) = imresize(imread(folder_name + "\" + sorted_filenames{i}), 0.5);
        indx = indx + 1;
    end
end
