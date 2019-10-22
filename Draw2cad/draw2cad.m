function varargout = draw2cad(varargin)
% DRAW2CAD MATLAB code for draw2cad.fig
%      DRAW2CAD, by itself, creates a new DRAW2CAD or raises the existing
%      singleton*.
%
%      H = DRAW2CAD returns the handle to a new DRAW2CAD or the handle to
%      the existing singleton*.
%
%      DRAW2CAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRAW2CAD.M with the given input arguments.
%
%      DRAW2CAD('Property','Value',...) creates a new DRAW2CAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before draw2cad_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to draw2cad_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help draw2cad

% Last Modified by GUIDE v2.5 04-Apr-2019 15:43:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @draw2cad_OpeningFcn, ...
                   'gui_OutputFcn',  @draw2cad_OutputFcn, ...
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


% --- Executes just before draw2cad is made visible.
function draw2cad_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to draw2cad (see VARARGIN)

% Choose default command line output for draw2cad
handles.output = hObject;
global temp;
temp=0;
% Update handles structure
guidata(hObject, handles);
myImage = imread('start.jpg');
set(handles.axes1,'Units','pixels');
resizePos = get(handles.axes1,'Position');
myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
axes(handles.axes1);
imshow(myImage);
set(handles.axes1,'Units','normalized');
% UIWAIT makes draw2cad wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = draw2cad_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in upload.
function upload_Callback(hObject, eventdata, handles)
% hObject    handle to upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temp;
global file;

if(~temp)
    temp=1;
    [File_Name, Path_Name] = uigetfile('12.jpg');
    axes(handles.axes1)
    imshow([Path_Name,File_Name])
    handles.upload.String='Next';
    handles.text5.String='File Uploaded Successfully !!!';
    file=imread([Path_Name,File_Name]);
else
    close
    run('separate');
    
end
