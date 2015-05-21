function varargout = guiRobotDelta(varargin)
% GUIROBOTDELTA MATLAB code for guiRobotDelta.fig
%      GUIROBOTDELTA, by itself, creates a new GUIROBOTDELTA or raises the existing
%      singleton*.
%
%      H = GUIROBOTDELTA returns the handle to a new GUIROBOTDELTA or the handle to
%      the existing singleton*.
%
%      GUIROBOTDELTA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIROBOTDELTA.M with the given input arguments.
%
%      GUIROBOTDELTA('Property','Value',...) creates a new GUIROBOTDELTA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiRobotDelta_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiRobotDelta_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiRobotDelta

% Last Modified by GUIDE v2.5 10-May-2015 23:12:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiRobotDelta_OpeningFcn, ...
                   'gui_OutputFcn',  @guiRobotDelta_OutputFcn, ...
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


% --- Executes just before guiRobotDelta is made visible.
function guiRobotDelta_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiRobotDelta (see VARARGIN)
InitArduino
initVariables
global run;
run = 0;
Play_on(handles)
Automatico_on(handles)
%home(handles)
Home_Callback(hObject, eventdata, handles)
str = 'Estado:STOP';
set(handles.Estado,'ForegroundColor','R')
set(handles.Estado,'String',str)
PlotRobotDelta(3,[0 0 10],1,0,0,0)

% Choose default command line output for guiRobotDelta
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiRobotDelta wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiRobotDelta_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Manual.
function Manual_Callback(hObject, eventdata, handles)
% hObject    handle to Manual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Automatico_on(handles)



% --- Executes on button press in Automatico.
function Automatico_Callback(hObject, eventdata, handles)
% hObject    handle to Automatico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Manual_on(handles)


% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global run;
run = 1;
cambiarValoresArduino
guidata(hObject, handles);
str = 'Estado: RUN';
set(handles.Estado,'ForegroundColor','g')
set(handles.Estado,'String',str)
Stop_on(handles)




% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global run;
run = 0;
cambiarValoresArduino
str = 'Estado:STOP';
set(handles.Estado,'ForegroundColor','R')
set(handles.Estado,'String',str)
guidata(hObject, handles);
Play_on(handles)


