function varargout = UI(varargin)
% UI MATLAB code for UI.fig
%      UI, by itself, creates a new UI or raises the existing
%      singleton*.
%
%      H = UI returns the handle to a new UI or the handle to
%      the existing singleton*.
%
%      UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UI.M with the given input arguments.
%
%      UI('Property','Value',...) creates a new UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UI

% Last Modified by GUIDE v2.5 15-Oct-2013 23:45:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UI_OpeningFcn, ...
                   'gui_OutputFcn',  @UI_OutputFcn, ...
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


% --- Executes just before UI is made visible.
function UI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UI (see VARARGIN)

% Choose default command line output for UI
handles.output = hObject;

% Update handles structure

guidata(hObject, handles);

% UIWAIT makes UI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


prog_scope = {'luftdruck' 'markantes_wetter' 'niederschlag' 'sig_wetter' 'solarleistung' 'temperatur' 'wind'};

% Speichert die Popup Inhalte für Single Request Prognose Details
setappdata(handles.single_request_progscope_popup,'Wind',{'Stärke' 'Richtung' 'Gesamt' });
setappdata(handles.single_request_progscope_popup,'Temperatur',{'Max' 'Min' 'Mittlere Temp Prognose' 'Gesamt'});
setappdata(handles.single_request_progscope_popup,'Solarleistung',{'Dauer' 'Einstrahlung' 'Gesamt'});
setappdata(handles.single_request_progscope_popup,'Luftdruck',{'keine Details verfügbar'});
setappdata(handles.single_request_progscope_popup,'Signifikantes_Wetter',{'keine Details verfügbar'});
setappdata(handles.single_request_progscope_popup,'Niederschlag',{'Menge' 'Wahrscheinlichkeit' 'Gesamt'});
setappdata(handles.single_request_progscope_popup,'Markantes_Wetter',{'Bodennebel' 'Gefrierender Nebel' 'Bodenfrost' 'Böen' 'Niederschlag' 'Hitze' 'Kälte' 'Gesamt'});

setappdata(handles.single_request_progday_popup,'erste_Auspraegung',{'Heute' '1. Folgetag' 'Gesamt'});
setappdata(handles.single_request_progday_popup,'zweite_Auspraegung',{'Heute' '1. Folgetag' '2. Folgetag' '3. Folgetag' 'Gesamt'});

setappdata(handles.single_request_proghour_popup,'Abfragezeitpunkt',{'Morgen' 'Vormittag' 'Nachmittag' 'Abend' 'Gesamt'});

h = gcf;

prog_day = {'heute' 'erster_folgetag' 'zweiter_folgetag' 'dritter_folgetag'};
prog_hour = {'morgen' 'vormittag' 'nachmittag' 'abend'};

guidata(hObject,handles);

set(handles.com_set_panel,'Visible','off');
set(handles.dataexp_set_panel,'Visible','off');
set(handles.single_request_panel,'Visible','off');
set(handles.multi_request_panel,'Visible','off');
set(handles.com_protocol_panel,'Visible','off');

set(handles.single_request_proghour_popup,'String',{'Morgen' 'Vormittag' 'Nachmittag' 'Abend' 'Gesamt'});
set(handles.multi_request_proghour_popup,'String',{'Morgen' 'Vormittag' 'Nachmittag' 'Abend' 'Gesamt'});

set(h,'DockControls','on');


% --- Outputs from this function are returned to the command line.
function varargout = UI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function menu_status_Callback(hObject, eventdata, handles)
% hObject    handle to menu_status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.com_set_panel,'Visible','off');
set(handles.dataexp_set_panel,'Visible','off');
set(handles.single_request_panel,'Visible','off');
set(handles.multi_request_panel,'Visible','off');
set(handles.com_protocol_panel,'Visible','on');

