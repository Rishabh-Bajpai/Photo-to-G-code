function varargout = noise(varargin)
% NOISE MATLAB code for noise.fig
%      NOISE, by itself, creates a new NOISE or raises the existing
%      singleton*.
%
%      H = NOISE returns the handle to a new NOISE or the handle to
%      the existing singleton*.
%
%      NOISE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NOISE.M with the given input arguments.
%
%      NOISE('Property','Value',...) creates a new NOISE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before noise_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to noise_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help noise

% Last Modified by GUIDE v2.5 19-Apr-2019 13:10:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @noise_OpeningFcn, ...
                   'gui_OutputFcn',  @noise_OutputFcn, ...
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


% --- Executes just before noise is made visible.
function noise_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to noise (see VARARGIN)

% Choose default command line output for noise
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global J;
global temp;

myImage = J;
set(handles.axes1,'Units','pixels');
resizePos = get(handles.axes1,'Position');
myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
axes(handles.axes1);
imshow(myImage);
hold on

temp=0;
% UIWAIT makes noise wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = noise_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in noiseb.
function noiseb_Callback(hObject, eventdata, handles)
% hObject    handle to noiseb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temp;
global h;
global w;
global J;
handles.noiseb.String='Next';
pause(1);
for i=11:h-11
        for j=11:w-11
            if ((J(i,j)==0)&&(~(sum(J((i-10):(i+10),j-10)==0)||sum(J((i-10):(i+10),j+10)==0)||sum(J((i-10),(j-10):(j+10))==0)||sum(J((i+10),(j-10):(j+10))==0))))
                J(i,j)=255;
                plot(j,i,'o');
                           
            end
        end
end
if(temp)
    close
    run('skeleton');
else
    temp=1;
end