% --- Executes on button press in Joystick.
function Joystick_Callback(hObject, eventdata, handles)
% hObject    handle to Joystick (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Joystick_On(handles)



% --- Executes on button press in EjesCartesianos.
function EjesCartesianos_Callback(hObject, eventdata, handles)
% hObject    handle to EjesCartesianos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EjesCartesianos_On(handles)




function X_Callback(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X as text
%        str2double(get(hObject,'String')) returns contents of X as a double


% --- Executes during object creation, after setting all properties.
function X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Callback(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y as text
%        str2double(get(hObject,'String')) returns contents of Y as a double


% --- Executes during object creation, after setting all properties.
function Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z_Callback(hObject, eventdata, handles)
% hObject    handle to Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z as text
%        str2double(get(hObject,'String')) returns contents of Z as a double


% --- Executes during object creation, after setting all properties.
function Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ProcesarRuta.
function ProcesarRuta_Callback(hObject, eventdata, handles)
% hObject    handle to ProcesarRuta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global x;
global y;
global z;
global t1;
global t2;
global t3
global pwmT1;
global pwmT2;
global pwmT3;
clc
strx=get(handles.X, 'string');
stry=get(handles.Y, 'string');
strz=get(handles.Z, 'string');
x = str2num(strx);
y = str2num(stry);
z = str2num(strz);
[t1 t2 t3] = CalculoAngulos(x,y,z)
PlotRobotDelta(3,[0 0 10],1,x,y,z)

set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));

[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino

guidata(hObject, handles);



% --- Executes on button press in menosX.
function menosX_Callback(hObject, eventdata, handles)
% hObject    handle to menosX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global incremento;
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
strIncremento=get(handles.incremento, 'string');
incremento = str2num(strIncremento);
x = x - incremento;
[t1 t2 t3] = CalculoAngulos(x,y,z)
PlotRobotDelta(3,[0 0 10],1,x,y,z)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino
guidata(hObject, handles);


% --- Executes on button press in masX.
function masX_Callback(hObject, eventdata, handles)
% hObject    handle to masX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global incremento;
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
strIncremento=get(handles.incremento, 'string');
incremento = str2num(strIncremento);
x = x + incremento;
[t1 t2 t3] = CalculoAngulos(x,y,z)
PlotRobotDelta(3,[0 0 10],1,x,y,z)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino


% --- Executes on button press in masY.
function masY_Callback(hObject, eventdata, handles)
% hObject    handle to masY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global incremento;
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
strIncremento=get(handles.incremento, 'string');
incremento = str2num(strIncremento);
y = y + incremento;
[t1 t2 t3] = CalculoAngulos(x,y,z)
PlotRobotDelta(3,[0 0 10],1,x,y,z)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino


% --- Executes on button press in menosY.
function menosY_Callback(hObject, eventdata, handles)
% hObject    handle to menosY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global incremento;
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
strIncremento=get(handles.incremento, 'string');
incremento = str2num(strIncremento);
y = y - incremento;
[t1 t2 t3] = CalculoAngulos(x,y,z)
PlotRobotDelta(3,[0 0 10],1,x,y,z)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino


% --- Executes on button press in menosZ.
function menosZ_Callback(hObject, eventdata, handles)
% hObject    handle to menosZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global incremento;
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
strIncremento=get(handles.incremento, 'string');
incremento = str2num(strIncremento);
z = z - incremento;
[t1 t2 t3] = CalculoAngulos(x,y,z)
PlotRobotDelta(3,[0 0 10],1,x,y,z)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino


% --- Executes on button press in masZ.
function masZ_Callback(hObject, eventdata, handles)
% hObject    handle to masZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global incremento;
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
strIncremento=get(handles.incremento, 'string');
incremento = str2num(strIncremento);
z = z + incremento;
[t1 t2 t3] = CalculoAngulos(x,y,z)
PlotRobotDelta(3,[0 0 10],1,x,y,z)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino



% --- Executes on button press in Home.
function Home_Callback(hObject, eventdata, handles)
% hObject    handle to Home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
home(handles)
PlotRobotDelta(3,[0 0 10],1,x,y,z)
[t1 t2 t3] = CalculoAngulos(x,y,z)
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
cambiarValoresArduino


function Play_on(handles)
 set(handles.Play,'Enable','on') 
 set(handles.Stop,'Enable','off')
 
 
function Stop_on(handles)
 set(handles.Play,'Enable','off') 
 set(handles.Stop,'Enable','on')


function Manual_on(handles)
 set(handles.Manual,'Enable','on') 
 set(handles.Automatico,'Enable','off')
 Joystick_On(handles)
 set(handles.Joystick,'Enable','off') 
 set(handles.EjesCartesianos,'Enable','off')
 set(handles.ProcesarRuta,'Enable','on')
 

function Automatico_on(handles)
    set(handles.Manual,'Enable','off') 
    set(handles.Automatico,'Enable','on')
    Joystick_On(handles)
    set(handles.Joystick,'Enable','on')
    set(handles.EjesCartesianos,'Enable','on')
    set(handles.ProcesarRuta,'Enable','off')

function Joystick_On(handles)
    set(handles.Joystick,'Enable','off')
    set(handles.EjesCartesianos,'Enable','on')
    set(handles.menosX,'Enable','off')
    set(handles.menosY,'Enable','off')
    set(handles.menosZ,'Enable','off')
    set(handles.masX,'Enable','off')
    set(handles.masY,'Enable','off')
    set(handles.masZ,'Enable','off')
    
function EjesCartesianos_On(handles)
    set(handles.Joystick,'Enable','on')
    set(handles.EjesCartesianos,'Enable','off')
    set(handles.menosX,'Enable','on')
    set(handles.menosY,'Enable','on')
    set(handles.menosZ,'Enable','on')
    set(handles.masX,'Enable','on')
    set(handles.masY,'Enable','on')
    set(handles.masZ,'Enable','on')    
    
function home(handles)
     global x;
     global y;
     global z;
     global ruta;
     a=0;
     x = 0;
     y = 0;
     z = 0;
     ruta = [0;0;0];
     set(handles.X,'string',num2str(x));
     set(handles.Y,'string',num2str(y));
     set(handles.Z,'string',num2str(z));
     set(handles.X_actual,'String',int2str(x));
     set(handles.Y_actual,'String',int2str(y));
     set(handles.Z_actual,'String',int2str(z));


% --- Executes on button press in ruta1.
function ruta1_Callback(hObject, eventdata, handles)
global ruta;
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
% hObject    handle to ruta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j = 50 %Numero de Pasos
r=.1;
th = 0:pi/j:2*pi; 
xunit = r * cos(th);
yunit = r * sin(th);
u = length(xunit);
g = ones(1,u);
g = g*(-.2);
ruta = [xunit;yunit;g];
x = ruta(1,1);
y = ruta(2,1);
z = ruta(3,1);
PlotRobotDelta(3,[0 0 10],1,x,y,z)
cambiarValoresArduino
pause(2)
loopRuta = length(ruta(1,:,:))
for i = 1 : loopRuta
%end
x = ruta(1,i);
y = ruta(2,i);
z = ruta(3,i);

[t1 t2 t3] = CalculoAngulos(x,y,z);
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino
PlotRobotDelta(3,[0 0 10],1,x,y,z)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
pause(.1)
end




function Archivo_Ruta_Callback(hObject, eventdata, handles)
% hObject    handle to Archivo_Ruta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Archivo_Ruta as text
%        str2double(get(hObject,'String')) returns contents of Archivo_Ruta as a double


% --- Executes during object creation, after setting all properties.
function Archivo_Ruta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Archivo_Ruta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ruta3.
function ruta3_Callback(hObject, eventdata, handles)
% hObject    handle to ruta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ruta;
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
% hObject    handle to ruta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j = 50 %Numero de Pasos
r=.1;
th = 0:pi/j:2*pi; 
xunit = r * sin(th);
yunit = r * sin(2*th);
u = length(xunit);
g =(r*sin(3*th))-.1;
ruta = [xunit;yunit;g];
x = ruta(1,1);
y = ruta(2,1);
z = ruta(3,1);
PlotRobotDelta(3,[0 0 10],1,x,y,z)
cambiarValoresArduino
pause(2)
loopRuta = length(ruta(1,:,:))
for i = 1 : loopRuta
%end
x = ruta(1,i);
y = ruta(2,i);
z = ruta(3,i);

[t1 t2 t3] = CalculoAngulos(x,y,z);
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino
PlotRobotDelta(3,[0 0 10],1,x,y,z)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
pause(.1)
end


% --- Executes on button press in ruta2.
function ruta2_Callback(hObject, eventdata, handles)

global ruta;
global x;
global y;
global z;
global t1;
global t2;
global t3;
global pwmT1;
global pwmT2;
global pwmT3;
% hObject    handle to ruta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j = 50 %Numero de Pasos
r=.1;
th = 0:pi/j:2*pi; 
xunit = r * cos(th);
yunit = r * sin(th);
u = length(xunit);
g = -.3:(.3/(u-1)):0
ruta = [xunit;yunit;g];
x = ruta(1,1);
y = ruta(2,1);
z = ruta(3,1);
PlotRobotDelta(3,[0 0 10],1,x,y,z)
cambiarValoresArduino
pause(2)
loopRuta = length(ruta(1,:,:))
for i = 1 : loopRuta
%end
x = ruta(1,i);
y = ruta(2,i);
z = ruta(3,i);

[t1 t2 t3] = CalculoAngulos(x,y,z);
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3);
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)
cambiarValoresArduino
PlotRobotDelta(3,[0 0 10],1,x,y,z)
set(handles.X_actual,'String',num2str(x));
set(handles.Y_actual,'String',num2str(y));
set(handles.Z_actual,'String',num2str(z));
set(handles.th1,'String',int2str(t1));
set(handles.th2,'String',int2str(t2));
set(handles.th3,'String',int2str(t3));
pause(.1)
end


% --- Executes on button press in correrRuta.
function correrRuta_Callback(hObject, eventdata, handles)
% hObject    handle to correrRuta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in gripperOn.
function gripperOn_Callback(hObject, eventdata, handles)
% hObject    handle to gripperOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gripper;
gripper = 1;
cambiarValoresArduino
set(handles.gripperOn,'Enable','off')
set(handles.gripperOff,'Enable','on')


% --- Executes on button press in gripperOff.
function gripperOff_Callback(hObject, eventdata, handles)
% hObject    handle to gripperOff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gripper;
gripper = 0;
cambiarValoresArduino
set(handles.gripperOn,'Enable','on')
set(handles.gripperOff,'Enable','off')



function incremento_Callback(hObject, eventdata, handles)
% hObject    handle to incremento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of incremento as text
%        str2double(get(hObject,'String')) returns contents of incremento as a double


% --- Executes during object creation, after setting all properties.
function incremento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to incremento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
