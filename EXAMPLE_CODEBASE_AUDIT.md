# 🔍 Elite Agent Example: Full Codebase Audit & Governance (v9.0)

Ví dụ này minh họa cách bộ Agents thực hiện đợt kiểm tra tổng thể và quản trị dự án, kết hợp giữa kỹ thuật và kinh doanh.

---

## 📂 Bối cảnh (The Scenario)
Một hệ thống E-commerce đang chạy. Bạn muốn Audit để chuẩn bị cho chiến dịch Sale lớn (Black Friday).

---

## 📊 Bước 1: Business Impact & Prioritization
**Agent:** `@product-manager-toolkit` (PM/BA) đánh giá.

- **Hành động:** Phân tích `RICE Score` cho các lỗi tồn đọng.
- **Business Arbitration:** Xác định lỗi "Giỏ hàng bị chậm" có `Impact: High` và `Effort: Medium`. Ưu tiên xử lý trước các lỗi UI nhỏ.
- **User Feedback Loop:** Đọc log từ Sentry/Firebase để xác định 15% User bị crash khi thanh toán bằng Apple Pay.

---

## 🛡️ Bước 2: Hardware-Aware & Security Audit
**Agent:** `@qa-code-review` thực hiện quét sâu.

- **Hardware Audit:** Chạy profiling trên thiết bị cấu hình thấp. Phát hiện `ProductList` gây lag do không tối ưu Image Cache.
- **Security Audit (Zero-Trust):** Phát hiện 3 chỗ dùng toán tử `!` (Force Unwrap) trong Flutter gây nguy cơ Crash (Red Screen).
- **Process QC:** Flag lỗi "Scope Creep" khi phát hiện một số code cũ chứa các tính năng chưa bao giờ được liệt kê trong PRD.

---

## 🏛️ Bước 3: Architectural Stability Index
**Agent:** `@clean-architecture-solid` đánh giá độ bền vững.

- **Stability Index:** Phát hiện file `OrderService` là một "God Class" (thay đổi quá thường xuyên, phụ thuộc quá nhiều).
- **Directional Scan:** Phát hiện lỗi "Upward Import": Domain layer đang import thư viện UI.
- **Decision:** Đề xuất một **ADR** để tách nhỏ `OrderService` thành các Sub-modules.

---

## 🤖 Bước 4: Knowledge Mapping (RAG-Ready)
**Agent:** `@docs-architect` tối ưu hóa tri thức.

- **Stale Doc Audit:** Phát hiện file `SETUP.md` đã cũ 6 tháng so với phiên bản Flutter hiện tại. Đánh dấu `[LEGACY]` và viết bản mới.
- **Mermaid Mapping:** Tự động vẽ lại Sequence Diagram cho luồng Thanh toán (Payment Flow) để AI dễ dàng "hiểu" kiến trúc trong tương lai.

---

## ✅ Bước 5: Kết quả & Đề xuất (Executive Summary)
Agent trình bày báo cáo dưới dạng **Sovereign Report**:

1. **Vấn đề nghiêm trọng:** Lỗi Crash Apple Pay (Priority 1).
2. **Nợ kỹ thuật:** God Class `OrderService` (Cần refactor trong Sprint tới).
3. **ROI:** Nếu sửa `ProductList` lag, tỉ lệ chuyển đổi (Conversion Rate) dự kiến tăng 5%.

---

## 💡 Triết lý "Sovereign Audit"
Agent không chỉ tìm lỗi code, nó tìm **Rủi ro Kinh doanh (Business Risk)** và **Lỗ hổng Tri thức (Knowledge Gaps)**. Nó giúp bạn quản lý dự án như một CTO/CPO thực thụ.
