# 🔍 Elite Agent Example: Codebase Template Audit

Ví dụ này minh họa cách bộ Agents quét và đánh giá một Template Codebase để tìm ra các rủi ro tiềm ẩn.

---

## 📂 Tình huống (Scenario)
Bạn tải một Template "Flutter + FastAPI E-Commerce" từ mạng về và muốn kiểm tra chất lượng trước khi phát triển thêm.

---

## 🛠 Bước 1: Stack & Convention Discovery
**Agent:** `@project-analyzer` thực hiện quét tổng thể.
- **Phát hiện:**
    - Flutter dùng `Dio` phiên bản cũ, Python dùng `SQLAlchemy 1.4`.
    - Local Convention: Flutter dùng thụt lề 2 spaces, Python dùng 4 spaces.
    - Phát hiện file `auth_middleware.py` có logic xử lý JWT.

---

## 🧠 Bước 2: Multi-Agent Deep Dive
**Agent:** `@system-integrator` điều phối 3 chuyên gia.

1.  **`@qa-code-review` (Security):** 
    - Phát hiện: "Secret Key" của JWT đang được hardcode trong file Python. 
    - Phát hiện: API `search` không validate input, có nguy cơ SQL Injection.
2.  **`@clean-architecture-solid` (Architecture):** 
    - Đánh giá: "Template này gọi trực tiếp API từ Widget (UI layer), vi phạm nghiêm trọng tính tách biệt. Sẽ rất khó bảo trì khi dự án lớn lên."
3.  **`@flutter-expert` (Performance):** 
    - Đánh giá: "Module danh sách sản phẩm dùng `ListView` thay vì `ListView.builder`, sẽ gây lag nếu danh sách có trên 50 phần tử."

---

## 📝 Bước 3: The Elite Audit Report
**Agent:** `@docs-architect` tổng hợp một báo cáo Markdown cho bạn.

### 🚩 Critical Failures (Cần sửa ngay):
- **Bảo mật:** Hardcoded Secret Key & SQL Injection tiềm tàng.
- **Lỗi logic:** Token JWT không hết hạn.

### ⚠️ Performance & Debt (Điểm yếu):
- UI lag khi danh sách sản phẩm dài.
- Phụ thuộc quá chặt (Tight coupling) giữa UI và API.

### ✨ Elite Upgrades (Gợi ý nâng cấp):
- "Tôi đề xuất tách module API ra một `DataSources` riêng (theo chuẩn Clean Architecture). Bạn có muốn tôi thực hiện việc này không?"
- "Tôi có thể nâng cấp SQLAlchemy lên 2.0 để bạn có Type-safety tốt hơn."

---

## ✅ Kết quả
Bạn có một cái nhìn toàn diện về "đống code" mình vừa tải về. Bạn biết chính xác cái gì tốt, cái gì tệ và có một "trợ lý" sẵn sàng vá lỗi ngay lập tức.
