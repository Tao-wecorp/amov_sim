%Author:bingo
%Email:1554459957@qq.com
%Notic:����������Ҫ��װ������Robotics System Toolbox UAV LibraryV19.1.1������
%Description�����͸��ɿ�ģ�͵�״̬�źţ���px4v1.9.2�汾����̬��������Ҫ��������Ϣ����Ȼ��Ҫ�޸�PX4����Դ�롣
function [sys,x0,str,ts] = MavlinkSerial_InHilStateQuaternion(t,x,u,flag)
switch flag
  case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
  case 3
    mdlUpdate(t,x,u);
  case {1,2,4,9}
    sys=[];
  otherwise
    error(num2str(flag));
end
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes
  global s dialect HilStateMsg mavlink comError;
  comError = 0;
  dialect = mavlinkdialect("common.xml");
  mavlink = mavlinkio("common.xml","SystemID",1,"ComponentID",1);
  HilStateMsg = createmsg(dialect,115);
  
  delete(instrfindall);      
  s = serial('com4');      
  set(s,'BaudRate',115200);     
  set(s,'OutputBufferSize',100);%%%���������������СΪ150  
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
%sizes.NumOutputs     = 4;%���Ԫ�ظ���Ϊ4������
sizes.NumInputs      = 14;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [-1 0];
simStateCompliance = 'UnknownSimState';
  try
       fopen(s);                 %�򿪴��� 
  catch
     comError =1;
     disp("open com fail");
  end
function mdlUpdate(t,x,u)
    global s  HilStateMsg mavlink comError;
if(comError == 0)    
    HilStateMsg.Payload.attitude_quaternion(1) = u(1);
    HilStateMsg.Payload.attitude_quaternion(2) = u(2);
    HilStateMsg.Payload.attitude_quaternion(3) = u(3);
    HilStateMsg.Payload.attitude_quaternion(4) = u(4);
    HilStateMsg.Payload.rollspeed = single(u(5));
    HilStateMsg.Payload.pitchspeed = single(u(6));
    HilStateMsg.Payload.yawspeed = single(u(7));
    HilStateMsg.Payload.vx=int16(u(8));
    HilStateMsg.Payload.vy=int16(u(9));
    HilStateMsg.Payload.vz=int16(u(10));
    HilStateMsg.Payload.xacc = int16(u(11));
    HilStateMsg.Payload.yacc = int16(u(12));
    HilStateMsg.Payload.zacc = int16(u(13));
    HilStateMsg.Payload.lat = int32(1);
    HilStateMsg.Payload.lon = int32(1);
    HilStateMsg.Payload.alt = int32(u(14));
  buffer = serializemsg(mavlink,HilStateMsg);
  try
    fwrite(s,buffer);
  catch
    disp("write error");
  end
else
end
% end mdlTerminate