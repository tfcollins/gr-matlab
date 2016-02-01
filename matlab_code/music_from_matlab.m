
function [az] = music_from_matlab(channel1,channel2,channel3,channel4)


% Asserts
assert(isa(channel1, 'double') && ~isreal(channel1) && all(size(channel1) == [4096,1]))
assert(isa(channel2, 'double') && ~isreal(channel2) && all(size(channel2) == [4096,1]))
assert(isa(channel3, 'double') && ~isreal(channel3) && all(size(channel3) == [4096,1]))
assert(isa(channel4, 'double') && ~isreal(channel4) && all(size(channel4) == [4096,1]))
% assert(isa(fc, 'double') && isreal(fc) && all(size(fc) == [1,1]))

%% Predefines
persistent music %espirit wsf
if isempty(music)
    spacing = 0.1;
    lambda = spacing*2;
    fc = physconst('LightSpeed')/lambda;
    %fc = 2.49827e9;
    fs = 100e6/64;
    elements = 4;
    lambda = physconst('LightSpeed')/fc;
    hula = phased.ULA('NumElements',elements,'ElementSpacing',lambda/2);
    hula.Element.FrequencyRange = [fc-fs/2 fc+fs/2];
    
    music = phased.RootMUSICEstimator(...
        'SensorArray',hula,...
        'OperatingFrequency',fc,...
        'NumSignalsSource','Property','NumSignals',1,...
        'ForwardBackwardAveraging',true);
    
%     espirit = phased.ESPRITEstimator('SensorArray',hula,...
%         'NumSignalsSource','Property','NumSignals',2,...
%         'ForwardBackwardAveraging',true, ...
%         'OperatingFrequency',fc);
%     
%     wsf = phased.RootWSFEstimator('SensorArray',hula,...
%         'OperatingFrequency',fc,...
%         'Method','IQML', ...
%         'NumSignalsSource','Property','NumSignals',2);

end

rxsig = [channel1, channel2, channel3, channel4];

%% Output
doa_est = 1.0;
doa_est(1) = step(music,rxsig);
% doa_est_espirit = step(espirit,rxsig);
% doa_est_wsf = step(wsf,rxsig);

% Convert to azimuth
az = 1.0;
elevation = -2;
%az(1) = broadside2az(doa_est,elevation);
az(1)= doa_est(1);
% az_espirit = broadside2az(doa_est_espirit,elevation);
% az_wsf = broadside2az(doa_est_wsf,elevation);

end
