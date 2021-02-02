%Author:bingo
%Email:1554459957@qq.com
%Notic:正常运行需要安装工具箱Robotics System Toolbox UAV LibraryV19.1.1及以上
%Description：接收来自飞控对模型的控制信号，发送给飞控模型的状态信号；在px4v1.9.2版本的姿态控制中需要陀螺仪信息，不然需要修改PX4控制源码。
function [sys,x0,str,ts] = MavlinkSerial_OutActuatorControl(t,x,u,flag)
switch flag
  case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
  case 3
	sys=mdlOutputs(t,x,u);
  case {1,2,4,9}
    sys=[];
  otherwise
    error(num2str(flag));
end
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes
  global s dialect comError;
  comError = 0;
  dialect = mavlinkdialect("common.xml");
  delete(instrfindall);      
  s = serial('com4');      
  set(s,'BaudRate',115200);     
  set(s,'InputBufferSize',150);%%%设置输入缓冲区大小为40  

sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;%输出元素个数为4的向量
%sizes.NumInputs      = 14;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [-1 0];
simStateCompliance = 'UnknownSimState';
  try
       fopen(s);                 %打开串口 
  catch
     comError =1;
     disp("open com fail");
  end

function sys=mdlOutputs(t,x,u)
  global s dialect  HilActuatorControl ;
  global  HilActuatorControlMag comError;
  if(comError == 0)
    str = fread(s);
    buff = uint8(str);
    msg = deserializemsg(dialect,buff);
    for index_msg = 1:length(msg) 
        switch msg(index_msg).MsgID
            case 93
                HilActuatorControlMag = msg(index_msg);
                HilActuatorControl(1) = HilActuatorControlMag.Payload.controls(1);
                HilActuatorControl(2) = HilActuatorControlMag.Payload.controls(2);
                HilActuatorControl(3) = HilActuatorControlMag.Payload.controls(3);
                HilActuatorControl(4) = HilActuatorControlMag.Payload.controls(4);
        end
    end
  else
  end
    sys = HilActuatorControl;
% end mdlTerminate