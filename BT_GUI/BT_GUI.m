function varargout = BT_GUI(varargin)
% BT_GUI MATLAB code for BT_GUI.fig
%      BT_GUI, by itself, creates a new BT_GUI or raises the existing
%      singleton*.
%
%      H = BT_GUI returns the handle to a new BT_GUI or the handle to
%      the existing singleton*.
%
%      BT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BT_GUI.M with the given input arguments.
%
%      BT_GUI('Property','Value',...) creates a new BT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BT_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BT_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BT_GUI

% Last Modified by GUIDE v2.5 16-Nov-2021 13:55:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BT_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @BT_GUI_OutputFcn, ...
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


% --- Executes just before BT_GUI is made visible.
function BT_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BT_GUI (see VARARGIN)

% Choose default command line output for BT_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BT_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BT_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_menu_Callback(hObject, eventdata, handles)
% hObject    handle to file_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function edit_menu_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function view_menu_Callback(hObject, eventdata, handles)
% hObject    handle to view_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function tools_menu_Callback(hObject, eventdata, handles)
% hObject    handle to tools_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_menu_Callback(hObject, eventdata, handles)
% hObject    handle to help_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function new_menu_Callback(hObject, eventdata, handles)
% hObject    handle to new_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_menu_Callback(hObject, eventdata, handles)
% hObject    handle to open_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename pathname data;
clc;
[filename, pathname] = uigetfile({'*.csv'; '*.txt'; '*,xlsx'}, 'MultiSelect', 'on');
% filename is a array when open 1 file.
% filename is a cell when open n > 1 files
set(handles.listfile, 'string', filename); %set(handles.<tag’s listbox >,’string’,<n?i dung d?ng string gán vào listbox>
assignin('base', 'FileName', filename);
data = {};


% --------------------------------------------------------------------
function save_menu_Callback(hObject, eventdata, handles)
% hObject    handle to save_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function save_as_menu_Callback(hObject, eventdata, handles)
% hObject    handle to save_as_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function exit_menu_Callback(hObject, eventdata, handles)
% hObject    handle to exit_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in channel_menu.
function channel_menu_Callback(hObject, eventdata, handles)
% hObject    handle to channel_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns channel_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from channel_menu
global data ch fs
ch = get(hObject, 'Value');
cla %(clear axes)
[m, n] = size(data);
t = [1:m]/fs;
plot(t, data(:, ch));
xlabel('t(s)');
ylabel('A(\muV)');
title(['Channel ', num2str(ch)]);

% --- Executes during object creation, after setting all properties.
function channel_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channel_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in previous.
function previous_Callback(hObject, eventdata, handles)
% hObject    handle to previous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data ch fs
[m, n] = size(data);
if ch == 1
    ch = n;
else ch = ch - 1;
end
% ch = get(hObject, 'Value');
axes(handles.axes1);
cla %(clear axes)
t = [1:m]/fs;
plot(t, data(:, ch));
xlabel('t(s)');
ylabel('A(\muV)');
title(['Channel ', num2str(ch)]);


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data ch fs
[m, n] = size(data);
if ch == n
    ch = 1;
else ch = ch + 1;
end
% ch = get(hObject, 'Value');
axes(handles.axes1);
cla %(clear axes)
t = [1:m]/fs;
plot(t, data(:, ch));
xlabel('t(s)');
ylabel('A(\muV)');
title(['Channel ', num2str(ch)]);



function fs_edit_Callback(hObject, eventdata, handles)
% hObject    handle to fs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fs_edit as text
%        str2double(get(hObject,'String')) returns contents of fs_edit as a double


% --- Executes during object creation, after setting all properties.
function fs_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fs_ok.
function fs_ok_Callback(hObject, eventdata, handles)
% hObject    handle to fs_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data fs ch;
fs = str2num(get(handles.fs_edit, 'string'));
axes(handles.axes1);
cla %(clear axes)
[m, n] = size(data);
t = [1:m]/fs;
ch = 1;
plot(t, data(:, ch));
xlabel('t(s)');
ylabel('A(\muV)');
title(['Channel ', num2str(ch)]);


% --- Executes on selection change in listfile.
function listfile_Callback(hObject, eventdata, handles)
% hObject    handle to listfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listfile contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listfile
global filename data pathname;
index = get(hObject, 'Value');
if iscell(filename) == 1
    name = filename{index};
else
    name = filename;
end
if name(end - 3:end) == '.csv'
    data = csvread([pathname, name]);
elseif name(end - 3:end) == '.txt'
    data = importdata([pathname, name]);
elseif name(end - 3:end) == '.xls' || name(end - 4: end) == '.xlsx'
    data = xlsread([pathname, name]);
end
assignin('base', 'data', data);
[m, n] = size(data);
set(handles.channel_menu, 'string', num2str((1:n)'));



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
