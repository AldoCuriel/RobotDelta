function cambiarValoresArduino
global a;
global run;
global pwmT1;
global pwmT2;
global pwmT3;
global gripper;

if run == 1
    a.digitalWrite(13,1);
    a.digitalWrite(2,1);
    a.digitalWrite(4,0);
    a.digitalWrite(7,gripper);
%     a.analogWrite(9,pwmT1);
%     a.analogWrite(10,pwmT2);
%     a.analogWrite(11,pwmT3);
    servoWrite(a,9,pwmT1);
    servoWrite(a,10,pwmT2);
    servoWrite(a,11,pwmT3);
elseif run == 0
    h = msgbox('Sistema Apagado Run = 0');
    a.digitalWrite(13,0);
    a.digitalWrite(2,0);
    a.digitalWrite(4,1);
end

end