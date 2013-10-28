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

% Last Modified by GUIDE v2.5 27-Oct-2013 13:46:45

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

% Speichert die Popup Inhalte für Single Request Prognose Details
setappdata(handles.single_request_progscope_popup,'Wind',{'' 'Staerke' 'Richtung' 'Gesamt' });
setappdata(handles.single_request_progscope_popup,'Temperatur',{'' 'Max' 'Min' 'Mittlere_Temp_Prognose' 'Gesamt'});
setappdata(handles.single_request_progscope_popup,'Solarleistung',{'' 'Dauer' 'Einstrahlung' 'Gesamt'});
setappdata(handles.single_request_progscope_popup,'Luftdruck',{'keine Details verfügbar'});
setappdata(handles.single_request_progscope_popup,'Signifikantes_Wetter',{'keine Details verfügbar'});
setappdata(handles.single_request_progscope_popup,'Niederschlag',{'' 'Menge' 'Wahrscheinlichkeit' 'Gesamt'});
setappdata(handles.single_request_progscope_popup,'Markantes_Wetter',{'' 'Bodennebel' 'Gefrierender_Nebel' 'Bodenfrost' 'Boeen' 'Niederschlag' 'Hitze' 'Kaelte' 'Gesamt'});

setappdata(handles.single_request_progday_popup,'erste_Auspraegung',{'' 'Heute' 'Erster_Folgetag' 'Gesamt'});
setappdata(handles.single_request_progday_popup,'zweite_Auspraegung',{'' 'Heute' 'Erster_Folgetag' 'Zweiter_Folgetag' 'Dritter_Folgetag' 'Gesamt'});

%Alle Panels zu Beginn unsichtbar machen
set(handles.com_set_panel,'Visible','off');
set(handles.dataexp_set_panel,'Visible','off');
set(handles.single_request_panel,'Visible','off');
set(handles.multi_request_panel,'Visible','off');
set(handles.com_protocol_panel,'Visible','off');

%Popupmenüeinträge für Prognosestundenangaben
set(handles.single_request_proghour_popup,'String',{'' 'Morgen' 'Vormittag' 'Nachmittag' 'Abend' 'Gesamt'});
set(handles.multi_request_from_proghour_popup,'String',{'' 'Morgen' 'Vormittag' 'Nachmittag' 'Abend' 'Gesamt'});
set(handles.multi_request_to_proghour_popup,'String',{'' 'Morgen' 'Vormittag' 'Nachmittag' 'Abend' 'Gesamt'});

%Popupmenüeinträge für Com-Settings
set(handles.comset_parity_popup,'String',{'' 'none' 'even' 'odd' 'mark' 'space'});
set(handles.comset_baudrate_popup,'String',{'' '9600' '19200'});

%Benennung der Tabellenspalten auf dem Panel Sammelanfrage
set(handles.multi_request_msg_table,'ColumnName',{'Prognosebereich', 'Prognosedetail', 'Prognosestart', 'Prognoseende', 'Modbus Nachricht', 'Abrufen'});

%Initialisiere Protocol Liste
header = sprintf('%s %s','Communication protocol: ',datestr(now));
set(handles.com_protocol_listbox,'String',header);

guidata(hObject, handles);
drawnow;

