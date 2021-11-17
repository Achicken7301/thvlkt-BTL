# Bài Tập Lớn môn Tin Học Vật Lý Kĩ Thuật
Code matlab BTL môn Tin học vật lý kĩ thuật Trường ĐHBK K19 học kì 211

Thiết kế giao diện người dùng (Graphic User Interface - GUI) bằng MATLAB để thực hiện xử lý ảnh y sinh cơ bản (các ảnh DICOM có tên file “*.dcm”), với các yêu cầu cụ thể:

- Chương trình có thể đọc 01 ảnh X-quang bất kỳ từ máy tính
  - Hiển thị được ảnh lên axes trong figure (các bước đọc và hiển thị ảnh thực hiện bằng cách click vào nút hoặc chọn từ menu). 
  - Các ảnh đã hiển thị phải có chú thích đầy đủ (các thông tin tối thiểu phải hiển thị là: tên ảnh, đường dẫn đến file ảnh, kích thước ảnh). (4 điểm). 
  - Các thông số khác nếu có hiển thị chính xác sẽ được xem xét cộng điểm khuyến khích!
  
- Chương trình có thể cho phép người sử dụng thực hiện các thao tác xử lý ảnh cơ bản: 
  - Tăng cường ảnh (thay đổi độ tương phản, độ sáng, làm rõ ảnh), xoay ảnh, phóng to / thu nhỏ ảnh. 
  - Đo được khoảng cách của 02 điểm bất kỳ khi người sử dụng click vào 2 điểm trên ảnh, giả sử kích thước 100% của ảnh tương ứng với 25cm x 30cm (3 điểm). 
  - Nếu hiển thị được ảnh gốc và ảnh kết quả sau mỗi bước xử lý sẻ được xem xét cộng điểm khuyến khích!

- Chương trình cho phép xử lý hàng loạt nhiều ảnh đã lưu trữ sẵn trong ổ đĩa cứng của máy tính
  - Các ảnh đã xử lý có thể lưu lại được
  - Có thể phục hồi lại ảnh ban đầu sau khi qua nhiều bước xử lý khác nhau. (3 điểm). 
  - Nếu xây dựng được chương trình có thể thực thi độc lập trên máy tính chưa cài đặt sẵn Matlab sẽ được xem xét cộng điểm khuyến khích!
