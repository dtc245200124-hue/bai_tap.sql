-- BÀI TẬP: TRUY VẤN DỮ LIỆU VỚI CSDL QUẢN LÝ SINH VIÊN
-- Giả định tên bảng/cột:
-- Students(StudentID, StudentName, ClassID)
-- Classes(ClassID, ClassName, StartDate)
-- Subjects(SubID, SubName, Credit)
-- Marks(StudentID, SubID, Mark)
-- Nếu CSDL trước đó dùng tên khác, thay tên tương ứng trong câu lệnh.

-- 1. Hiển thị tất cả sinh viên có tên bắt đầu bằng ký tự 'h'.
-- Trong MySQL, so sánh chuỗi thường không phân biệt hoa/thường tùy collation.
SELECT *
FROM Students
WHERE StudentName LIKE 'h%';

-- 2. Hiển thị thông tin các lớp có thời gian bắt đầu vào tháng 12.
SELECT *
FROM Classes
WHERE MONTH(StartDate) = 12;

-- 3. Hiển thị thông tin môn học có số tín chỉ từ 3 đến 5.
-- BETWEEN bao gồm cả hai giá trị biên: 3 và 5.
SELECT *
FROM Subjects
WHERE Credit BETWEEN 3 AND 5;

-- 4. Đổi ClassID của sinh viên tên 'Hung' thành 2.
-- Nên kiểm tra trước các dòng bị tác động khi chạy trên dữ liệu thật:
-- SELECT * FROM Students WHERE StudentName = 'Hung';
UPDATE Students
SET ClassID = 2
WHERE StudentName = 'Hung';

-- 5. Hiển thị StudentName, SubName, Mark.
-- Sắp xếp Mark giảm dần; nếu trùng điểm, StudentName tăng dần.
SELECT
    s.StudentName,
    sub.SubName,
    m.Mark
FROM Marks AS m
JOIN Students AS s
    ON s.StudentID = m.StudentID
JOIN Subjects AS sub
    ON sub.SubID = m.SubID
ORDER BY m.Mark DESC, s.StudentName ASC;

-- Nếu bảng kết quả trong CSDL trước đó tên là StudentSubject hoặc Results
-- thay Marks trong câu lệnh cuối bằng tên bảng thực tế.