h = gcf;
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
    case 'Markantes_Wetter'
        mW = getappdata(handles.single_request_progscope_popup,'Markantes_Wetter');
        set(handles.single_request_progdetail_popup,'String',mW);
        mW_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.single_request_progday_popup,'String',mW_day);
    case 'Niederschlag'
        niederschlag = getappdata(handles.single_request_progscope_popup,'Niederschlag');
        set(handles.single_request_progdetail_popup,'String',niederschlag);
        niederschlag_day = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
        set(handles.single_request_progday_popup,'String',niederschlag_day);
    case 'Signifikantes_Wetter'
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
setappdata(handles.multi_request_progscope_popup,'sel_progscope',selected_string_prog_scope);
erste_A = getappdata(handles.single_request_progday_popup,'erste_Auspraegung');
zweite_A = getappdata(handles.single_request_progday_popup,'zweite_Auspraegung');
switch selected_string_prog_scope
    case 'Luftdruck'
        Ld = getappdata(handles.single_request_progscope_popup,'Luftdruck');
        set(handles.multi_request_progdetail_popup,'String',Ld);
        set(handles.multi_request_from_progday_popup,'String',erste_A);
        set(handles.multi_request_to_progday_popup,'String',erste_A);
    case 'Markantes_Wetter'
        mW = getappdata(handles.single_request_progscope_popup,'Markantes_Wetter');
        set(handles.multi_request_progdetail_popup,'String',mW);
        set(handles.multi_request_from_progday_popup,'String',zweite_A);
        set(handles.multi_request_to_progday_popup,'String',zweite_A);
    case 'Niederschlag'
        niederschlag = getappdata(handles.single_request_progscope_popup,'Niederschlag');
        set(handles.multi_request_progdetail_popup,'String',niederschlag);
        set(handles.multi_request_from_progday_popup,'String',zweite_A);
        set(handles.multi_request_to_progday_popup,'String',zweite_A);
    case 'Signifikantes_Wetter'
        sW = getappdata(handles.single_request_progscope_popup,'Signifikantes_Wetter');
        set(handles.multi_request_progdetail_popup,'String',sW);
        set(handles.multi_request_from_progday_popup,'String',zweite_A);
        set(handles.multi_request_to_progday_popup,'String',zweite_A);
    case 'Solarleistung'
        solarP = getappdata(handles.single_request_progscope_popup,'Solarleistung');
        set(handles.multi_request_progdetail_popup,'String',solarP);
        set(handles.multi_request_from_progday_popup,'String',erste_A);
        set(handles.multi_request_to_progday_popup,'String',erste_A);
    case 'Temperatur'
        tmp = getappdata(handles.single_request_progscope_popup,'Temperatur');
        set(handles.multi_request_progdetail_popup,'String',tmp);
        set(handles.multi_request_from_progday_popup,'String',zweite_A);
        set(handles.multi_request_to_progday_popup,'String',zweite_A);
    case 'Wind'
        wind = getappdata(handles.single_request_progscope_popup,'Wind');
        set(handles.multi_request_progdetail_popup,'String',wind);
        set(handles.multi_request_from_progday_popup,'String',zweite_A);
        set(handles.multi_request_to_progday_popup,'String',zweite_A);
    otherwise
end
guidata(hObject, handles);
drawnow;


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
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string_progdetail = string_list{val};
setappdata(handles.multi_request_progdetail_popup,'sel_progdetail',selected_string_progdetail);

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


% --- Executes on selection change in multi_request_from_progday_popup.
function multi_request_from_progday_popup_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_from_progday_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multi_request_from_progday_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multi_request_from_progday_popup
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string_from_progday = string_list{val};
setappdata(handles.multi_request_from_progday_popup,'sel_from_progday',selected_string_from_progday);


% --- Executes during object creation, after setting all properties.
function multi_request_from_progday_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_from_progday_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in multi_request_from_proghour_popup.
function multi_request_from_proghour_popup_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_from_proghour_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multi_request_from_proghour_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multi_request_from_proghour_popup
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string_from_proghour = string_list{val};
setappdata(handles.multi_request_from_proghour_popup,'sel_from_proghour',selected_string_from_proghour);


% --- Executes during object creation, after setting all properties.
function multi_request_from_proghour_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_from_proghour_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in multi_request_to_proghour_popup.
function multi_request_to_proghour_popup_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_to_proghour_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multi_request_to_proghour_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multi_request_to_proghour_popup
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string_to_proghour = string_list{val};
setappdata(handles.multi_request_to_proghour_popup,'sel_to_proghour',selected_string_to_proghour);


% --- Executes during object creation, after setting all properties.
function multi_request_to_proghour_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_to_proghour_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in multi_request_to_progday_popup.
function multi_request_to_progday_popup_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_to_progday_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multi_request_to_progday_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multi_request_to_progday_popup
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_string_to_progday = string_list{val};
setappdata(handles.multi_request_to_progday_popup,'sel_to_progday',selected_string_to_progday);


% --- Executes during object creation, after setting all properties.
function multi_request_to_progday_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multi_request_to_progday_popup (see GCBO)
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
table_data = get(handles.multi_request_msg_table, 'Data');
add_table_data = getappdata(handles.multi_request_gen_msg_button,'table_data');
if isempty(table_data) == 1
    set(handles.multi_request_msg_table,'Data',add_table_data);
else
    if isempty(table_data{1}) == 1 
        set(handles.multi_request_msg_table,'Data',add_table_data);
    else
        table_data = [table_data; add_table_data];
        set(handles.multi_request_msg_table,'Data',table_data);
    end
end
set(handles.multi_request_msg_table,'ColumnWidth',{100 100 150 150 110 80});
drawnow;

% --- Executes on button press in multi_request_msg_remove_button.
function multi_request_msg_remove_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_remove_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selected_row = getappdata(handles.multi_request_msg_table,'SelRow');
table_data = get(handles.multi_request_msg_table, 'Data');
table_data(selected_row,:)=[];
set(handles.multi_request_msg_table,'Data',table_data);
drawnow;


% --- Executes on button press in multi_request_msg_removeall_button.
function multi_request_msg_removeall_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_removeall_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
table_data = get(handles.multi_request_msg_table, 'Data');
table_data(:,:)=[];
set(handles.multi_request_msg_table,'Data',table_data);
drawnow;


