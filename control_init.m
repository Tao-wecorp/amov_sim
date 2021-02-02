%%init Func

%% init path
filepath = which(mfilename);
filefolder = fileparts(filepath);
workpath = pwd;

% set build path
buildpath = fullfile(filefolder, 'Build');
if(~exist(buildpath, 'dir'))
   mkdir(buildpath); 
end
set_param(0, 'CodeGenFolder', buildpath);
set_param(0, 'CacheFolder', buildpath);
% add path
addpath(fullfile(filefolder, 'BusDefinition'));
addpath(fullfile(filefolder, 'Library'));
addpath(fullfile(filefolder, 'Model'));
addpath(fullfile(filefolder, 'Visualization'));
addpath(fullfile(filefolder, 'Utils'));

%% load bus definition
run('bus_definition.m');
run('vis_bus_define.m');

%% load configuration
load('Configuration.mat');

%% init variable
start_time = 0;
stop_time = inf;
Ts = 0.008;

%% create parameters
% PID_Param.Kp_phi = single(0.15);
% PID_Param.Kp_theta = single(0.15);
% PID_Param.Kp_psi = single(0.15);
% PID_Param.Kp_phi = single(6);
% PID_Param.Kp_theta = single(6);
% PID_Param.Kp_phi = single(6);
% PID_Param.Kp_theta = single(6);
% PID_Param.Kp_psi = single(2.0);

% PID_Param.Kp_p = single(0.1);
% PID_Param.Kp_q = single(0.1);
% PID_Param.Kp_r = single(0.2);
% PID_Param.Kp_p = single(0.2);
% PID_Param.Kp_q = single(0.2);
% PID_Param.Kp_r = single(0.2);

% PID_Param.Ki_p = single(0.05);
% PID_Param.Ki_q = single(0.05);
% PID_Param.Ki_r = single(0.05);
% PID_Param.Ki_Max = single(0.1);
% PID_Param.Ki_Min = single(-0.1);

% PID_Param.Kd_p = single(0.0004);
% PID_Param.Kd_q = single(0.0004);
% PID_Param.Kd_p = single(0.0004);
% PID_Param.Kd_q = single(0.0004);
% PID_Param.Kd_r = single(0.0005);
% PID_Param.Kd_Max = single(0.1);
% PID_Param.Kd_Min = single(-0.1);


PID_Param.Kp_phi = single(6);
PID_Param.Kp_theta = single(6);
PID_Param.Kp_psi = single(2.0);

PID_Param.Kp_p = single(0.05);
PID_Param.Kp_q = single(0.05);
PID_Param.Kp_r = single(0.2);

PID_Param.Ki_p = single(0.05);
PID_Param.Ki_q = single(0.05);
PID_Param.Ki_r = single(0.05);
PID_Param.Ki_Max = single(0.1);
PID_Param.Ki_Min = single(-0.1);

PID_Param.Kd_p = single(0.0005);
PID_Param.Kd_q = single(0.0005);
PID_Param.Kd_r = single(0.0005);
PID_Param.Kd_Max = single(0.1);
PID_Param.Kd_Min = single(-0.1);

Model_Param = Simulink.Parameter(PID_Param);
Model_Param.CoderInfo.StorageClass = 'ExportedGlobal';
busInfo = Simulink.Bus.createObject(Model_Param.Value);
Model_Param_T = eval(busInfo.busName);
Model_Param.DataType = 'Bus: Model_Param_T';

