function varargout = READ_WRITE_ADIOES(varargin)
% READ_WRITE_ADIOES M-file for READ_WRITE_ADIOES.fig
%      READ_WRITE_ADIOES, by itself, creates a new READ_WRITE_ADIOES or raises the existing
%      singleton*.
%
%      H = READ_WRITE_ADIOES returns the handle to a new READ_WRITE_ADIOES or the handle to
%      the existing singleton*.
%
%      READ_WRITE_ADIOES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in READ_WRITE_ADIOES.M with the given input arguments.
%
%      READ_WRITE_ADIOES('Property','Value',...) creates a new READ_WRITE_ADIOES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before READ_WRITE_ADIOES_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to READ_WRITE_ADIOES_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help READ_WRITE_ADIOES

% Last Modified by GUIDE v2.5 25-Oct-2016 05:14:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @READ_WRITE_ADIOES_OpeningFcn, ...
                   'gui_OutputFcn',  @READ_WRITE_ADIOES_OutputFcn, ...
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


% --- Executes just before READ_WRITE_ADIOES is made visible.
function READ_WRITE_ADIOES_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to READ_WRITE_ADIOES (see VARARGIN)

% Choose default command line output for READ_WRITE_ADIOES
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes READ_WRITE_ADIOES wait for user response (see UIRESUME)
% uiwait(handles.figure1);
delete(instrfind({'Port'},{'COM3'}))
clear a;
global a;
global stop;
stop='e';
global entry;
entry=1;
global time;
time=0;
a = arduino('COM3');
a.pinMode(8, 'output');
a.pinMode(9, 'output');
a.pinMode(10, 'output');
a.pinMode(11, 'output');



% --- Outputs from this function are returned to the command line.
function varargout = READ_WRITE_ADIOES_OutputFcn(hObject, eventdata, handles) 
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
global k a

global entry;

x=0;y=0;z=0;w=0;
while (1)
    
       % if entry==1
%for k=1:1:handles.xSamples
    b=a.analogRead(0);
    c=a.analogRead(1);
    d=a.analogRead(2);
    e=a.analogRead(3);
    
    b=b/2;
    c=c/2;
    d=d/2;
    e=e/2;
    
    x=[x,b];y =[y,c];z =[z,d];w =[w,e]
     
    subplot(2,2,1);
     plot(x,'r'); grid on;drawnow;
    %axis([0 handles.xSamples 0 500]);
    pause(0.01);
    
    subplot(2,2,2);
    plot(y,'k');drawnow;grid on;
    pause(0.01);
    
   % subplot(2,2,3);
   % plot(z,'y');drawnow;grid on;
   % pause(0.01); 
    
    % subplot(2,2,4);
    %plot(w,'r');drawnow;grid on;
    %pause(0.01);
    
        
    
end

% --- Executes on button press in STOP.
function STOP_Callback(hObject, eventdata, handles)
% hObject    handle to STOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stop;
stop='e';
fclose(instrfind);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

handles.data1=get(hObject,'String');
handles.xSamples=str2double(handles.data1);
guidata(hObject,handles);

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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global a;
a.digitalWrite(8,1);
global a;
a.digitalWrite(9,0);
global a;
a.digitalWrite(10,1);
global a;
a.digitalWrite(11,0);
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
a.digitalWrite(8,0);
global a;
a.digitalWrite(9,0);
global a;
a.digitalWrite(10,1);
global a;
a.digitalWrite(11,0);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
a.digitalWrite(8,1);
global a;
a.digitalWrite(9,0);
global a;
a.digitalWrite(10,0);
global a;
a.digitalWrite(11,0);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global a;
a.digitalWrite(8,0);
global a;
a.digitalWrite(9,1);
global a;
a.digitalWrite(10,0);
global a;
a.digitalWrite(11,1);
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
a.digitalWrite(8,0);
global a;
a.digitalWrite(9,0);
global a;
a.digitalWrite(10,0);
global a;
a.digitalWrite(11,0);
