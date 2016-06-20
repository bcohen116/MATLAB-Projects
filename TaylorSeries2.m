function varargout = TaylorSeries2(varargin)
% TAYLORSERIES2 MATLAB code for TaylorSeries2.fig
%      TAYLORSERIES2, by itself, creates a new TAYLORSERIES2 or raises the existing
%      singleton*.
%
%      H = TAYLORSERIES2 returns the handle to a new TAYLORSERIES2 or the handle to
%      the existing singleton*.
%
%      TAYLORSERIES2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAYLORSERIES2.M with the given input arguments.
%
%      TAYLORSERIES2('Property','Value',...) creates a new TAYLORSERIES2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TaylorSeries2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TaylorSeries2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TaylorSeries2

% Last Modified by GUIDE v2.5 07-Apr-2016 09:57:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TaylorSeries2_OpeningFcn, ...
                   'gui_OutputFcn',  @TaylorSeries2_OutputFcn, ...
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


% --- Executes just before TaylorSeries2 is made visible.
function TaylorSeries2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TaylorSeries2 (see VARARGIN)

% Choose default command line output for TaylorSeries2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TaylorSeries2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TaylorSeries2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

fun = get(handles.popupmenu1,'Value');
switch fun
    case 1
        axes(handles.axes1);
        x = 0;
        y = 0;
        plot(x,y);
    case 2
        x = 0:10;
        y = sin(x);
        plot(x,y,'r');axis([0 10 -10 10]);
    case 3
        x = 0:10;
        y = cos(x);
        plot(x,y,'r');axis([0 10 -3 3]);
    case 4
        x = 0:10;
        y = tan(x);
        plot(x,y,'r');axis([0 10 -10 10]);
    case 5
        x = 0:5;
        y = exp(x);
        plot(x,y,'r');axis([0 5 0 150]);
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
status = get(handles.checkbox1,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 2
        if status == 0
            hold on
            axes(handles.axes1);
            x = 0:10;
            y = x;
            plot(x,y,'white');axis([0 10 -10 10]);
            y = sin(x);
            plot(x,y,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            axes(handles.axes1);
            x = 0:10;
            y = x;
            plot(x,y,'blue');axis([0 10 -10 10]);
            hold off
        end
    case 4
        if status == 0
            hold on
            x = 0:10;
            y = x;
            plot(x,y,'white');axis([0 10 -10 10]);
            y = tan(x);
            plot(x,y,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            y = x;
            plot(x,y,'blue');axis([0 10 -10 10]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            y = 1+x;
            plot(x,y,'white');axis([0 5 0 150]);
            y = exp(x);
            plot(x,y,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            y = 1+x;
            plot(x,y,'blue');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
status = get(handles.checkbox2,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 3
        if status == 0
            hold on
            x = 0:10;
            y = 1-(x.^2)/2;
            plot(x,y,'white');axis([0 10 -3 3]);
            y = cos(x);
            plot(x,y,'r');axis([0 10 -3 3]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            y = 1-(x.^2)/2;
            plot(x,y,'cyan');axis([0 10 -3 3]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            y = 1+x+(x.^2)/2;
            plot(x,y,'white');axis([0 5 0 150]);
            y = exp(x);
            plot(x,y,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            y = 1+x+(x.^2)/2;
            plot(x,y,'cyan');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
status = get(handles.checkbox3,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 2
        if status == 0
            hold on
            axes(handles.axes1);
            x = 0:10;
            y = x-(x.^3)/6;
            plot(x,y,'white');axis([0 10 -10 10]);
            y = sin(x);
            plot(x,y,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            axes(handles.axes1);
            x = 0:10;
            y = x-(x.^3)/6;
            plot(x,y,'green');axis([0 10 -10 10]);
            hold off
        end
    case 4
        if status == 0
            hold on
            x = 0:10;
            y = x+(x.^3)/3;
            plot(x,y,'white');axis([0 10 -10 10]);
            y = tan(x);
            plot(x,y,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            y = x+(x.^3)/3;
            plot(x,y,'green');axis([0 10 -10 10]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            y = 1+x+(x.^2)/2 +(x.^3)/6;
            plot(x,y,'white');axis([0 5 0 150]);
            y = exp(x);
            plot(x,y,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            y = 1+x+(x.^2)/2 +(x.^3)/6;
            plot(x,y,'green');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
status = get(handles.checkbox4,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 3
        if status == 0
            hold on
            x = 0:10;
            y = 1-(x.^2)/2 +(x.^4)/24;
            plot(x,y,'white');axis([0 10 -3 3]);
            y = cos(x);
            plot(x,y,'r');axis([0 10 -3 3]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            y = 1-(x.^2)/2 +(x.^4)/24;
            plot(x,y,'magenta');axis([0 10 -3 3]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            y = 1+x+(x.^2)/2 +(x.^3)/6 +(x.^4)/24;
            plot(x,y,'white');axis([0 5 0 150]);
            y = exp(x);
            plot(x,y,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            y = 1+x+(x.^2)/2 +(x.^3)/6 +(x.^4)/24;
            plot(x,y,'magenta');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
status = get(handles.checkbox5,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 2
        if status == 0
            hold on
            axes(handles.axes1);
            x = 0:10;
            y = x-(x.^3)/6 +(x.^5)/120;
            plot(x,y,'white');axis([0 10 -10 10]);
            y = sin(x);
            plot(x,y,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            axes(handles.axes1);
            x = 0:10;
            y = x-(x.^3)/6 +(x.^5)/120;
            plot(x,y,'yellow');axis([0 10 -10 10]);
            hold off
        end
    case 4
        if status == 0
            hold on
            x = 0:10;
            y = x+(x.^3)/3 +(2*x.^5)/15;
            plot(x,y,'white');axis([0 10 -10 10]);
            y = tan(x);
            plot(x,y,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            y = x+(x.^3)/3 +(2*x.^5)/15;
            plot(x,y,'yellow');axis([0 10 -10 10]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            y = 1+x+(x.^2)/2 +(x.^3)/6 +(x.^4)/24 +(x.^5)/120;
            plot(x,y,'white');axis([0 5 0 150]);
            y = exp(x);
            plot(x,y,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            y = 1+x+(x.^2)/2 +(x.^3)/6 +(x.^4)/24 +(x.^5)/120;
            plot(x,y,'yellow');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end

% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
status = get(handles.togglebutton1,'Value');
        if status == 0
            set(handles.checkbox1,'Value',0);
            set(handles.checkbox2,'Value',0);
            set(handles.checkbox3,'Value',0);
            set(handles.checkbox4,'Value',0);
            set(handles.checkbox5,'Value',0);
            checkbox1_Callback(hObject, eventdata, handles)
            checkbox2_Callback(hObject, eventdata, handles)
            checkbox3_Callback(hObject, eventdata, handles)
            checkbox4_Callback(hObject, eventdata, handles)
            checkbox5_Callback(hObject, eventdata, handles)
            handles = guidata(hObject);
            guidata(hObject,handles);
        end
        if status == 1
            set(handles.checkbox1,'Value',1);
            set(handles.checkbox2,'Value',1);
            set(handles.checkbox3,'Value',1);
            set(handles.checkbox4,'Value',1);
            set(handles.checkbox5,'Value',1);
            checkbox1_Callback(hObject, eventdata, handles)
            checkbox2_Callback(hObject, eventdata, handles)
            checkbox3_Callback(hObject, eventdata, handles)
            checkbox4_Callback(hObject, eventdata, handles)
            checkbox5_Callback(hObject, eventdata, handles)
            handles = guidata(hObject);
            guidata(hObject,handles);
        end

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

fun = get(handles.popupmenu1,'Value');
switch fun
    case 1
        axes(handles.axes1);
        x = 0;
        y = 0;
        set(handles.text7,'Value',y);
        set(handles.text8,'Value',x);
        plot(x,y);
    case 2
        x = 0:10;
        y = sin(x);
        set(handles.text7,'Value',y);
        set(handles.text8,'Value',x);
        plot(x,y,'r');
    case 3
        axes(handles.axes1);
        x = 0:10;
        y = ones(length(x));
        plot(x,y,'blue'); axis([0 10 -3 3]);
  
        y = cos(x);
        set(handles.text7,'Value',y);
        set(handles.text8,'Value',x);
        plot(x,y,'r');
        hold off
    case 4
        axes(handles.axes1);
        x = 0:10;
        y = x;
        plot(x,y);
        hold on
        y = tan(x);
        set(handles.text7,'Value',y);
        set(handles.text8,'Value',x);
        plot(x,y,'r');
        hold off
    case 5
        axes(handles.axes1);
        x = 0:5;
        y = 1 + x;
        plot(x,y);
        hold on
        y = exp(x);
        set(handles.text7,'Value',y);
        set(handles.text8,'Value',x);
        plot(x,y,'r');
        hold off
    case 6
        axes(handles.axes1);
        x = 1:10;
        y = x - 1;
        plot(x,y);
        hold on
        y = log(x);
        set(handles.text7,'Value',y);
        set(handles.text8,'Value',x);
        plot(x,y,'r');
        hold off
end   

status = get(handles.checkbox1,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 2
        if status == 0
            hold on
            axes(handles.axes1);
            x = 0:10;
            z = x;
            plot(x,z,'white');axis([0 10 -10 10]);
            z = sin(x);

            plot(x,z,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            axes(handles.axes1);
            x = 0:10;
            z = x;

            plot(x,z,'blue');axis([0 10 -10 10]);
            hold off
        end
    case 4
        if status == 0
            hold on
            x = 0:10;
            z = x;
            plot(x,z,'white');axis([0 10 -10 10]);
            z = tan(x);

            plot(x,z,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            z = x;
      
            plot(x,z,'blue');axis([0 10 -10 10]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            z = 1+x;
            plot(x,z,'white');axis([0 5 0 150]);
            z = exp(x);

            plot(x,z,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            z = 1+x;
  
            plot(x,z,'blue');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end

status = get(handles.checkbox2,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 3
        if status == 0
            hold on
            x = 0:10;
            z = 1-(x.^2)/2;
            plot(x,z,'white');axis([0 10 -3 3]);
            z = cos(x);
            set(handles.text7,'Value',z);

            plot(x,z,'r');axis([0 10 -3 3]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            z = 1-(x.^2)/2;

            plot(x,z,'cyan');axis([0 10 -3 3]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            z = 1+x+(x.^2)/2;
            plot(x,z,'white');axis([0 5 0 150]);
            z = exp(x);
    
            plot(x,z,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            z = 1+x+(x.^2)/2;

            plot(x,z,'cyan');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end

status = get(handles.checkbox3,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 2
        if status == 0
            hold on
            axes(handles.axes1);
            x = 0:10;
            z = x-(x.^3)/6;
            plot(x,z,'white');axis([0 10 -10 10]);
            z = sin(x);
 
            plot(x,z,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            axes(handles.axes1);
            x = 0:10;
            z = x-(x.^3)/6;

            plot(x,z,'green');axis([0 10 -10 10]);
            hold off
        end
    case 4
        if status == 0
            hold on
            x = 0:10;
            z = x+(x.^3)/3;
            plot(x,z,'white');axis([0 10 -10 10]);
            z = tan(x);

            plot(x,z,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            z = x+(x.^3)/3;
          
            plot(x,z,'green');axis([0 10 -10 10]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            z = 1+x+(x.^2)/2 +(x.^3)/6;
            plot(x,z,'white');axis([0 5 0 150]);
            z = exp(x);
           
            plot(x,z,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            z = 1+x+(x.^2)/2 +(x.^3)/6;
      
            plot(x,z,'green');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end

status = get(handles.checkbox4,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 3
        if status == 0
            hold on
            x = 0:10;
            z = 1-(x.^2)/2 +(x.^4)/24;
            plot(x,z,'white');axis([0 10 -3 3]);
            z = cos(x);
           
            plot(x,z,'r');axis([0 10 -3 3]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            z = 1-(x.^2)/2 +(x.^4)/24;
     
            plot(x,z,'magenta');axis([0 10 -3 3]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            z = 1+x+(x.^2)/2 +(x.^3)/6 +(x.^4)/24;
            plot(x,z,'white');axis([0 5 0 150]);
            z = exp(x);
      
            plot(x,z,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            z = 1+x+(x.^2)/2 +(x.^3)/6 +(x.^4)/24;
         
            plot(x,z,'magenta');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end


status = get(handles.checkbox5,'Value');
fun = get(handles.popupmenu1,'Value');
switch fun
    case 2
        if status == 0
            hold on
            axes(handles.axes1);
            x = 0:10;
            z = x-(x.^3)/6 +(x.^5)/120;
            plot(x,z,'white');axis([0 10 -10 10]);
            z = sin(x);
       
            plot(x,z,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            axes(handles.axes1);
            x = 0:10;
            z = x-(x.^3)/6 +(x.^5)/120;
  
            plot(x,z,'yellow');axis([0 10 -10 10]);
            hold off
        end
    case 4
        if status == 0
            hold on
            x = 0:10;
            z = x+(x.^3)/3 +(2*x.^5)/15;
            plot(x,y,'white');axis([0 10 -10 10]);
            z = tan(x);
       
            plot(x,z,'r');axis([0 10 -10 10]);
            hold off
        end
        if status == 1
            hold on
            x = 0:10;
            z = x+(x.^3)/3 +(2*x.^5)/15;
        
            plot(x,z,'yellow');axis([0 10 -10 10]);
            hold off
        end
    case 5
        if status == 0
            hold on
            x = 0:5;
            z = 1+x+(x.^2)/2 +(x.^3)/6 +(x.^4)/24 +(x.^5)/120;
            plot(x,z,'white');axis([0 5 0 150]);
            z = exp(x);
          
            plot(x,z,'r');axis([0 5 0 150]);
            hold off
        end
        if status == 1
            hold on
            x = 0:5;
            z = 1+x+(x.^2)/2 +(x.^3)/6 +(x.^4)/24 +(x.^5)/120;
         
            plot(x,z,'yellow');axis([0 5 0 150]);
            hold off
        end
guidata(hObject,handles)
end

%     y = get(handles.text7,'Value');
%     x = get(handles.text8,'Value');
    if (get(handles.popupmenu1,'Value') == 6)
        d = [get(handles.slider1,'Value'),y(get(handles.slider1,'Value'))];
    else
        d = [get(handles.slider1,'Value'),y(get(handles.slider1,'Value') + 1)];
    end
    set(handles.uitable2,'Data',d);
    hold on;
    plot(d(1),d(2),'*r');
    hold off;
    

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




