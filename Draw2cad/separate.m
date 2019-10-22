function varargout = separate(varargin)
% SEPARATE MATLAB code for separate.fig
%      SEPARATE, by itself, creates a new SEPARATE or raises the existing
%      singleton*.
%
%      H = SEPARATE returns the handle to a new SEPARATE or the handle to
%      the existing singleton*.
%
%      SEPARATE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEPARATE.M with the given input arguments.
%
%      SEPARATE('Property','Value',...) creates a new SEPARATE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before separate_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to separate_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help separate

% Last Modified by GUIDE v2.5 04-Apr-2019 15:59:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @separate_OpeningFcn, ...
                   'gui_OutputFcn',  @separate_OutputFcn, ...
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


% --- Executes just before separate is made visible.
function separate_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to separate (see VARARGIN)

% Choose default command line output for separate
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes separate wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global temp;
global file;
temp=0;
myImage = file;
set(handles.axes1,'Units','pixels');
resizePos = get(handles.axes1,'Position');
myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
axes(handles.axes1);
imshow(myImage);

% --- Outputs from this function are returned to the command line.
function varargout = separate_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temp;
global J;
global J2;
global file;
global h;
global w;
M=file;
J=rgb2gray(M);

found=0;
num_d=1;
num_l=1;
[h,w]=size(J);
%   converting into 1 and 255
J2=J;
for i=1:h
    for j=1:w
        if(J(i,j)<50)
            J(i,j)=0;
            J2(i,j)=255;
        else
            J(i,j)=255;
            
            if(J2(i,j)>100 && J2(i,j)<200)
            J2(i,j)=0;
            else
                J2(i,j)=255;
            end
        end
        
    end
end

myImage = J;
set(handles.axes1,'Units','pixels');
resizePos = get(handles.axes1,'Position');
myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
axes(handles.axes1);
imshow(myImage);

myImage = J2;
set(handles.axes2,'Units','pixels');
resizePos = get(handles.axes2,'Position');
myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
axes(handles.axes2);
imshow(myImage);

handles.pushbutton1.String='Next';
if(temp)
    close
    run('noise');
else
    temp=1;
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
