clear all;

for test=12:15
% Test MUSIC DOA
str = '/home/travis/Dropbox/PHD/WiFiUS/doa/gnuradio/gr-wifius/data/nearZero';
channel1 = read_complex_binary([str,num2str(test),'/channel0_complex_1_6_2015.bin']);
channel2 = read_complex_binary([str,num2str(test),'/channel1_complex_1_6_2015.bin']);
channel3 = read_complex_binary([str,num2str(test),'/channel2_complex_1_6_2015.bin']);
channel4 = read_complex_binary([str,num2str(test),'/channel3_complex_1_6_2015.bin']);

frameSize = 4096;
frames = floor(length(channel1)/frameSize);
estimates = zeros(2,frames);

for frame = 1:frames
    
    start = (frame-1)*frameSize+1;
    stop = frame*frameSize;
    doa_est = music_from_matlab(channel1(start:stop),channel2(start:stop),channel3(start:stop),channel4(start:stop));
    disp(['Angle Est: ',num2str(doa_est)]);
    estimates(:,frame) = doa_est;
    
end

figure(1);
hold on;
plot((estimates.'));
% hold on;
% plot(abs(estimates(1,:)-estimates(2,:)),'g');
% hold off;
ylabel('Degress');
axis([0 frames -90 90]);
hold off;
end
