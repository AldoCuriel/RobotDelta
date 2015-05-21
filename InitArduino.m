function InitArduino
    global a;
    a = arduino('com8')
    a.pinMode(2,'OUTPUT')
    a.pinMode(4,'OUTPUT')
    a.pinMode(7,'OUTPUT')
%     a.pinMode(9,'OUTPUT')
%     a.pinMode(10,'OUTPUT')
%     a.pinMode(11,'OUTPUT')
    servoAttach(a,9);
    servoAttach(a,10);
    servoAttach(a,11);
    a.pinMode(13,'OUTPUT')
end