% --- Executes on button press in multi_request_msg_savelist_button.
function multi_request_msg_savelist_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_savelist_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,path] = uiputfile('*.mat');
table_data = get(handles.multi_request_msg_table,'Data');
save(strcat(path,filename),'table_data');
% export(dataset,'file',strcat(path,filename));

% --- Executes on button press in multi_request_msg_loadlist_button.
function multi_request_msg_loadlist_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_loadlist_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,path]  = uigetfile('*.mat');
load(strcat(path,filename));
set(handles.multi_request_msg_table,'Data',table_data);

% --- Executes on button press in multi_request_msg_sendbutton.
function multi_request_msg_sendbutton_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_sendbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
table_data = get(handles.multi_request_msg_table,'Data');
t = size(table_data,1);
for r = 1:t
    msg = table_data{r,5};
    [ txdata ] = send_modbus_msg( msg );
end

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


% --- Executes on button press in multi_request_gen_msg_button.
function multi_request_gen_msg_button_Callback(hObject, eventdata, handles)
% hObject    handle to multi_request_gen_msg_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Popup Auswahl ermitteln
prog_scope = getappdata(handles.multi_request_progscope_popup,'sel_progscope');
prog_detail = getappdata(handles.multi_request_progdetail_popup,'sel_progdetail');
prog_day_from = getappdata(handles.multi_request_from_progday_popup,'sel_from_progday');
prog_hour_from = getappdata(handles.multi_request_from_proghour_popup,'sel_from_proghour');
prog_day_to = getappdata(handles.multi_request_to_progday_popup,'sel_to_progday');
prog_hour_to = getappdata(handles.multi_request_to_proghour_popup,'sel_to_proghour');

% Argumente bündeln
popup_scope_detail = {prog_scope, prog_detail};
popup_from = {prog_day_from, prog_hour_from};
popup_to = {prog_day_to, prog_hour_to};


% Registeraddressen ermitteln
start_reg_address = get_reg_address(popup_scope_detail, popup_from);
end_reg_address = get_reg_address(popup_scope_detail, popup_to);

device_address = dec2hex(str2num(get(handles.comset_device_id_edit,'String')),2);
setappdata(handles.comset_device_id_edit,'dev_address',device_address);

func_code = dec2hex(3,2);

% Überprüfung ob Intervall-Werte richtig ausgewählt wurden
[quantity_reg_addresses] = input_check(start_reg_address, end_reg_address, func_code, device_address);

% Modbus Nachricht zusammensetzen
modbus_msg = strcat(device_address,func_code,start_reg_address,quantity_reg_addresses);
set(handles.multi_request_msg_edit,'String',modbus_msg);

% CRC Summe berechnen und komplette Nachricht ausgeben
[modbus_msg_crc] = crc_calc(modbus_msg);
setappdata(handles.multi_request_msg_edit,'modbus_msg_crc',modbus_msg_crc);
table_data = {popup_scope_detail{1}, popup_scope_detail{2}, strcat(popup_from{1},'-',popup_from{2}), strcat(popup_to{1},'-',popup_to{2}), modbus_msg_crc, true}; 
setappdata(handles.multi_request_gen_msg_button,'table_data',table_data);
drawnow;

