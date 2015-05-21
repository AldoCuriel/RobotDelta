%a = arduino('com8')

a.pinMode(2,'output')
a.pinMode(4,'output')
a.pinMode(9,'output')
a.pinMode(10,'output')
a.pinMode(11,'output')


a.analogWrite(9,20);
a.analogWrite(10,20);
a.analogWrite(11,20);

a.digitalWrite(2,1)
a.digitalWrite(4,1);