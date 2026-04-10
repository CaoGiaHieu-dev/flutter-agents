# 🛡️ Elite Agent Example: Safe Refactoring Workflow

Ví dụ này cho thấy cách bộ Agents thực hiện Refactor một module quan trọng mà không làm hỏng các quy chuẩn hiện có của bạn.

---

## 📂 Tình huống (Scenario)
User muốn refactor `PaymentService.dart` - một file cũ, dài 800 dòng, code lộn xộn nhưng đang chạy ổn định.

---

## 🛠 Bước 1: Inquiry Phase (Yêu cầu nghiên cứu)
**User:** "Hãy xem file `PaymentService.dart` và cho tôi biết cách làm nó gọn lại mà không phá hỏng logic hiện tại."

**Agent:** `@project-analyzer` thực hiện quét.
- **Hành động:** Mapping các symbols trong file. Phát hiện file này đang được gọi bởi 15 file khác.
- **Phản hồi:** "Tôi đã quét xong. File này quá lớn và đang vi phạm nguyên tắc tách biệt logic. Tôi đã sẵn sàng một kế hoạch Refactor."

---

## 🧠 Bước 2: Proposal Phase (Đề xuất phương án)
**Agent:** `@system-integrator` trình bày 2 lựa chọn:

1.  **Phương án A (Local Cleanup):** 
    - Chỉ tách các hàm nhỏ, đặt lại tên biến cho rõ ràng.
    - Giữ nguyên cấu trúc `Singleton` hiện tại của bạn.
    - **Cam kết:** 100% không thay đổi cách bạn gọi Service này ở các file khác.
2.  **Phương án B (Elite Upgrade):** 
    - Chuyển sang `Dependency Injection` và `Abstract Interface`.
    - Tách logic xử lý cổng thanh toán thành các `Strategy` riêng biệt.
    - **Lợi ích:** Dễ viết Unit Test hơn sau này.

---

## 👤 Bước 3: User Decision (Quyền quyết định)
**User:** "Tôi chọn phương án A. Đừng đổi sang DI, tôi không muốn sửa code ở các file khác."

**Agent:** "Đã rõ. Tôi sẽ thực hiện Refactor an toàn theo Phương án A. Tôi sẽ tuân thủ thụt lề 2 spaces và cách đặt tên `camelCase` hiện tại của bạn."

---

## ✍️ Bước 4: Execution Phase (Thực thi)
**Agent:** `@flutter-expert` tiến hành sửa đổi.
- **Hành động:** Sử dụng `replace` để thực hiện các thay đổi surgical (phẫu thuật chính xác), không ghi đè toàn bộ file để tránh mất các comment quan trọng của bạn.

---

## 🔍 Bước 5: Validation Phase (Kiểm định)
**Agent:** `@qa-code-review` nhảy vào kiểm tra.
- **Hành động:** 
    - Chạy `flutter analyze`. 
    - Kiểm tra xem Agent trước có vô tình đổi tên hàm công khai (public method) không.
- **Kết quả:** "Mọi thứ ổn định. Code đã gọn hơn 40%, các file khác vẫn hoạt động bình thường mà không cần sửa đổi gì."

---

## ✅ Kết luận
Agent đã thực hiện Refactor theo đúng ý bạn: **Sạch hơn nhưng vẫn quen thuộc.** Nó không tự ý áp đặt kiến trúc "xịn" hơn nếu bạn không muốn.
