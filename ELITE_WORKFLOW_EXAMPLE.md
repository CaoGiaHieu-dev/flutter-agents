# 🚀 Elite Agent Workflow Example: Secure Profile Sync (Sovereign v9.0)

Ví dụ này tái hiện cách bộ Agents phối hợp để thực hiện một tính năng phức tạp: **"Thêm xác thực sinh trắc học và đồng bộ Profile với Backend"** theo các giao thức mới nhất.

---

## 📂 Bối cảnh dự án (Current State)
- **Frontend:** Flutter 3.24, sử dụng **GetX**, thụt lề **2 spaces**.
- **Backend:** Python 3.13 (Free-Threading), **FastAPI**, **Pydantic V2**.
- **Di sản (Legacy):** Dự án cũ có kiến trúc "Fat Controller", không dùng Dependency Injection.

---

## 🧠 Bước 1: Nghiên cứu & Sovereign Pop Quiz
**Agent:** `@system-integrator` (Engineering Manager - EM) khởi động.

- **Hành động (Research):** 
    - Quét DNA dự án: Xác định local style (GetX, 2 spaces).
    - **Sovereign Pop Quiz:** Tự vấn: *"Tại sao dùng GetX cho Biometrics thay vì Native Bridge trực tiếp? Liệu việc này có làm vỡ logic auth hiện tại không?"*
- **Kết quả:** Xác nhận việc dùng `local_auth` plugin là an toàn nhất cho bối cảnh này.

---

## 🏗️ Bước 2: Mental Simulation & ROI Analysis
**Agent:** `@flutter-expert` lập kế hoạch.

- **Mental Dry Run:** Giả lập thay đổi trong "tâm trí": 
    - *Check 1:* Thêm `BiometricService` có làm hỏng `AuthController` không? -> Cần dùng **Layered Bridge**.
    - *Check 2:* Build runner có cần chạy lại không? -> Cần cập nhật `pubspec.yaml`.
- **ROI Analysis:** Báo cáo cho User: *"Việc thêm Biometrics tốn khoảng 5 lượt (turns), mang lại bảo mật mức High cho User."*

---

## ⚖️ Bước 3: Thực thi & Conflict Resolution
**Agent:** `@flutter-expert` viết code.

- **Tình huống Xung đột:** SOLID yêu cầu tách Repository, nhưng dự án hiện tại đang viết gộp logic vào Controller.
- **Áp dụng Conflict Resolution:** 
    1. **Authority:** `USER DIRECTIVE` > `LOCAL DNA` > `SOLID`.
    2. **Bridge Strategy:** Agent giữ nguyên Controller cũ nhưng tạo một private wrapper `_BiometricHandler` bên trong để giữ logic sạch sẽ mà không phá vỡ cấu trúc cũ.
- **In-Code ADR:** Thêm comment `// ARCH-DEBT: Gộp logic vào Controller để khớp với Legacy DNA, sẽ refactor sau.`

---

## 🛡️ Bước 4: QA Regression & Hardware Audit
**Agent:** `@qa-code-review` tiến hành kiểm định.

- **Automated Regression Audit:** Chạy quét lại toàn bộ luồng Login cũ để đảm bảo Biometrics không làm hỏng đăng nhập bằng mật khẩu.
- **Hardware-Aware Profiling:** Kiểm tra mức tiêu thụ Pin và RAM khi gọi cảm biến vân tay. Phát hiện lỗi memory leak nếu không đóng stream -> Yêu cầu sửa code ngay lập tức.

---

## 📚 Bước 5: Docs-Code Sync & RAG Optimization
**Agent:** `@docs-architect` cập nhật tài liệu.

- **Sync Protocol:** Vì logic Auth thay đổi >30%, Agent tự động cập nhật `docs/AUTH_FLOW.md`.
- **RAG-Optimization:** Viết tài liệu theo dạng "Chunk-Friendly" để Agent sau này dễ dàng tra cứu cách dùng Biometrics trong 1 lượt.
- **ADR Update:** Ghi lại quyết định dùng Layered Bridge vào `docs/adr/ADR-004-Biometrics.md`.

---

## 🔄 Bước 6: Skill Patching & Self-Evolution
- **Pattern Recognition:** Agent nhận thấy việc xử lý lỗi Biometrics trên Android 14 có một mẫu (pattern) lặp lại tốt hơn.
- **Skill Patch:** Đề xuất cập nhật `skills/flutter-expert/SKILL.md` để lưu lại "Winning Logic" này cho các dự án tương lai.
- **Finality:** Behavior verified + Structure audited + Docs synced.

---

## 🔥 Tại sao luồng này vượt trội?
1. **Sovereign Control:** Không bao giờ "đoán mò", luôn tự vấn và báo cáo ROI.
2. **Pragmatic Integrity:** Tôn trọng code cũ nhưng vẫn để lại "dấu vết" kiến trúc sạch (Scout Rule).
3. **Zero Regression:** QA không chỉ xem code mới mà còn bảo vệ code cũ.
4. **Knowledge Compound:** Hệ thống tự học (Self-evolve) sau mỗi task hoàn thành.