% --------------------------------------------------------------------
function menu_data_request_Callback(hObject, eventdata, handles)
% hObject    handle to menu_data_request (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function submenu_single_data_request_Callback(hObject, eventdata, handles)
% hObject    handle to submenu_single_data_request (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.com_set_panel,'Visible','off');
set(handles.dataexp_set_panel,'Visible','off');
set(handles.single_request_panel,'Visible','on');
set(handles.multi_request_panel,'Visible','off');
set(handles.com_protocol_panel,'Visible','off');

% --------------------------------------------------------------------
function submenu_multi_data_request_Callback(hObject, eventdata, handles)
% hObject    handle to submenu_multi_data_request (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.com_set_panel,'Visible','off');
set(handles.dataexp_set_panel,'Visible','off');
set(handles.single_request_panel,'Visible','off');
set(handles.multi_request_panel,'Visible','on');
set(handles.com_protocol_panel,'Visible','off');

% --------------------------------------------------------------------
function menu_protocol_config_Callback(hObject, eventdata, handles)
% hObject    handle to menu_protocol_config (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.com_set_panel,'Visible','on');
set(handles.dataexp_set_panel,'Visible','off');
set(handles.single_request_panel,'Visible','off');
set(handles.multi_request_panel,'Visible','off');
set(handles.com_protocol_panel,'Visible','off');

% --------------------------------------------------------------------
function menu_data_export_Callback(hObject, eventdata, handles)
% hObject    handle to menu_data_export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% openfig('Settings.fig')
set(handles.com_set_panel,'Visible','off');
set(handles.dataexp_set_panel,'Visible','on');
set(handles.single_request_panel,'Visible','off');
set(handles.multi_request_panel,'Visible','off');
set(handles.com_protocol_panel,'Visible','off');

% --------------------------------------------------------------------
function menu_protocol_config_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to menu_protocol_config (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function menu_data_export_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to menu_data_export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dataexp_select_data_storage_folder_button.
function dataexp_select_data_storage_folder_button_Callback(hObject, eventdata, handles)
% hObject    handle to dataexp_select_data_storage_folder_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
single_data_pathname = uigetdir;
set(handles.dataexp_show_data_storage_path_edit,'String',single_data_pathname);
single_data_pathname = get(handles.dataexp_show_data_storage_path_edit,'string');

function comset_com_adress_edit_Callback(hObject, eventdata, handles)
% hObject    handle to comset_com_adress_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comset_com_adress_edit as text
%        str2double(get(hObject,'String')) returns contents of comset_com_adress_edit as a double


% --- Executes during object creation, after setting all properties.
function comset_com_adress_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_com_adress_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function comset_data_edit_Callback(hObject, eventdata, handles)
% hObject    handle to comset_data_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comset_data_edit as text
%        str2double(get(hObject,'String')) returns contents of comset_data_edit as a double


% --- Executes during object creation, after setting all properties.
function comset_data_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_data_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comset_station_edit_Callback(hObject, eventdata, handles)
% hObject    handle to comset_station_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comset_station_edit as text
%        str2double(get(hObject,'String')) returns contents of comset_station_edit as a double


% --- Executes during object creation, after setting all properties.
function comset_station_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_station_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comset_stop_edit_Callback(hObject, eventdata, handles)
% hObject    handle to comset_stop_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comset_stop_edit as text
%        str2double(get(hObject,'String')) returns contents of comset_stop_edit as a double


% --- Executes during object creation, after setting all properties.
function comset_stop_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_stop_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comset_city_id_edit_Callback(hObject, eventdata, handles)
% hObject    handle to comset_city_id_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comset_city_id_edit as text
%        str2double(get(hObject,'String')) returns contents of comset_city_id_edit as a double


% --- Executes during object creation, after setting all properties.
function comset_city_id_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_city_id_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in close_serial_port.
function close_serial_port_Callback(hObject, eventdata, handles)
% hObject    handle to close_serial_port (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in open_serial_port.
function open_serial_port_Callback(hObject, eventdata, handles)
% hObject    handle to open_serial_port (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in comset_baudrate_popup.
function comset_baudrate_popup_Callback(hObject, eventdata, handles)
% hObject    handle to comset_baudrate_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns comset_baudrate_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from comset_baudrate_popup


% --- Executes during object creation, after setting all properties.
function comset_baudrate_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_baudrate_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in comset_parity_popup.
function comset_parity_popup_Callback(hObject, eventdata, handles)
% hObject    handle to comset_parity_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns comset_parity_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from comset_parity_popup


% --- Executes during object creation, after setting all properties.
function comset_parity_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_parity_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in single_request_progscope_popup.
function single_request_progscope_popup_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_progscope_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns single_request_progscope_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from single_request_progscope_popup
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string_prog_scope = string_list{val};
switch selected_string_prog_scope
    case 'Luftdruck'
        Ld = getappdata(handles.single_request_progscope_popup,'Luftdruck');
        set(handles.single_request_progdetail_popup,'String',Ld);
        Ld_day = getappdata(handles.single_request_progday_popup,'erste_Auspraegung');
        set(handles.single_request_progday_popup,'String',Ld_day);
    case 'Markantes Wetter'
        mW = getappdata(handles.single_request_progscope_popup,'Markantes_Wetter');
        set(handles.single_request_progdetail_popup,'String',mW);
        mW_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.single_request_progday_popup,'String',mW_day);
    case 'Niederschlag'
        niederschlag = getappdata(handles.single_request_progscope_popup,'Niederschlag');
        set(handles.single_request_progdetail_popup,'String',niederschlag);
        niederschlag_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.single_request_progday_popup,'String',niederschlag_day);
    case 'Signifikantes Wetter'
        sW = getappdata(handles.single_request_progscope_popup,'Signifikantes_Wetter');
        set(handles.single_request_progdetail_popup,'String',sW);
        sW_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.single_request_progday_popup,'String',sW_day);
    case 'Solarleistung'
        solarP = getappdata(handles.single_request_progscope_popup,'Solarleistung');
        set(handles.single_request_progdetail_popup,'String',solarP);
        solarP_day = getappdata(handles.single_request_progday_popup,'erste_Auspraegung');
        set(handles.single_request_progday_popup,'String',solarP_day);
    case 'Temperatur'
        tmp = getappdata(handles.single_request_progscope_popup,'Temperatur');
        set(handles.single_request_progdetail_popup,'String',tmp);
        tmp_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.single_request_progday_popup,'String',tmp_day);
    case 'Wind'
        wind = getappdata(handles.single_request_progscope_popup,'Wind');
        set(handles.single_request_progdetail_popup,'String',wind);
        wind_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.single_request_progday_popup,'String',wind_day);
    otherwise
