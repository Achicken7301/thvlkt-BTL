function varargout = BTL2(varargin)
% BTL2 MATLAB code for BTL2.fig
%      BTL2, by itself, creates a new BTL2 or raises the existing
%      singleton*.
%
%      H = BTL2 returns the handle to a new BTL2 or the handle to
%      the existing singleton*.
%
%      BTL2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BTL2.M with the given input arguments.
%
%      BTL2('Property','Value',...) creates a new BTL2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BTL2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BTL2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BTL2

% Last Modified by GUIDE v2.5 24-Nov-2021 20:38:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BTL2_OpeningFcn, ...
                   'gui_OutputFcn',  @BTL2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BTL2 is made visible.
function BTL2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BTL2 (see VARARGIN)

% Choose default command line output for BTL2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BTL2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BTL2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function files_Callback(hObject, eventdata, handles)
% hObject    handle to files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function files_open_Callback(hObject, eventdata, handles)
% hObject    handle to files_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear axes
cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
cla(handles.axes3,'reset');
cla(handles.axes4,'reset');
clc;
global file_X folder 
try
[file_X, folder] = uigetfile({'*.dcm; *.png; *.jpg'}, 'MultiSelect', 'on');
% add list file to list box
set(handles.listfile, 'string', file_X); 
% check cell or array
if iscell(file_X) == 1
    namefile = file_X{1};
else
    namefile = file_X;
end
path = [folder, namefile];
% >> file = dir(path)
% file = 
%        name: 'xray.png'
%        date: '17-Nov-2021 15:51:19'
%       bytes: 625505
%       isdir: 0
%     datenum: 7.3848e+05
file = dir(path);
size_file = num2str(file.bytes);
[~, name, ext] = fileparts(path);

% Display name, path, size on static text
set(handles.text1, 'String', ['Name: ',file.name]);
set(handles.text2, 'String', ['Path: ', path]);
set(handles.text3, 'String', ['Size: ', size_file, ' Bytes']);
im = imread(path);
% Check if RGB image
if size(im, 3) == 3
    im = rgb2gray(im);
end
% Get row col im
[col, row] = size(im);
% Display image on axies1
axes(handles.axes1); 
imshow(im); title(name);

% Display histogram of an image
axes(handles.axes3); imhist(im); title('Histogram');

% Save variables on workspace
assignin('base', 'file_X', file_X);
assignin('base', 'size_file', size_file);
assignin('base', 'name', file.name);
assignin('base', 'folder', folder);
assignin('base', 'name', name);
assignin('base', 'ext', ext);
assignin('base', 'im', im);
assignin('base', 'col', col);
assignin('base', 'row', row);
catch
    s = sprintf('Image not found! Please add an image .dcm, .png, .jpg');
questdlg(s,...
    'Error',...
    'OK','OK');
end



% --------------------------------------------------------------------
function tools_Callback(hObject, eventdata, handles)
% hObject    handle to tools (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved -file to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg('Do you want to close?',...
    'Close Request',...
    'Yes','No','Yes');
switch selection
    case 'Yes'
        delete(gcf)
    case 'No'
        return
end

% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object deletion, before destroying properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function tools_add_distance_Callback(hObject, eventdata, handles)
% hObject    handle to tools_add_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
% Get distance 
end_row = evalin('base', 'row');
end_col = evalin('base', 'col');
% end_row = 1024;
% end_col = 686;
% Value defalut
distanceInPixels = 1024;
distanceInUnits = 30;

% Distance ratio
distancePerPixel = distanceInUnits / distanceInPixels;

% access the 'children' of the axes for get the x and y data from each call to plot 
hChildren = get(gca,'Children')

% Convert XData and YData to meters using conversion factor.
XDataInMeters = get(hChildren,'XData')*distancePerPixel; 
YDataInMeters = get(hChildren,'YData')*distancePerPixel;
     
% Set XData and YData of image to reflect desired units.    
set(hChildren,'XData',XDataInMeters,'YData',YDataInMeters);  
set(gca,'XLim',XDataInMeters,'YLim',YDataInMeters);

h = imdistline(gca);
api = iptgetapi(h);
fcn = makeConstrainToRectFcn('imline',...
                              get(gca,'XLim'),get(gca,'YLim'));
api.setDragConstraintFcn(fcn);
api.setLabelTextFormatter('%02.2f cm');
catch ME
%     s = sprintf('Image not found! Please add an image\nFile > Open or Ctrl + O');
%     questdlg(s,...
%             'Error',...
%             'OK','OK');
    rethrow(ME);
end

% --------------------------------------------------------------------
function help_about_Callback(hObject, eventdata, handles)
% hObject    handle to help_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)\

% Check if all variables exist?
try
% evalin - get variable's value from workspace
size_file = evalin('base', 'size_file');
folder = evalin('base', 'folder');
% sprintf - display a textbox
% Example: ('%3$s %2$s %1$s %2$s','A','B','C') prints input arguments 'A', 'B', 'C' as follows: C B A B.
s = sprintf('Image Infomation:\nSize: %1$s Bytes\nPath: %2$s', size_file, folder);
questdlg(s,...
    'Image Infomation',...
    'OK','OK');
catch
    s = sprintf('Image not found! Please add an image\nFile-Open or Ctrl + O');
questdlg(s,...
    'Error',...
    'OK','OK');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slider_value = get(hObject,'Value');
