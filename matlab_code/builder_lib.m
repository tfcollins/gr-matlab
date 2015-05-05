function builder_lib()


cfg = coder.config('dll');
cfg.TargetLang='C++';
result = codegen('-config','cfg','music_from_matlab','-o','libmusic_from_matlab.so');

if result.summary.passed
    system('cd ../include;rm music_from_matlab.h  music_from_matlab_types.h  rt_defines.h  rt_nonfinite.h  rtwtypes.h;cd ../matlab_code;');

    system(['cp ',pwd,'/codegen/dll/music_from_matlab/libmusic_from_matlab.so ../lib/']);
    
    system(['cp ',pwd,'/codegen/dll/music_from_matlab/music_from_matlab.h ../include/']);
    system(['cp ',pwd,'/codegen/dll/music_from_matlab/music_from_matlab_types.h ../include/']);
    
    system(['cp ',pwd,'/codegen/dll/music_from_matlab/rtwtypes.h ../include/']);
    system(['cp ',pwd,'/codegen/dll/music_from_matlab/rt_defines.h ../include/']);
    system(['cp ',pwd,'/codegen/dll/music_from_matlab/rt_nonfinite.h ../include/']);
    
    system(['rm -rf ',pwd,'/codegen']);
    
    disp('Build Completed Successfully');
else
    disp('Build failed');
end

end
