use assignment;

select avg(age), position_name from (
select `account`.Username,`account`.age, `account`.Full_Name, `position`.position_name
from `account`  join `position` on `account`.position_ID =  `position`.position_ID  ) as trungbinh 
group by position_name;

insert  into `categoryquestion`(`Category_ID`,`Category_Name`) 
values (5,'Trí tuệ'),
(6,'Văn học'),
(7,'Địa lý');

insert  into `question`(`Content`,`Category_ID`,`Type_ID`,`Creator_ID`,`Create_Date`) 
values  ('Ở nước ta, tỉnh nào có diện tích nhỏ nhất ?',7,2,2, '2023-08-2'),
		('Ý nào sau đây không thuộc về yếu tố lập luận?',6,2,5,'2023-08-2'),
		('Cho dãy chữ sau OLYMPIA, hãy cho biết chữ thứ 46 khi liên tiếp săp xếp dãy chữ là ?',4,1,3,'2023-08-2'),
		('Điểm cực Nam của nước ta thuộc tỉnh ?',7,2,4,'2023-08-2'),
		('Vị vua đầu tiên của nước ta là ai? ?',3,2,6,'2023-08-2'),
		('Vùng nội thuỷ ở nước ta được xác định là vùng: ?',7,2,8,'2023-08-2'),
		('Lũ Tiểu mãn ở miền thuỷ văn Đông Trường Sơn thường xảy ra vào ?',7,2,9,'2023-08-2'),
		('Ai là người lãnh đạo nhân dân ta chống lại quân Nam Hán ?',3,2,10,'2023-08-2'),
		('Ai là người lãnh đạo nhân dân ta chống lại quân Nam Hán ?',3,2,10,'2023-08-2');


insert  into `answer`(`Content`,`Question_ID`,`is_Correct`) 
values  ('Lai Châu',3,'0'),
		('Bắc Ninh',3,'1'),
		('Nghệ An',3,'0'),
		('Quảng Nam',3,'0'),
        (' Luận điểm',4,'0'),
		('Đề tài nghị luận',4,'1'),
		('Luận cứ',4,'0'),
		('Các phương tiện liên kết, lập luận',4,'0'),
        ('P',5,'0'),
		('M',5,'1'),
		('Y',5,'0'),
		('I',5,'0'),
		('Bạc Liêu',6,'0'),
		('Kiên Giang',6,'1'),
		('Cà Mau',6,'0'),
		('Sóc Trăng',6,'0'),
		(' An DƯơng Vương',7,'0'),
		('Vua Hùng Vương    ',7,'1'),
		('Bảo Đại',7,'0'),
		('Quang Trung',7,'0'),
		(' Tiếp giáp với đất liền',8,'0'),
		(' Là vùng tiếp giáp với đất liền ở phía trong đường cơ sở ',8,'1'),
		('Phía ngoài đường cơ sở',8,'0'),
		('Phía trong đường cơ sở',8,'0'),
		('Tháng 2, 3 ',9,'0'),
		(' Tháng 5, 6 ',9,'1'),
		('Tháng 8, 9',9,'0'),
		('Tháng 10, 11',9,'0'),
		(' Hai Bà Trưng',10,'0'),
		('Ngô Quyền',10,'1'),
		(' Dương Đình Nghệ',10,'0'),
		('Đinh Bộ Lĩnh',10,'0'); 

-- câu3 --  
select `question`.Content, `question`.Create_Date, `answer`.Content, `answer`.is_Correct
from `question` join `answer` on `question`.Question_ID = `answer`.Question_ID  where is_Correct=1  order by Create_Date asc ;

-- câu 4 -- 
select `question`.Content, `question`.Create_Date from `question` where Create_Date = '2023-08-02';

-- câu 5 -- 
select `question`.Content,`question`.Question_ID, `question`.Type_ID, `question`.Category_ID, `categoryquestion`.Category_Name
from `question` join `categoryquestion` on `question`.Category_ID = `categoryquestion`.Category_ID 