% --- Executes when selected cell(s) is changed in multi_request_msg_table.
function multi_request_msg_table_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to multi_request_msg_table (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
selected_cells = eventdata.Indices;
setappdata(handles.multi_request_msg_table,'SelRow',selected_cells(1));


function comset_device_id_edit_Callback(hObject, eventdata, handles)
% hObject    handle to comset_device_id_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comset_device_id_edit as text
%        str2double(get(hObject,'String')) returns contents of comset_device_id_edit as a double


% --- Executes during object creation, after setting all properties.
function comset_device_id_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_device_id_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in comset_baudrate_popup.
function comset_baudrate_popup_Callback(hObject, eventdata, handles)
% hObject    handle to comset_baudrate_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns comset_baudrate_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from comset_baudrate_popup
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_baudrate = string_list{val};
setappdata(handles.comset_baudrate_popup,'sel_baudrate',selected_baudrate);

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
val = get(hObject,'Value');
string_list = get(hObject,'String');
selected_parity = string_list{val};
setappdata(handles.comset_parity_popup,'sel_parity',selected_parity);

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

% --- Executes on button press in comset_close_serial_port.
function comset_close_serial_port_Callback(hObject, eventdata, handles)
% hObject    handle to comset_close_serial_port (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
serial_interface = evalin('base','serial_interface');
close_serial_port( serial_interface );
set(handles.comset_connection_status,'BackgroundColor',[1 0 0]);
set(handles.comset_connection_status,'String','Nicht verbunden');

% --- Executes on button press in comset_open_serial_port.
function comset_open_serial_port_Callback(hObject, eventdata, handles)
% hObject    handle to comset_open_serial_port (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
baudrate = str2double(getappdata(handles.comset_baudrate_popup,'sel_baudrate'));
parity = getappdata(handles.comset_parity_popup,'sel_parity');
comport = strcat('COM',get(handles.comset_com_adress_edit,'String'));
stopbit = str2double(get(handles.comset_stop_edit,'String'));
databit = str2double(get(handles.comset_data_edit,'String'));

open_serial_port( comport, baudrate, databit, parity, stopbit );
set(handles.comset_connection_status,'BackgroundColor',[0 1 0]);
set(handles.comset_connection_status,'String','Verbunden');


function single_request_response_edit_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of single_request_response_edit as text
%        str2double(get(hObject,'String')) returns contents of single_request_response_edit as a double


% --- Executes during object creation, after setting all properties.
function single_request_response_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_request_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in single_request_add_response_button.
function single_request_add_response_button_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_add_response_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in single_request_remove_response.
function single_request_remove_response_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_remove_response (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in single_request_save_response.
function single_request_save_response_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_save_response (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in single_request_remove_all_responses.
function single_request_remove_all_responses_Callback(hObject, eventdata, handles)
% hObject    handle to single_request_remove_all_responses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function comset_temp_offset_edit_Callback(hObject, eventdata, handles)
% hObject    handle to comset_temp_offset_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comset_temp_offset_edit as text
%        str2double(get(hObject,'String')) returns contents of comset_temp_offset_edit as a double


% --- Executes during object creation, after setting all properties.
function comset_temp_offset_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_temp_offset_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function comset_utc_offset_edit_Callback(hObject, eventdata, handles)
% hObject    handle to comset_utc_offset_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comset_utc_offset_edit as text
%        str2double(get(hObject,'String')) returns contents of comset_utc_offset_edit as a double


% --- Executes during object creation, after setting all properties.
function comset_utc_offset_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comset_utc_offset_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in comset_settings_button.
function comset_settings_button_Callback(hObject, eventdata, handles)
% hObject    handle to comset_settings_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
station = dec2hex(str2double(get(handles.comset_station_edit,'String')),4);
city_id = dec2hex(str2double(get(handles.comset_city_id_edit,'String')),4);
temp_offset = dec2hex(str2double(get(handles.comset_temp_offset_edit,'String')),4);
utc_offset = str2double(get(handles.comset_utc_offset_edit,'String'));
device_id = dec2hex(str2double(get(handles.comset_device_id_edit,'String')),2);
send_settings(station,city_id,temp_offset,device_id);

% --- Executes on button press in comset_reset_button.
function comset_reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to comset_reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.comset_station_edit,'String','1');
set(handles.comset_city_id_edit,'String','353');
set(handles.comset_temp_offset_edit,'String','0');
set(handles.comset_utc_offset_edit,'String','0');
set(handles.comset_device_id_edit,'String','03');
station = str2double(get(handles.comset_station_edit,'String'));
city_id = str2double(get(handles.comset_city_id_edit,'String'));
temp_offset = str2double(get(handles.comset_temp_offset_edit,'String'));
utc_offset = str2double(get(handles.comset_utc_offset_edit,'String'));
device_id = str2double(get(handles.comset_device_id_edit,'String'));

% --- Executes on selection change in com_protocol_listbox.
function com_protocol_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to com_protocol_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns com_protocol_listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from com_protocol_listbox


% --- Executes during object creation, after setting all properties.
function com_protocol_listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to com_protocol_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in com_protocol_clear_list_button.
function com_protocol_clear_list_button_Callback(hObject, eventdata, handles)
% hObject    handle to com_protocol_clear_list_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
header = sprintf('%s %s','Communication protocol: ',datestr(now));
set(handles.com_protocol_listbox,'String',header);

% --- Executes on button press in comset_disp_act_values_button.
function comset_disp_act_values_button_Callback(hObject, eventdata, handles)
% hObject    handle to comset_disp_act_values_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
device_id = get(handles.comset_device_id_text,'String');
regadd_temp_offset = get_reg_address('temperature_offset');
regadd_city_id = get_reg_address('city_id');
regadd_transm_stat = get_reg_address('transmitting_station');

temp_offset_msg = crc_calc(build_regread_modbus_msg(device_id, regadd_temp_offset,'0001'));
city_id_msg = crc_calc(build_regread_modbus_msg(device_id, regadd_city_id,'0001'));
transm_stat_msg = crc_calc(build_regread_modbus_msg(device_id, regadd_transm_stat,'0001'));

temp_offset_value = send_and_receive_data(temp_offset_msg, hObject, handles);
city_id_value = send_and_receive_data(city_id_msg);
transm_stat_value = send_and_receive_data(transm_stat_msg);

