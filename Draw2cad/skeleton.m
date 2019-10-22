function varargout = skeleton(varargin)
% skeleton MATLAB code for skeleton.fig
%      skeleton, by itself, creates a new skeleton or raises the existing
%      singleton*.
%
%      H = skeleton returns the handle to a new skeleton or the handle to
%      the existing singleton*.
%
%      skeleton('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in skeleton.M with the given input arguments.
%
%      skeleton('Property','Value',...) creates a new skeleton or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before skeleton_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to skeleton_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help skeleton

% Last Modified by GUIDE v2.5 19-Apr-2019 13:32:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @skeleton_OpeningFcn, ...
                   'gui_OutputFcn',  @skeleton_OutputFcn, ...
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


% --- Executes just before skeleton is made visible.
function skeleton_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to skeleton (see VARARGIN)

% Choose default command line output for skeleton
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
temp=0;
% UIWAIT makes skeleton wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = skeleton_OutputFcn(hObject, eventdata, handles) 
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
global h;
global w;
global J;


pause(1);



found=0;
num_d=1;
num_l=1;

Jm=J;
%   converting into 1 and 255
n=0;
for i=1:h
    for j=1:w
        if(J(i,j)<30)
            J(i,j)=0;
            Jm(i,j)=1;
            n=n+1;
            visited(:,n)=[i j];
        else
            J(i,j)=255;
            Jm(i,j)=0;
        end
        
    end
end

J1=J;

change=0;
n=0;
visitedt=visited;
visitedf=visited;
Jmt=Jm;
while(~isempty(visitedt))
    m=0;
    n=0;
    visitedt=[];
    
    while(n<length(visited(1,:)))
        n=n+1;
        
        i=visited(1,n);
        j=visited(2,n);
        temp1=min([Jm(i-1,j) Jm(i-1,j+1) Jm(i+1,j-1) Jm(i-1,j-1) Jm(i+1,j+1) Jm(i+1,j) Jm(i,j-1) Jm(i,j+1)])+1;
        if(Jm(i,j)~=temp1)
            Jmt(i,j)=temp1;
            m=m+1;
            visitedt(:,m)=[i j];
        end
    end
    
    visited=visitedt;
    Jm=Jmt;
end

Jf=Jm;

for i=1:h
    for j=1:w
        Jf(i,j)=255;
        
        
    end
end

n=0;
while(n<length(visitedf))
    n=n+1;
    
    i=visitedf(1,n);
    j=visitedf(2,n);
    temp1=max([Jm(i,j) Jm(i-1,j) Jm(i-1,j+1) Jm(i+1,j-1) Jm(i-1,j-1) Jm(i+1,j+1) Jm(i+1,j) Jm(i,j-1) Jm(i,j+1)]);
    if(Jm(i,j)==temp1)
        Jf(i,j)=0;
    end
end



J=Jf;
myImage = J;
set(handles.axes1,'Units','pixels');
resizePos = get(handles.axes1,'Position');
myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
axes(handles.axes1);
imshow(myImage);

handles.pushbutton1.String='Next';
if(temp)
    close
    run('scan');
    
else
    temp=1;
end
