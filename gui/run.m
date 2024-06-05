function varargout = run(varargin)

addpath('../src/');

gui_Singleton = 1;
gui_State = struct('gui_Name',  mfilename, 'gui_Singleton',  gui_Singleton, 'gui_OpeningFcn', @run_OpeningFcn, 'gui_OutputFcn',  @run_OutputFcn, 'gui_LayoutFcn',  [] , 'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function run_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = run_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function figure1_KeyPressFcn(hObject, eventdata, handles)

function pushbutton1_Callback(hObject, eventdata, handles)
[handles.x,handles.fs] = wavread(handles.val);
guidata(hObject, handles);

function pushbutton1_KeyPressFcn(hObject, eventdata, handles)

function popupmenu1_Callback(hObject, eventdata, handles)

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu2_Callback(hObject, eventdata, handles)
contents = cellstr(get(hObject,'String'));
handles.val = contents{get(hObject,'Value')};
display(handles.val)
guidata(hObject,handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_WindowKeyPressFcn(hObject, eventdata, handles)

function figure1_CreateFcn(hObject, eventdata, handles)

function popupmenu3_Callback(hObject, eventdata, handles)
handles.choice = get(hObject,'Value');
display(handles.choice)
guidata(hObject,handles);

function popupmenu3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu4_Callback(hObject, eventdata, handles)
handles.opt = get(hObject,'Value');
guidata(hObject,handles);

function popupmenu4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton2_Callback(hObject, eventdata, handles)
if handles.choice == 1 || handles.choice == 3
    if handles.opt == 1 
        [l,r] = binaural_process(handles.x,0,handles.angle,1,handles.fs);
        soundsc([l r],handles.fs);
    elseif handles.opt == 2
        [l,r] = playback(handles.x,handles.fs,1);    
        soundsc([l r],handles.fs);
    elseif handles.opt == 3
        [l,r] = binaural_process(handles.x,str2double(handles.upAngle),0,1,handles.fs);    
        soundsc([l r],handles.fs);
    elseif handles.opt == 4
        [l,r] = playback(handles.x,handles.fs,2);     
        soundsc([l r],handles.fs);
    elseif handles.opt == 5
        [l,r] = playback(handles.x,handles.fs,3);     
        soundsc([l r],handles.fs);    
    end
elseif handles.choice == 2
    if handles.opt == 1
        [l,r]=loudspeaker(handles.x,0,handles.angle,1,handles.fs,0.15,30,0.4);
        soundsc([l r],handles.fs);
    elseif handles.opt == 2
        [l,r] = playback(handles.x,handles.fs,4);    
        soundsc([l r],handles.fs);    
    elseif handles.opt == 3
        [l,r]=loudspeaker(handles.x,str2double(handles.upAngle),0,1,handles.fs,0.15,30,0.4);   
        soundsc([l r],handles.fs);    
    elseif handles.opt == 4
        [l,r] = playback(handles.x,handles.fs,5);     
        soundsc([l r],handles.fs);
    elseif handles.opt == 5
        [l,r] = playback(handles.x,handles.fs,6);     
        soundsc([l r],handles.fs);    
    end
end

function r1_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = -90;
    display(handles.angle);
    guidata(hObject,handles);
end

function r2_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = -60;
    display(handles.angle);
    guidata(hObject,handles);
end

function r3_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = -30;
    display(handles.angle);
    guidata(hObject,handles);
end

function r4_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = 0;
    display(handles.angle);
    guidata(hObject,handles);
end

function r5_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = 30;
    display(handles.angle);
    guidata(hObject,handles);
end

function r6_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = 60;
    display(handles.angle);
    guidata(hObject,handles);
end

function r7_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = 90;
    display(handles.angle);
    guidata(hObject,handles);
end

function slider2_Callback(hObject, eventdata, handles)
display(round(get(hObject,'Value')/double(1/9)));
contents = cellstr(get(hObject,'String'));
handles.upAngle = contents{round(get(hObject,'Value')/double(1/9))};
display(handles.upAngle) 
handles.text5.String = handles.upAngle;
guidata(hObject,handles);

function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function r1_CreateFcn(hObject, eventdata, handles)

function r1_DeleteFcn(hObject, eventdata, handles)

function l1_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = -90;
    display(handles.angle);
    guidata(hObject,handles);
end

function l7_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = 90;
    display(handles.angle);
    guidata(hObject,handles);
end

function l4_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = 0;
    display(handles.angle);
    guidata(hObject,handles);
end

function l2_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = -60;
    display(handles.angle);
    guidata(hObject,handles);
end

function l3_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = -30;
    display(handles.angle);
    guidata(hObject,handles);
end

function l5_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = 30;
    display(handles.angle);
    guidata(hObject,handles);
end

function l6_Callback(hObject, eventdata, handles)
if(get(hObject,'Value') == 1)
    handles.angle = 60;
    display(handles.angle);
    guidata(hObject,handles);
end

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function text3_CreateFcn(hObject, eventdata, handles)

function text5_CreateFcn(hObject, eventdata, handles)
[handles.text5,hObject] = gcbo;
guidata(hObject,handles);
