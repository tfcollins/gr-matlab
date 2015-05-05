% Test MUSIC DOA
channel1 = read_complex_binary('/home/travis/Dropbox/PHD/MarcoPolo/Data/tx1.txt');
channel2 = read_complex_binary('/home/travis/Dropbox/PHD/MarcoPolo/Data/tx2.txt');
channel3 = read_complex_binary('/home/travis/Dropbox/PHD/MarcoPolo/Data/tx3.txt');
channel4 = read_complex_binary('/home/travis/Dropbox/PHD/MarcoPolo/Data/tx4.txt');

frameSize = 1024;
frames = floor(length(channel1)/frameSize);

for frame = 1:frames
    
    start = (frame-1)*frameSize+1;
    stop = frame*frameSize;
    
    doa_est = music_from_matlab(channel1(start:stop),channel2(start:stop),channel3(start:stop),channel4(start:stop));
    
    disp(['Angle Est: ',num2str(doa_est)]);
    
end
