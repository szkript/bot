function a = findTemplate(template,input_img)
H = vision.TemplateMatcher;

T = rgb2gray(template);
I = rgb2gray(input_img);

LOC = step(H,I,T);
obj.width = LOC(1);
obj.height = LOC(2);

a = obj;
end