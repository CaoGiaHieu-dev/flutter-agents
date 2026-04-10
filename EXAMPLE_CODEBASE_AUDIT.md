# 🔍 Elite Agent Example: Full Codebase Template Audit

Ví dụ này minh họa cách bộ Agents Elite thực hiện một đợt tổng kiểm tra (Audit) cho một Template Codebase phức tạp (Flutter + FastAPI).

---

## 📂 Bối cảnh (The Scenario)
Bạn có một Template "E-Commerce Start-kit". Bạn muốn biết nó có đủ tốt để scale lên 1 triệu người dùng không và có lỗ hổng bảo mật nào không.

---

## 🛠 Bước 1: Quét bối cảnh (Context Discovery)
**Agent:** `@project-analyzer` thực hiện **Symbol Mapping**.
- **Hành động:** 
    - Quét `pubspec.yaml`, `requirements.txt`.
    - Lập bản đồ: `AuthService`, `PaymentGateway`, `DatabaseConfig`.
- **Kết quả:** Phát hiện Flutter dùng **Provider** (style cũ), Python dùng **SQLAlchemy 1.4**.

---

## 🧠 Bước 2: Đánh giá Đa chiều (Multi-Agent Analysis)
**Agent:** `@system-integrator` điều phối các chuyên gia thực hiện Audit (Không sửa code).

1.  **`@clean-architecture-solid` (Kiến trúc):** 
    - *"Template này đang dùng 'Fat Models' (Model chứa quá nhiều logic). Điểm yếu: Khó bảo trì khi thêm tính năng thanh toán phức tạp."*
2.  **`@qa-code-review` (Bảo mật):** 
    - *"CẢNH BÁO: Phát hiện lỗi SQL Injection tiềm tàng trong hàm `search_products`. Dữ liệu người dùng được nối chuỗi trực tiếp vào query."*
    - *"Rủi ro: Token JWT không có khóa bí mật (Secret Key) được lưu an toàn (đang hardcode)."*
3.  **`@flutter-expert` (Hiệu năng):**
    - *"Widget `ProductCard` đang bị redraw không cần thiết. Cần thêm `const` và `RepaintBoundary`."*

---

## 📝 Bước 3: Báo cáo kết quả (The Audit Report)
**Agent:** `@docs-architect` tổng hợp báo cáo gửi User.

| Hạng mục | Đánh giá | Đề xuất của Agent |
| :--- | :--- | :--- |
| **Bảo mật** | 🚩 Nguy hiểm | Vá lỗi SQL Injection và chuyển Secret Key sang Env. |
| **Kiến trúc** | ⚠️ Trung bình | Tách logic khỏi UI layer để scale tốt hơn. |
| **Hiệu năng** | ⚠️ Cần tối ưu | Sử dụng Isolate cho việc xử lý ảnh sản phẩm. |

---

## ✅ Kết luận
Agent chỉ **chỉ ra lỗi** và **đưa ra giải pháp**. Nó đứng yên đợi lệnh của bạn thay vì tự ý "sửa hộ" mà chưa có sự đồng ý.
