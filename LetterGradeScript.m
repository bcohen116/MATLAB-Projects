% Script only runs if dataset array, grade, is in workspace with added columns

grade = dataset('xlsfile','Students');
grade.HWAVG = mean([grade.HW1 grade.HW2 grade.HW3 grade.HW4 grade.HW5],2);
grade.TESTAVG = mean([grade.Test1 grade.Test2 grade.Test3],2);
grade.AVG = 0.25*grade.HWAVG+0.45*grade.TESTAVG+0.3*grade.Project;
for m = 1:length(grade.Name)
   if grade.AVG(m) >= 90
       grade.Grade{m} = 'A';  % Curly Braces Here!
   elseif grade.AVG(m) >= 80
       grade.Grade{m} = 'B';  % Curly Braces Here!
   elseif grade.AVG(m) >= 70
       grade.Grade{m} = 'C';  % Curly Braces Here!
   elseif grade.AVG(m) >=60
       grade.Grade{m} = 'D';  % Curly Braces Here!
   else
       grade.Grade{m} = 'F';  % Curly Braces Here!
   end  
end
grade
x = find(strcmp(grade.Grade, 'B'));
grade.Name(x)
y = sum(strcmp(grade.Grade, 'B'))
save('Grades.mat', 'grade');
