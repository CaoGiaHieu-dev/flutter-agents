# 🚀 Elite Agent Workflow Example: Secure Profile Sync

Ví dụ này tái hiện cách bộ Agents phối hợp để thực hiện một tính năng phức tạp: **"Thêm xác thực sinh trắc học và đồng bộ Profile với Backend"**.

---

## 📂 Bối cảnh dự án (Current State)
- **Frontend:** Flutter 3.10, sử dụng **GetX** (State Management), thụt lề **2 spaces**.
- **Backend:** Python 3.10, **FastAPI**, **Pydantic V1**, thụt lề **4 spaces**.
- **Quy tắc:** Không sử dụng Git, ưu tiên Local Convention tuyệt đối.

---

## 🛠 Bước 1: Nghiên cứu & Lập bản đồ (The Elite Start)
**Agent:** `@project-analyzer` thực hiện nhiệm vụ đầu tiên.

- **Hành động:** 
    - Quét `pubspec.yaml` và `pyproject.toml` để xác định phiên bản.
    - **Symbol Mapping:** Tìm thấy `AuthController` và `UserRepository`.
    - **Turn Compression:** Sử dụng `grep_search -C 5` để đọc `auth_controller.dart` và các dependencies của nó trong **1 lượt duy nhất**.
- **Kết quả:** Phát hiện dự án đang dùng "Manual Dependency Injection" thay vì thư viện bên thứ ba.

---

## 🧠 Bước 2: Điều phối & Lập kế hoạch (The Orchestration)
**Agent:** `@system-integrator` tiếp nhận dữ liệu.

- **Kế hoạch:**
    1. **Task 1 (@android-kotlin-pro):** Viết module Native xác thực sinh trắc học.
    2. **Task 2 (@flutter-expert):** Viết UI Profile sử dụng **GetX** (theo style dự án).
    3. **Task 3 (@python-fastapi-backend):** Cập nhật API sử dụng **Pydantic V1** (theo SDK hiện tại).

---

## ✍️ Bước 3: Thực thi (The Local-First Implementation)
**Agent:** `@flutter-expert` bắt đầu viết code.

- **Hành động:** Viết `ProfilePage` và `ProfileController`.
- **Nhập gia tùy tục:** 
    - Sử dụng đúng cú pháp **GetX** (`obs`, `Obx`).
    - Thụt lề đúng **2 spaces**.
    - Tuyệt đối không cài thêm BLoC hay Riverpod dù đó là "Best Practice" chung.

---

## 🔍 Bước 4: Kiểm định & Cố vấn (The Respectful Advisor)
**Agent:** `@qa-code-review` tiến hành Audit.

- **Kết quả Audit:**
    - **Convention Check:** PASS (Khớp 100% style dự án).
    - **Security Check:** PASS (Mã hóa khóa sinh trắc học an toàn).
- **Elite Recommendation (Gợi ý tinh tế):**
    - *"Tôi đã viết code theo GetX của bạn. Tuy nhiên, tôi nhận thấy Pydantic V1 ở Backend đang gặp lỗi hiệu năng khi xử lý JSON lớn. Bạn có muốn tôi nâng cấp lên **Pydantic V2** không? (Đây là lựa chọn không bắt buộc)."*

---

## 👤 Bước 5: Quyền quyết định của User
- **Tình huống A (User từ chối):** "Không cần, cứ giữ nguyên Pydantic V1."
    - **Agent:** "Đã rõ. Tôi sẽ giữ nguyên bối cảnh cũ và hoàn tất công việc."
- **Tình huống B (User đồng ý):** "Ok, hãy nâng cấp Backend lên Pydantic V2."
    - **Agent:** Kích hoạt `@python-fastapi-backend` để refactor lại toàn bộ Models.

---

## ✅ Bước 6: Hoàn tất & Đóng gói
- **Hành động:** 
    - Chạy `dart format .` và `ruff format`.
    - Chạy `flutter analyze` để đảm bảo **Zero Warnings**.
    - **Không dùng Git:** Kết thúc phiên làm việc trên Filesystem hiện tại.

---

## 🔥 Tại sao luồng này lại "Elite"?
1. **Zero Context Waste:** Agent hiểu dự án nhanh gấp 3 lần nhờ Symbol Mapping và Turn Compression.
2. **True Agnostic:** Không quan tâm bạn dùng GetX hay Provider, nó sẽ "hóa thân" thành chuyên gia của thư viện đó.
3. **Professional Ethics:** Nó tư vấn cho bạn (Advisor) nhưng luôn phục tùng lựa chọn của bạn (Local-First).
4. **Failure Resilient:** Nếu Native code build lỗi, nó tự động **Backtrack** để tìm nguyên nhân thay vì đoán mò.
