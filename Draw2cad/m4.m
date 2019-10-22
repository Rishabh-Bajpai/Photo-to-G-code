function varargout = m4(varargin)
% m4 MATLAB code for m4.fig
%      m4, by itself, creates a new m4 or raises the existing
%      singleton*.
%
%      H = m4 returns the handle to a new m4 or the handle to
%      the existing singleton*.
%
%      m4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in m4.M with the given input arguments.
%
%      m4('Property','Value',...) creates a new m4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before m4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to m4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help m4

% Last Modified by GUIDE v2.5 20-Apr-2019 22:16:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @m4_OpeningFcn, ...
                   'gui_OutputFcn',  @m4_OutputFcn, ...
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


% --- Executes just before m4 is made visible.
function m4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to m4 (see VARARGIN)

% Choose default command line output for m4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global temp;
global X_path;
global Y_path;
global J;
global J2;
global firsti;
global firstj;
global lasti;
global lastj;
global h;
global w;
myImage = J;
%axes(handles.axes1);

%axis([0,w,0,h]);


set(handles.axes1,'Units','pixels');
resizePos = get(handles.axes1,'Position');
myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
axes(handles.axes1);
imshow(myImage);
set(handles.axes1,'Units','normalized');

imshow(myImage);


len1=length(X_path);
t=0:(len1-1);
first_temp=1;
x_i=1;
for i=1:length(X_path)-1
    if(abs(X_path(i)-X_path(i+1))>20)
        last_temp=i;
        i
        try
        thx=fit(t(first_temp:last_temp)',X_path(first_temp:last_temp)','pchipinterp');
        X_fit{x_i}=thx;
        t_x(x_i,1)=first_temp;
        t_x(x_i,2)=last_temp;
        first_temp=last_temp;
        x_i=x_i+1;
        catch
            ;
        end
    end
    
end
last_temp=i;
try
thx=fit(t(first_temp:last_temp)',X_path(first_temp:last_temp)','pchipinterp');
X_fit{x_i}=thx;
t_x(x_i,1)=first_temp;
t_x(x_i,2)=last_temp;
catch
    ;
end
X_final=[];
for i=1:length(X_fit);
    X_final(t_x(i,1):t_x(i,2))=X_fit{i}(t_x(i,1):t_x(i,2));
end


first_temp=1;
y_i=1;
Y_final=[];
for i=1:length(Y_path)-1
    if(abs(Y_path(i)-Y_path(i+1))>20)
        last_temp=i;
        i
        try
        thy=fit(t(first_temp:last_temp)',Y_path(first_temp:last_temp)','pchipinterp');
        Y_fit{y_i}=thy;
        t_y(y_i,1)=first_temp;
        t_y(y_i,2)=last_temp;
        first_temp=last_temp;
        catch
            ;
        end
        y_i=y_i+1;
    end
    
end
last_temp=i;
try
thy=fit(t(first_temp:last_temp)',Y_path(first_temp:last_temp)','pchipinterp');
Y_fit{y_i}=thy;
t_y(y_i,1)=first_temp;
t_y(y_i,2)=last_temp;
catch
    ;
end
for i=1:length(Y_fit);
    Y_final(t_y(i,1):t_y(i,2))=Y_fit{i}(t_y(i,1):t_y(i,2));
end
axes(handles.axes2);
plot(X_final,h-Y_final,'.r','LineWidth',1)
axis([0,w,0,h]);

size1=((h+w)*40+length(X_path)*4);

size2=length(X_path)*6;
handles.edit1.String=strcat(int2str(size1),' bytes');
handles.edit2.String=strcat(int2str(size2),' bytes');

handles.edit5.String=strcat(num2str((size1-size2)*100.0/size1),' %');
handles.edit6.String=strcat(num2str((size1*size1-size2*size2)*100.0/(size1*size1)),' %');

figure 
 hold on
plot(t,Y_path,'.b')
for i=1:length(Y_fit);
plot(t_y(i,1):t_y(i,2),Y_fit{i}(t_y(i,1):t_y(i,2)),'.r');
end
figure
plot(t,X_path,'.b')
hold on
for i=1:length(X_fit);
plot(t_x(i,1):t_x(i,2),X_fit{i}(t_x(i,1):t_x(i,2)),'.r');
end

temp=0;
% UIWAIT makes m4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = m4_OutputFcn(hObject, eventdata, handles) 
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

handles.text2.String='Now select the method of vectorisation';


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
    
    run(A(p_index-1));
    
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


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X_path;
global Y_path;
%global factor;

filter = {'*.gcode'};
[File_Name, Path_Name] = uiputfile(filter);
f=fopen([Path_Name,File_Name],'w');
fprintf(f,'G17 G21 G90 G54\n');
fprintf(f,'G00 X0 Y0\n');
% x=factor*X_path;
% y=factor*Y_path;
x=X_path;
y=Y_path;

for i=2:length(x)
    fprintf(f,'G01 ');
    fprintf(f,'X%d Y%d ',x(i),y(i));
    
    if(abs(x(i)-x(i-1))<6)
    fprintf(f,'Z0\n');
    else
        fprintf(f,'Z1\n');
    end
end
fprintf(f,'G01 ');
fprintf(f,'X%d Y%d ',x(i),y(i));
fprintf(f,'Z1 \nX0 Y0 \nM2');
fclose(f);
f1 = msgbox('File saved!!!','Success');



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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
