function SerialFuc() 
  global s dialect;
  global RcMsgRaw SerevoMsgRaw;
  delete(instrfindall)      
  s = serial('com5');      
  set(s,'BaudRate',115200);     
  set(s,'InputBufferSize',20000);%%%�������뻺������СΪ200byte
  set(s,'BytesAvailableFcnMode','byte'); %�����жϴ�����ʽ 
  set(s,'BytesAvailableFcnCount',1000);   %�����жϴ�����ʽ  
  s.BytesAvailableFcn =@ReceiveCallback;       % �����ж���Ӧ��������  
  fopen(s);                 %�򿪴���  
  dialect = mavlinkdialect("common.xml");
  RcMsgRaw = createmsg(dialect,35);
  SerevoMsgRaw = createmsg(dialect,36);
end

 function ReceiveCallback( obj,event)     %�����ж���Ӧ����
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

