USE QuanLySinhVien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT 
    *
FROM
    student
WHERE
    student.StudentName LIKE 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
SELECT 
    *
FROM
    class
WHERE
    MONTH(class.StartDate) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT 
    *
FROM
    subject
WHERE subject.Credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
SET SQL_SAFE_UPDATES = 0;
UPDATE student 
SET 
    ClassId = 2
WHERE
    StudentName = 'Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
SELECT 
    student.StudentName, `subject`.SubName, mark.Mark
FROM
    student
        JOIN
    mark ON student.StudentId = mark.StudentId
        JOIN
    `subject` ON `subject`.SubId = mark.SubId
ORDER BY Mark DESC , StudentName ASC;
