USE QuanLySinhVien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    `subject`
WHERE
    Credit = (SELECT 
            MAX(Credit)
        FROM
            `subject`);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất
SELECT 
    *
FROM
    `subject`
WHERE
    SubId = (SELECT 
            SubId
        FROM
            mark
        WHERE
            Mark = (SELECT 
                    MAX(mark.Mark)
                FROM
                    mark));
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần       
SELECT *,AVG(mark.Mark) diem_trun_binh
FROM
    student
        JOIN
    mark ON mark.StudentId = student.StudentId
GROUP BY mark.StudentId
ORDER BY Mark DESC;
             
            