function varargout = yes(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @yes_OpeningFcn, ...
                   'gui_OutputFcn',  @yes_OutputFcn, ...
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


% --- Executes just before yes is made visible.
function yes_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);


function varargout = yes_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function pbAuto_Callback(hObject, eventdata, handles)
% hObject    handle to pbAuto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pbOn,'Enable','off');
set(handles.pbOff,'Enable','off');
delete(instrfind({'Port'},{'COM7'}))
global s1;
global auto;
auto = 1;
s1 = arduino('com7');
s1.pinMode(13,'output');
while auto==1
     value = s1.analogRead(0);
     set(handles.txtLight,'String',value);
     flag = value;
     if flag<100
         value = 'ON';
         set(handles.txtON,'String',value);
         value = ' ';
         set(handles.txtOFF,'String',value);
         s1.digitalWrite(13,1);
     else
         value = ' ';
         set(handles.txtON,'String',value);
         value = 'OFF';
         set(handles.txtOFF,'String',value);
         s1.digitalWrite(13,0);
     end
    pause(1);
end
        
% --- Executes on button press in pbManual.
function pbManual_Callback(hObject, eventdata, handles)
% hObject    handle to pbManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    value = 'OFF';
    set(handles.txtOFF,'String',value);
    value = ' ';
    set(handles.txtON,'String',value);
delete(instrfind({'Port'},{'COM7'}))
global s1;
global auto;
auto = 0;
s1 = arduino('COM7');
set(handles.pbOn,'Enable','on');
set(handles.pbOff,'Enable','on');
s1.pinMode(13,'output');


% --- Executes on button press in pbOn.
function pbOn_Callback(hObject, eventdata, handles)
% hObject    handle to pbOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s1;
    value = 'ON';
    set(handles.txtON,'String',value);
    value = ' ';
    set(handles.txtOFF,'String',value);
s1.digitalWrite(13,1);

% --- Executes on button press in pbOff.
function pbOff_Callback(hObject, eventdata, handles)
% hObject    handle to pbOff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s1;
    value = 'OFF';
    set(handles.txtOFF,'String',value);
    value = ' ';
    set(handles.txtON,'String',value);
s1.digitalWrite(13,0);


% --- Executes on button press in pbDisconnect.
function pbDisconnect_Callback(hObject, eventdata, handles)
% hObject    handle to pbDisconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(instrfind({'Port'},{'COM7'}))