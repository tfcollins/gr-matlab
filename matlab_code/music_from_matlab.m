
function az = music_from_matlab(channel1,channel2,channel3,channel4)

%% Asserts
assert(isa(channel1, 'double') && ~isreal(channel1) && all(size(channel1) == [4096,1]))
assert(isa(channel2, 'double') && ~isreal(channel2) && all(size(channel2) == [4096,1]))
assert(isa(channel3, 'double') && ~isreal(channel3) && all(size(channel3) == [4096,1]))
assert(isa(channel4, 'double') && ~isreal(channel4) && all(size(channel4) == [4096,1]))

%% Predefines
persistent music
if isempty(music)
    fc = 2.437e9;
    fs = 100e6/256;
    elements = 4;
    lambda = physconst('LightSpeed')/fc;
    hula = phased.ULA('NumElements',elements,'ElementSpacing',lambda/2);
    hula.Element.FrequencyRange = [fc-fs/2 fc+fs/2];
    
    music = phased.RootMUSICEstimator(...
        'SensorArray',hula,...
        'OperatingFrequency',fc,...
        'NumSignalsSource','Property','NumSignals',1,...
        'ForwardBackwardAveraging',true); 
end

rxsig = [channel1, channel2, channel3, channel4];

%% Output
doa_est = 1.0;
doa_est(1) = step(music,rxsig);

% Convert to azimuth
az = 1.0;
elevation = 0;
az(1) = broadside2az(doa_est,elevation);

end
