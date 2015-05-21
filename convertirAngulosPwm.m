function [pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3)
    % ecuacion de ejemplo Y = 1.4286*x +9e-14;
    pwmT1 = ((-0.9862)*t1) + (54.448);
    pwmT2 = ((-0.9848)*t2) + (65.916);
    pwmT3 = ((-0.9779)*t3) + (69.975);
    pwmT1 = real(pwmT1);
    pwmT2 = real(pwmT2);
    pwmT3 = real(pwmT3);
end