end

% --- Executes during object creation, after setting all properties.
function single_request_progscope_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_request_progscope_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in single_request_progdetail_popup.
function single_request_progdetail_popup_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_progdetail_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns single_request_progdetail_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from single_request_progdetail_popup


% --- Executes during object creation, after setting all properties.
function single_request_progdetail_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_request_progdetail_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in single_request_progday_popup.
function single_request_progday_popup_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_progday_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns single_request_progday_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from single_request_progday_popup


% --- Executes during object creation, after setting all properties.
function single_request_progday_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_request_progday_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in single_request_proghour_popup.
function single_request_proghour_popup_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_proghour_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns single_request_proghour_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from single_request_proghour_popup


% --- Executes during object creation, after setting all properties.
function single_request_proghour_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_request_proghour_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function single_request_msg_edit_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_msg_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of single_request_msg_edit as text
%        str2double(get(hObject,'String')) returns contents of single_request_msg_edit as a double


% --- Executes during object creation, after setting all properties.
function single_request_msg_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_request_msg_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in single_request_send_button.
function single_request_send_button_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_send_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function auto_einzel_abruf_Callback(hObject, eventdata, handles)
% hObject    handle to auto_einzel_abruf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function auto_sammel_abruf_Callback(hObject, eventdata, handles)
% hObject    handle to auto_sammel_abruf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in multi_request_progscope_popup.
function multi_request_progscope_popup_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_progscope_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multi_request_progscope_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multi_request_progscope_popup
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string_prog_scope = string_list{val};
switch selected_string_prog_scope
    case 'Luftdruck'
        Ld = getappdata(handles.single_request_progscope_popup,'Luftdruck');
        set(handles.multi_request_progdetail_popup,'String',Ld);
        Ld_day = getappdata(handles.single_request_progday_popup,'erste_Auspraegung');
        set(handles.multi_request_progday_popup,'String',Ld_day);
    case 'Markantes Wetter'
        mW = getappdata(handles.single_request_progscope_popup,'Markantes_Wetter');
        set(handles.multi_request_progdetail_popup,'String',mW);
        mW_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.multi_request_progday_popup,'String',mW_day);
    case 'Niederschlag'
        niederschlag = getappdata(handles.single_request_progscope_popup,'Niederschlag');
        set(handles.multi_request_progdetail_popup,'String',niederschlag);
        niederschlag_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.multi_request_progday_popup,'String',niederschlag_day);
    case 'Signifikantes Wetter'
        sW = getappdata(handles.single_request_progscope_popup,'Signifikantes_Wetter');
        set(handles.multi_request_progdetail_popup,'String',sW);
        sW_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.multi_request_progday_popup,'String',sW_day);
    case 'Solarleistung'
        solarP = getappdata(handles.single_request_progscope_popup,'Solarleistung');
        set(handles.multi_request_progdetail_popup,'String',solarP);
        solarP_day = getappdata(handles.single_request_progday_popup,'erste_Auspraegung');
        set(handles.multi_request_progday_popup,'String',solarP_day);
    case 'Temperatur'
        tmp = getappdata(handles.single_request_progscope_popup,'Temperatur');
        set(handles.multi_request_progdetail_popup,'String',tmp);
        tmp_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.multi_request_progday_popup,'String',tmp_day);
    case 'Wind'
        wind = getappdata(handles.single_request_progscope_popup,'Wind');
        set(handles.multi_request_progdetail_popup,'String',wind);
        wind_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.multi_request_progday_popup,'String',wind_day);
    otherwise
