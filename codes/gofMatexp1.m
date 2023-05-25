function varargout = gofMatexp1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @gofMatexp1_OpeningFcn, ...
    'gui_OutputFcn',  @gofMatexp1_OutputFcn, ...
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

function gofMatexp1_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = gofMatexp1_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function browse_the_file_Callback(hObject, eventdata, handles)
format long;
[filename pathname]=uigetfile({'*.xlsx'},'File Selector');
fullpathname=strcat(pathname,filename);
[num,~,~]=xlsread(fullpathname);
global t;
global y;
global eqn;
t=num(1,:);y=num(2,:);
eqn = ["init*exp(-x/tau)";"A1*exp(s1*x)+A2*exp(s2*x)";"(A2+A1*x)*exp(-a*x)";"exp(-a*x)*(A1*cos(w*x)+A2*sin(w*x))"];
gofMat = myplot_manami(eqn,t,y);
gofMat_table=table2array(struct2table(gofMat));
set(handles.uitable1,'Data',gofMat_table);

function pushbutton1_Callback(hObject, eventdata, handles)

function pushbutton12_Callback(hObject, eventdata, handles)
selected_equation=get(get(handles.uibuttongroup5,'SelectedObject'),'String');
global idx;
idx=str2num(selected_equation);
global t;global y;global eqn;global f;
f = fit(t',y',char(eqn(idx)));
axes(handles.axes1);
plot(f,t,y);

function uitable1_CellEditCallback(hObject, eventdata, handles)

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton2_Callback(hObject, eventdata, handles)

function text4_CreateFcn(hObject, eventdata, handles)

function edit4_Callback(hObject, eventdata, handles)

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)

function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton4_Callback(hObject, eventdata, handles)

function edit8_Callback(hObject, eventdata, handles)

function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton8_Callback(hObject, eventdata, handles)
global Res;
global L;
global C;
global selected_circuit_type;

selected_circuit_type=get(get(handles.circuit_type,'SelectedObject'),'String');
Res=str2num(get(handles.edit8,'String'));
global f;
global idx;
[L,C] = findlc_manami(f,idx,Res,selected_circuit_type);
set(handles.R,'String',Res);
set(handles.L,'String',L);
set(handles.C,'String',C);
axes(handles.axes3);
switch selected_circuit_type
    case 'RC'
        imshow('RC.jpg');
    case 'RL'
        imshow('RL.jpg');
    case 'RLC series'
        imshow('RLC series.jpg');
    case 'RLC parallel'
        imshow('RLC parallel.jpg');
end

function uibuttongroup2_CreateFcn(hObject, eventdata, handles)

function uibuttongroup3_CreateFcn(~, eventdata, handles)

function inputsignal_Callback(hObject, eventdata, handles)

function inputsignal_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit11_Callback(hObject, eventdata, handles)

function edit11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function popupmenu6_Callback(hObject, eventdata, handles)
contents=cellstr(get(hObject,'String'));
global pop_choice;
pop_choice=contents(get(hObject,'Value'));
pop_choice=string(pop_choice);

function ok3_Callback(hObject, eventdata, handles)


function uibuttongroup4_CreateFcn(hObject, eventdata, handles)

function radiobutton16_Callback(hObject, eventdata, handles)

function radiobutton17_Callback(hObject, eventdata, handles)

function radiobutton18_Callback(hObject, eventdata, handles)

function radiobutton19_Callback(hObject, eventdata, handles)

function uibuttongroup5_CreateFcn(hObject, eventdata, handles)

function uibuttongroup5_SelectionChangedFcn(hObject, eventdata, handles)

selected_equation=get(get(handles.uibuttongroup5,'SelectedObject'),'String');
if selected_equation=='1'
    set(handles.RLCseries,'Enable','Off'); 
    set(handles.RLCparallel,'Enable','Off');
else
    set(handles.RL,'Enable','Off'); 
    set(handles.RC,'Enable','Off');
end

function circuit_type_DeleteFcn(hObject, eventdata, handles)

function circuit_type_CreateFcn(hObject, eventdata, handles)

function R_CreateFcn(hObject, eventdata, handles)



function finaltime_Callback(hObject, eventdata, handles)

function finaltime_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timeperiod_Callback(hObject, eventdata, handles)

function timeperiod_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function popupmenu6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function signaltype_SelectionChangedFcn(hObject, eventdata, handles)

function edit15_Callback(hObject, eventdata, handles)

function edit15_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton15_Callback(hObject, eventdata, handles)
var=get(get(handles.signaltype,'SelectedObject'),'String');
xt_input=get(handles.inputsignal,'String');
tf_input=str2num(get(handles.finaltime,'String'));
time_period=str2num(get(handles.timeperiod,'String'));
global pop_choice;
wanted_plot=pop_choice;
[xt,fun,tf]=define_signal_new(xt_input,tf_input,var,time_period);
global Res;
global L;
global C;
global selected_circuit_type;
picture(xt,fun,Res,L,C,selected_circuit_type,tf,wanted_plot);

function signaltype_CreateFcn(hObject, eventdata, handles)

