function varargout = scan(varargin)
% scan MATLAB code for scan.fig
%      scan, by itself, creates a new scan or raises the existing
%      singleton*.
%
%      H = scan returns the handle to a new scan or the handle to
%      the existing singleton*.
%
%      scan('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in scan.M with the given input arguments.
%
%      scan('Property','Value',...) creates a new scan or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before scan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to scan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help scan

% Last Modified by GUIDE v2.5 19-Apr-2019 13:55:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @scan_OpeningFcn, ...
                   'gui_OutputFcn',  @scan_OutputFcn, ...
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


% --- Executes just before scan is made visible.
function scan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to scan (see VARARGIN)

% Choose default command line output for scan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global J;
global temp;

myImage = J;
% set(handles.axes1,'Units','pixels');
% resizePos = get(handles.axes1,'Position');
% myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
axes(handles.axes1);
imshow(myImage);
hold on

temp=0;
% UIWAIT makes scan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = scan_OutputFcn(hObject, eventdata, handles) 
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
global X_path;
global Y_path;
global firsti;
global firstj;
global lasti;
global lastj;
pause(1);



found=0;
num_d=1;
num_l=1;
handles.text2.String='Scanning please wait...';
pause (1);
itt=200;
firsti=[];
firstj=[];  
J1=J;
while(itt)
    
    for i=11:h-11
        for j=11:w-11
            if ((J1(i,j)==0)&&(sum(J1((i-10):(i+10),j-10)==0)||sum(J1((i-10):(i+10),j+10)==0)||sum(J1((i-10),(j-10):(j+10))==0)||sum(J1((i+10),(j-10):(j+10))==0)))
                found=1;
                i;
                j;
                firsti(num_l)=i;
                firstj(num_l)=j;
                break;
            else
                J1(i,j)=255;
            end
        end
        if(found==1)
            break;
        end
    end
    
    
    
    valid=0;
    
    while (found&&((J1(i-1,j-1)&&J1(i+1,j-1)&&J1(i-1,j+1)&&J1(i+1,j+1)&&J1(i,j-1)&&J1(i-1,j)&&J1(i,j+1)&&J1(i+1,j)&&J1(i+2,j)&&J1(i,j+2)&&J1(i-2,j)&&J1(i,j-2)&&J1(i+2,j+1)&&J1(i+1,j+2)&&J1(i-2,j+1)&&J1(i+1,j-2)&&J1(i-1,j+2)&&J1(i+2,j-1)&&J1(i-1,j-2)&&J1(i-2,j-1)&&J1(i+2,j+2)&&J1(i-2,j+2)&&J1(i-2,j-2)&&J1(i+2,j-2))==0))
        
        J1(i,j)=180;
        X_path(num_d)=j;
        Y_path(num_d)=i;
        num_d=num_d+1;
        if(J1(i-1,j-1)==0)
            ni=i-1;
            nj=j-1;
        elseif(J1(i+1,j-1)==0)
            ni=i+1;
            nj=j-1;
        elseif(J1(i-1,j+1)==0)
            ni=i-1;
            nj=j+1;
        elseif(J1(i+1,j+1)==0)
            ni=i+1;
            nj=j+1;
        elseif(J1(i-1,j)==0)
            ni=i-1;
            nj=j;
        elseif(J1(i,j-1)==0)
            ni=i;
            nj=j-1;
        elseif(J1(i,j+1)==0)
            ni=i;
            nj=j+1;
        elseif(J1(i+1,j)==0)
            ni=i+1;
            nj=j;
        elseif(J1(i-2,j)==0)
            ni=i-2;
            nj=j;
        elseif(J1(i,j-2)==0)
            ni=i;
            nj=j-2;
        elseif(J1(i+2,j)==0)
            ni=i+2;
            nj=j;
        elseif(J1(i,j+2)==0)
            ni=i;
            nj=j+2;
        elseif(J1(i+2,j+1)==0)
            ni=i+2;
            nj=j+1;
        elseif(J1(i+1,j+2)==0)
            ni=i+1;
            nj=j+2;
        elseif(J1(i+1,j-2)==0)
            ni=i+1;
            nj=j-2;
        elseif(J1(i-2,j+1)==0)
            ni=i-2;
            nj=j+1;
        elseif(J1(i-1,j+2)==0)
            ni=i-1;
            nj=j+2;
        elseif(J1(i+2,j-1)==0)
            ni=i+2;
            nj=j-1;
        elseif(J1(i-1,j-2)==0)
            ni=i-1;
            nj=j-2;
        elseif(J1(i-2,j-1)==0)
            ni=i-2;
            nj=j-1;
        elseif(J1(i+2,j+2)==0)
            ni=i+2;
            nj=j+2;
        elseif(J1(i-2,j-2)==0)
            ni=i-2;
            nj=j-2;
        elseif(J1(i+2,j-2)==0)
            ni=i+2;
            nj=j-2;
        elseif(J1(i-2,j+2)==0)
            ni=i-2;
            nj=j+2;
        end
        J1(i-1:i+1,j-1:j+1)=180;
        i=ni;
        j=nj;
        
        if(valid<50)
            valid=valid+1;
        else
            slope1=(firsti(num_l)-i)/(firstj(num_l)-j);
            slope2=(i-Y_path(num_d-10))/(j-X_path(num_d-10));
            abs(slope2-slope1);
            if(abs(slope2-slope1)>0.15)
                
                lastj(num_l)=(X_path(num_d-5));
                lasti(num_l)=Y_path(num_d-5);
                
                firstj(num_l+1)=X_path(num_d-5);
                firsti(num_l+1)=Y_path(num_d-5);
                num_l=num_l+1;
                valid=0;
                
            end
        end
        
    end
    if(found)
        lastj(num_l)=X_path(num_d-1);
        lasti(num_l)=Y_path(num_d-1);
        found=0;
        num_l=num_l+1;
        num_d=num_d+1;
        
    end
    
    itt=itt-1;
end
len7=length(firsti);

for i=1:length(firsti)
plot([firstj(i) lastj(i)],[firsti(i) lasti(i)],'r')

end


handles.text2.String='Scanning over';
handles.pushbutton1.Enable='off';
pause(0.1)
handles.text2.String='Now Enter the Dimensions     (Hint: Use Data Cursor)';
size2=length(X_path);
handles.text8.String=strcat('Results-    Number of data points found are:   ',int2str(size2));
handles.pushbutton4.Enable='on';
handles.edit1.Enable='on';
handles.edit2.Enable='on';
handles.edit3.Enable='on';
handles.edit4.Enable='on';
handles.edit5.Enable='on';
handles.pushbutton5.Enable='on';
%handles.text2.String='Now select the method of vectorisation';


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in program.
function program_Callback(hObject, eventdata, handles)
% hObject    handle to program (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns program contents as cell array
%        contents{get(hObject,'Value')} returns selected item from program
program=cellstr(get(hObject,'String'));
p_index=get(handles.program,'value');
A={'m1' ,'m2', 'm3', 'm4'};
if ~(p_index==1)
    
    %close
    %char(program(p_index))
    
    run(char(A(p_index-1)));
    
end

% --- Executes during object creation, after setting all properties.
function program_CreateFcn(hObject, eventdata, handles)
% hObject    handle to program (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global J2;
figure
imshow (J2);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global factor;
x1=str2num(get(handles.edit1,'string'));
x2=str2num(get(handles.edit3,'string'));
y1=str2num(get(handles.edit2,'string'));
y2=str2num(get(handles.edit4,'string'));
D=str2num(get(handles.edit5,'string'));
d=((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2))^(0.5);
factor=D*1.0/d;
handles.text2.String='Now select the method of vectorisation';
handles.pushbutton4.Enable='off';
handles.edit1.Enable='off';
handles.edit2.Enable='off';
handles.edit3.Enable='off';
handles.edit4.Enable='off';
handles.edit5.Enable='off';
handles.pushbutton5.Enable='off';
handles.program.Enable='on';


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
