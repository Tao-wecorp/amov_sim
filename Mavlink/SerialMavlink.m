function SerialFuc() 
  global s dialect;
  global RcMsgRaw SerevoMsgRaw;
  delete(instrfindall)      
  s = serial('com5');      
  set(s,'BaudRate',115200);     
  set(s,'InputBufferSize',20000);%%%设置输入缓冲区大小为200byte
  set(s,'BytesAvailableFcnMode','byte'); %设置中断触发方式 
  set(s,'BytesAvailableFcnCount',1000);   %设置中断触发方式  
  s.BytesAvailableFcn =@ReceiveCallback;       % 定义中断响应函数对象  
  fopen(s);                 %打开串口  
  dialect = mavlinkdialect("common.xml");
  RcMsgRaw = createmsg(dialect,35);
  SerevoMsgRaw = createmsg(dialect,36);
end

 function ReceiveCallback( obj,event)     %创建中断响应函数
  global s dialect;
  global RcMsgRaw SerevoMsgRaw;
    str = fread(s);
    buff = uint8(str);
    msg = deserializemsg(dialect,buff);
    for index_msg = 1:length(msg) 
        switch msg(index_msg).MsgID
            case 70
                RcMsgRaw = msg(index_msg);
                RcMsgRaw.Payload
            case 36
                SerevoMsgRaw = msg(index_msg);
%               SerevoMsgRaw.Payload;
        end
    end
 end