try
    try
        im = evalin('base', 'im_adjust'); % evalin - get variable's value from workspace
        im_adjust = imadjust(im, [slider_value 1 - slider_value] ,[]);
    catch
        im = evalin('base', 'im'); % evalin - get variable's value from workspace
        im_adjust = imadjust(im, [slider_value 1 - slider_value] ,[]);
    end
axes(handles.axes2); imshow(im_adjust); title('After imadjust');
axes(handles.axes4); imhist(im_adjust); title('Histogram');

% Save variables on workspace
assignin('base', 'im_adjust', im_adjust);
% assignin('base', 'high_in', 1 - slider_value);
catch
    s = sprintf('Image not found! Please add an image\nFile > Open or Ctrl + O');
    questdlg(s,...
            'Error',...
            'OK','OK');
%     display('Image not found! Please add an image\nFile > Open or Ctrl + O');
    return
end




% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function files_save_Callback(hObject, eventdata, handles)
% hObject    handle to files_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Save to the current folder with default name as: date - file_name.*
try
    im_adjust = evalin('base', 'im_adjust');
    name = evalin('base', 'name');
    ext = evalin('base', 'ext');
    folder = evalin('base', 'folder');
    
    fullFileName = [name, ' ', date, ext];      % Set defailt name
    imwrite(im_adjust, fullFileName);           % Save iamge
    s = sprintf('Your image in the folder: %1$s', folder);
    questdlg(s,...
        'Save Image Successfully',...
        'OK','OK');
catch
    s = sprintf('Image not found!');
    questdlg(s,...
        'Error',...
        'OK','OK');
end



% --------------------------------------------------------------------
function files_save_as_Callback(hObject, eventdata, handles)
% hObject    handle to files_save_as (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Save to the specific folder which can rename file.

% --- Executes on button press in btn_dark.
function btn_dark_Callback(hObject, eventdata, handles)
% hObject    handle to btn_dark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

btn_value = get(hObject, 'Value');
try

    im = evalin('base', 'im_adjust'); % evalin - get variable's value from workspace
    im_darkness = imsubtract(im, btn_value);
    axes(handles.axes2); imshow(im_darkness); title('After imadjust');
    axes(handles.axes4); imhist(im_darkness); title('Histogram');
    % Save variables on workspace
    assignin('base', 'im_adjust', im_darkness);
    % assignin('base', 'high_in', 1 - slider_value);
catch
    s = sprintf('Image not found! Please add an image\nFile > Open or Ctrl + O');
    questdlg(s,...
            'Error',...
            'OK','OK');
end

% --- Executes on button press in btn_light.
function btn_light_Callback(hObject, eventdata, handles)
% hObject    handle to btn_light (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
btn_value = get(hObject, 'Value');
try
    im = evalin('base', 'im_adjust'); % evalin - get variable's value from workspace
    im_brighness = imadd(im, btn_value);
    axes(handles.axes2); imshow(im_brighness); title('After imadjust');
    axes(handles.axes4); imhist(im_brighness); title('Histogram');

    % Save variables on workspace
    assignin('base', 'im_adjust', im_brighness);
    % assignin('base', 'high_in', 1 - slider_value);
catch
    s = sprintf('Image not found! Please add an image\nFile > Open or Ctrl + O');
    questdlg(s,...
            'Error',...
            'OK','OK');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = evalin('base', 'im');
assignin('base', 'im_adjust', im);
name = evalin('base', 'name');
axes(handles.axes2); 
imshow(im); title(name);
axes(handles.axes4); 
imhist(im); title('Histogram');


% --------------------------------------------------------------------
function help_docs_Callback(hObject, eventdata, handles)
% hObject    handle to help_docs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://github.com/Achicken7301/thvlkt-BTL/blob/main/docs/Docs.md';
web(url)





% --- Executes on selection change in listfile.
function listfile_Callback(hObject, eventdata, handles)
% hObject    handle to listfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listfile contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listfile
% clear axes
cla(handles.axes2,'reset');
cla(handles.axes4,'reset');
global file_X folder;
try
index = get(hObject, 'Value'); % Get value 

% check cell or array
if iscell(file_X) == 1
    namefile = file_X{index};
else
    namefile = file_X;
end

path = [folder, namefile];
% >> file = dir(path)
% file = 
%        name: 'xray.png'
%        date: '17-Nov-2021 15:51:19'
%       bytes: 625505
%       isdir: 0
%     datenum: 7.3848e+05
file = dir(path);
size_file = num2str(file.bytes);
[~, name, ext] = fileparts(path);

% Display name, path, size on static text
set(handles.text1, 'String', ['Name: ', file.name]);
set(handles.text2, 'String', ['Path: ', path]);
set(handles.text3, 'String', ['Size: ', size_file, ' Bytes']);
im = imread(path);

% Check if RGB image
if size(im, 3) == 3
    im = rgb2gray(im);
end
% Display image on axies1
axes(handles.axes1); 
imshow(im); title(name);

% Display histogram of an image
axes(handles.axes3); imhist(im); title('histogram');

% Save variables on workspace
assignin('base', 'size_file', size_file);
assignin('base', 'name', file.name);
assignin('base', 'folder', folder);
assignin('base', 'name', name);
assignin('base', 'ext', ext);
assignin('base', 'im', im);
catch
    s = sprintf('Image not found! Please add an image .dcm, .png, .jpg');
questdlg(s,...
    'Error',...
    'OK','OK');
end


% --- Executes during object creation, after setting all properties.
function listfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
