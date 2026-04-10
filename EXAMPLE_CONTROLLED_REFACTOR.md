# 🛡️ Elite Agent Example: Controlled Refactoring

Ví dụ này giải đáp thắc mắc: **"Agent có tự ý thay đổi output của tôi không?"** thông qua quy trình Refactor có kiểm soát.

---

## 📂 Tình huống (Scenario)
User muốn refactor module `UserProfile.dart` để code trông sạch hơn.

---

## 🚫 Những gì Agent KHÔNG làm:
- Tự ý đổi tên biến từ `snake_case` sang `camelCase` (nếu dự án đang dùng snake_case).
- Tự ý cài thêm thư viện mới (ví dụ: tự ý thêm `Freezed` khi bạn chưa cho phép).
- Tự ý sửa logic xử lý lỗi (ví dụ: tự ý đổi `try-catch` thành `Result` pattern).

---

## ✅ Quy trình Refactor 3 bước (The Approval Loop):

### Bước 1: Nghiên cứu & Đề xuất (Strategy)
**User:** "Hãy refactor file này cho gọn."
**Agent:** "Tôi đã phân tích. Tôi đề xuất tách hàm `updateUI()` ra khỏi `updateData()`. Tôi sẽ giữ nguyên mọi quy chuẩn thụt lề 2 spaces của bạn. Bạn có muốn xem code mẫu trước khi tôi áp dụng không?"

### Bước 2: User Phê duyệt (Authorization)
**User:** "Cho tôi xem code mẫu."
**Agent:** Hiển thị một bản Diff (So sánh cũ/mới).
- *"Tôi phát hiện bạn đang dùng kiểu khai báo biến cũ. Tôi có một đề xuất **Elite Upgrade** để dùng kiểu mới an toàn hơn. Bạn có muốn thực hiện không?"*
**User:** "Chỉ tách hàm thôi, đừng đổi kiểu khai báo biến."

### Bước 3: Thực thi chính xác (Surgical Execution)
**Agent:** Chỉ thực hiện đúng việc tách hàm.
- Sau khi thực hiện, `@qa-code-review` sẽ quét lại để đảm bảo không có một dấu cách nào bị thừa hay thiếu so với style cũ của bạn.

---

## 💡 Kết quả:
Mọi thay đổi đều nằm trong tầm kiểm soát của bạn. Agent đóng vai trò là **"Cánh tay nối dài"** chứ không phải là người thay thế bạn đưa ra quyết định kiến trúc.
