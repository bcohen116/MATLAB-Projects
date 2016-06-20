function varargout = Lab6(varargin)
% LAB6 MATLAB code for Lab6.fig
%      LAB6, by itself, creates a new LAB6 or raises the existing
%      singleton*.
%
%      H = LAB6 returns the handle to a new LAB6 or the handle to
%      the existing singleton*.
%
%      LAB6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB6.M with the given input arguments.
%
%      LAB6('Property','Value',...) creates a new LAB6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Lab6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Lab6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Lab6

% Last Modified by GUIDE v2.5 17-Mar-2016 08:56:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Lab6_OpeningFcn, ...
                   'gui_OutputFcn',  @Lab6_OutputFcn, ...
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


% --- Executes just before Lab6 is made visible.
function Lab6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Lab6 (see VARARGIN)

% Choose default command line output for Lab6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Lab6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Lab6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in UnitMenu.
function UnitMenu_Callback(hObject, eventdata, handles)
% hObject    handle to UnitMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns UnitMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from UnitMenu
if get(handles.UnitMenu,'Value') == 1
    set(handles.Unit1,'String','Miles');
    set(handles.Unit2,'String','Kilometers');
    set(handles.TextBox1,'String','');
    set(handles.TextBox2,'String','');
else
    set(handles.Unit1,'String','Celcius');
    set(handles.Unit2,'String','Farenheit');
    set(handles.TextBox1,'String','');
    set(handles.TextBox2,'String','');
end

% --- Executes during object creation, after setting all properties.
function UnitMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UnitMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on clearbutton press in ClearButton.
function ClearButton_Callback(hObject, eventdata, handles)
% hObject    handle to ClearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.ClearButton,'Value') == 1
    set(handles.TextBox1,'String','');
    set(handles.TextBox2,'String','');
end


function TextBox1_Callback(hObject, eventdata, handles)
% hObject    handle to TextBox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TextBox1 as text
%        str2double(get(hObject,'String')) returns contents of TextBox1 as a double
dTextBox1 = str2double(get(handles.TextBox1,'String'));
if get(handles.UnitMenu,'Value') == 1
    dTextBox1 = dTextBox1 * 1.609;
    set(handles.TextBox2,'String',dTextBox1);
else
    dTextBox1 = dTextBox1 * 1.8 + 32;
    set(handles.TextBox2,'String',dTextBox1);
end
if strcmp(get(handles.TextBox2,'String'),'NaN') == 1
    msgbox('You did not type in a #!');
    set(handles.TextBox1,'String','');
    set(handles.TextBox2,'String','');
end


% --- Executes during object creation, after setting all properties.
function TextBox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TextBox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TextBox2_Callback(hObject, eventdata, handles)
% hObject    handle to TextBox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TextBox2 as text
%        str2double(get(hObject,'String')) returns contents of TextBox2 as a double
dTextBox2 = str2double(get(handles.TextBox2,'String'));
if get(handles.UnitMenu,'Value') == 1
    dTextBox2 = dTextBox2 / 1.609;
    set(handles.TextBox1,'String',dTextBox2);
else
    dTextBox2 = (dTextBox2 - 32) / 1.8;
    set(handles.TextBox1,'String',dTextBox2);
end
if strcmp(get(handles.TextBox1,'String'),'NaN') == 1
    msgbox('You did not type in a #!');
    set(handles.TextBox1,'String','');
    set(handles.TextBox2,'String','');
end
% --- Executes during object creation, after setting all properties.
function TextBox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TextBox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
