classdef Control
    properties
    end
    methods (Static)
        function f =  Move(decision)
            robot = java.awt.Robot;
            switch decision
                case 'raise'
                    eval(['robot.keyPress(java.awt.event.KeyEvent.VK_W)']);
                case 'raiseX2'
                    eval(['robot.keyPress(java.awt.event.KeyEvent.VK_2)']);
                    randomPause(0.2,1.7);
                    eval(['robot.keyPress(java.awt.event.KeyEvent.VK_W)']);
                case 'raiseX3'
                    eval(['robot.keyPress(java.awt.event.KeyEvent.VK_3)']);
                    randomPause(0.2,1.7);
                    eval(['robot.keyPress(java.awt.event.KeyEvent.VK_W)']);
                case 'check'
                    eval(['robot.keyPress(java.awt.event.KeyEvent.VK_D)']);
                case 'call'
                    eval(['robot.keyPress(java.awt.event.KeyEvent.VK_D)']);
                case 'fold'
                    eval(['robot.keyPress(java.awt.event.KeyEvent.VK_F)']);
                otherwise
                    Warning('unexpected decision : ');
                    disp(decision);
                    f=false;
            end
        end
    end
end