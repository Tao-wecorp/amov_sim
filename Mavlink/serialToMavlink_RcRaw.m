%Author:bingo
%Email:1554459957@qq.com
%Notic:正常运行需要安装工具箱Robotics System Toolbox UAV LibraryV19.1.1以上
%Description：功能是将串口中的数据流提取解析mavlink包；
function [sys,x0,str,ts] = serialToMavlink_RcRaw(t,x,u,flag)
switch flag,
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
  case 3,
    sys=mdlOutputs(t,x,u);
  case {1,2,4,9},
    sys=[];
  otherwise
    error(num2str(flag))
end
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes
  global s dialect RcRaw ;
  global RcMsgRaw SerevoMsgRaw comError;
  comError = 0;
  RcRaw = [0,0,0,0];
  dialect = mavlinkdialect("common.xml");
  RcMsgRaw = createmsg(dialect,35);
  SerevoMsgRaw = createmsg(dialect,36);

  delete(instrfindall)      
  s = serial('com4');      
  set(s,'BaudRate',115200);     
  set(s,'InputBufferSize',40);%%%设置输入缓冲区大小为1  

sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;%输出元素个数为4的向量
%sizes.NumInputs      = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [-1 0];
  try
       fopen(s);                 %打开串口 
  catch 
      comError =1;
      disp("open com fail");
 end
simStateCompliance = 'UnknownSimState';

function sys=mdlOutputs(t,x,u)
  global s dialect RcRaw comError;
  global RcMsgRaw SerevoMsgRaw;
  if(comError == 0)
    str = fread(s);
    buff = uint8(str);
    msg = deserializemsg(dialect,buff);
    for index_msg = 1:length(msg) 
        switch msg(index_msg).MsgID
            case 70
                RcMsgRaw = msg(index_msg);
                RcRaw(1) = (single(RcMsgRaw.Payload.chan1_raw) - 1500)/500;
                RcRaw(2) = (single(RcMsgRaw.Payload.chan2_raw) - 1500)/500;
                RcRaw(3) = (single(RcMsgRaw.Payload.chan3_raw) - 1500)/500;
                RcRaw(4) = RcRaw(4)+(single(RcMsgRaw.Payload.chan4_raw) - 1500)/500;
            case 36
                SerevoMsgRaw = msg(index_msg);
        end
    end
  else
  end
    sys = RcRaw;
% end mdlTerminate