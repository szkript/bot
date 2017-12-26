screenshtNew = 'screen.jpg';


robo = java.awt.Robot;
t = java.awt.Toolkit.getDefaultToolkit();
rectangle = java.awt.Rectangle(t.getScreenSize());
image = robo.createScreenCapture(rectangle);
filehandle = java.io.File(screenshtNew);
javax.imageio.ImageIO.write(image,'jpg',filehandle);