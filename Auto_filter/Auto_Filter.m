%%Load file 
[filename,pathname]=uigetfile({'*'},'MultiSelect','on');
        selection = questdlg('Which filter you want ',...
        'Filter',...
        'Median','Adaptive','Averange','Averange');  
if (iscell(filename))
%%Get all file name from user choice
    for i=1:length(filename)
        name=filename{i};
        path=[pathname,name];        
        image_filter(path,selection)
    end
else
    name=filename;
    name=filename;
    path=[pathname,name];
    [K]=image_filter(path,selection);    
end