end

% --- Executes during object creation, after setting all properties.
function multi_request_progscope_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_progscope_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in multi_request_progdetail_popup.
function multi_request_progdetail_popup_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_progdetail_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multi_request_progdetail_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multi_request_progdetail_popup


% --- Executes during object creation, after setting all properties.
function multi_request_progdetail_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_progdetail_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in multi_request_progday_popup.
function multi_request_progday_popup_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_progday_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multi_request_progday_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multi_request_progday_popup


% --- Executes during object creation, after setting all properties.
function multi_request_progday_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_progday_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in multi_request_proghour_popup.
function multi_request_proghour_popup_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_proghour_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multi_request_proghour_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multi_request_proghour_popup


% --- Executes during object creation, after setting all properties.
function multi_request_proghour_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_proghour_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function multi_request_msg_edit_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of multi_request_msg_edit as text
%        str2double(get(hObject,'String')) returns contents of multi_request_msg_edit as a double


% --- Executes during object creation, after setting all properties.
function multi_request_msg_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in multi_request_msg_sendbutton.
function multi_request_msg_sendbutton_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_sendbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in multi_request_updateint_popup.
function multi_request_updateint_popup_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_updateint_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multi_request_updateint_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multi_request_updateint_popup


% --- Executes during object creation, after setting all properties.
function multi_request_updateint_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_updateint_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in multi_request_update_checkbox.
function multi_request_update_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_update_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of multi_request_update_checkbox


% --- Executes on button press in multi_request_msg_add_button.
function multi_request_msg_add_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_add_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in multi_request_msg_remove_button.
function multi_request_msg_remove_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_remove_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in multi_request_msg_removeall_button.
function multi_request_msg_removeall_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_removeall_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in multi_request_msg_savelist_button.
function multi_request_msg_savelist_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_savelist_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in multi_request_msg_loadlist_button.
function multi_request_msg_loadlist_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_loadlist_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in single_request_updateint_popup.
function single_request_updateint_popup_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_updateint_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns single_request_updateint_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from single_request_updateint_popup


% --- Executes during object creation, after setting all properties.
function single_request_updateint_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_request_updateint_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in single_request_progupdate_checkbox.
function single_request_progupdate_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_progupdate_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of single_request_progupdate_checkbox



function dataexp_show_data_storage_path_edit_Callback(hObject, eventdata, handles)
% hObject    handle to dataexp_show_data_storage_path_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dataexp_show_data_storage_path_edit as text
%        str2double(get(hObject,'String')) returns contents of dataexp_show_data_storage_path_edit as a double


% --- Executes during object creation, after setting all properties.
function dataexp_show_data_storage_path_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataexp_show_data_storage_path_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in dataexp_select_protocol_storage_folder_button.
function dataexp_select_protocol_storage_folder_button_Callback(hObject, eventdata, handles)
% hObject    handle to dataexp_select_protocol_storage_folder_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
protocol_pathname = uigetdir;
set(handles.dataexp_show_protocol_storage_path_edit,'String',protocol_pathname);
protocol_pathname = get(handles.dataexp_show_protocol_storage_path_edit,'String');

function dataexp_show_protocol_storage_path_edit_Callback(hObject, eventdata, handles)
% hObject    handle to text_protocol_storage_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_protocol_storage_path as text
%        str2double(get(hObject,'String')) returns contents of text_protocol_storage_path as a double


% --- Executes during object creation, after setting all properties.
function text_protocol_storage_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_protocol_storage_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in dataexp_select_cumdata_storage_folder_button.
function dataexp_select_cumdata_storage_folder_button_Callback(hObject, eventdata, handles)
% hObject    handle to dataexp_select_cumdata_storage_folder_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
multi_data_pathname = uigetdir;
set(handles.dataexp_show_cumdata_storage_path_edit,'String',multi_data_pathname);
multi_data_pathname = get(handles.dataexp_show_cumdata_storage_path_edit,'String');


function dataexp_show_cumdata_storage_path_edit_Callback(hObject, eventdata, handles)
% hObject    handle to dataexp_show_cumdata_storage_path_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dataexp_show_cumdata_storage_path_edit as text
%        str2double(get(hObject,'String')) returns contents of dataexp_show_cumdata_storage_path_edit as a double


% --- Executes during object creation, after setting all properties.
function dataexp_show_cumdata_storage_path_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataexp_show_cumdata_storage_path_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function dataexp_show_protocol_storage_path_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataexp_show_protocol_storage_path_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in dataexp_save_storage_path_settings_button.
function dataexp_save_storage_path_settings_button_Callback(hObject, eventdata, handles)
% hObject    handle to dataexp_save_storage_path_settings_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
