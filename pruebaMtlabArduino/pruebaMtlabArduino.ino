
int led = 13;
char a;
void setup()
{
  pinMode(led, OUTPUT); 
  Serial.begin(9600);

  //digitalWrite(led, HIGH);
}
void loop()
{
  Serial.println('a');
  a = 'b';
  while(a != 'a')
  {
    a=Serial.read();
  }
}
