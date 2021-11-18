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

% Last Modified by GUIDE v2.5 18-Nov-2021 13:31:38

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
[file_X, path_X] = uigetfile('*.dcm; *.png; *.jpg');
path = [path_X, file_X];
assignin('base', 'path', path);
% >> file = dir(path)
% file = 
% 
%        name: 'xray.png'
%        date: '17-Nov-2021 15:51:19'
%       bytes: 625505
%       isdir: 0
%     datenum: 7.3848e+05
size = dir(path);
[pathstr,name,ext] = fileparts(path);
% Save variables on workspace
assignin('base', 'size', size.bytes);
assignin('base', 'name', [name, ext]);
% Display name, path, size on static text
set(handles.path, 'String', ['Path: ', path]);
set(handles.size, 'String', ['Size: ', num2str(size.bytes), ' bytes']);
% Read Image
I = imread(path);
assignin('base', 'I', I);
% Display on axies1
axes(handles.axes1); 
imshow(I); title(name);

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
