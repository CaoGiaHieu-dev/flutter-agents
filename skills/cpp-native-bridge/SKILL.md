---
name: cpp-native-bridge
description: >-
  High-performance native architect. Covers modern C++ (20/23),
  Dart FFI integration, SIMD optimization, binary size
  governance, and cross-language bridge safety.
---
# C++ & Native Bridge — Performance Protocol

This skill governs native code development and managed-to-native
bridge architecture (Dart FFI, JNI, Swift/ObjC interop).

---

## 1. DART FFI INTEGRATION

When bridging Dart to native code:

- **Use `package:ffigen`** to auto-generate FFI bindings from
  C headers. Do not write bindings manually.
- **Native Assets (hook system):** Use `hook/build.dart` with
  `package:native_toolchain_c` to compile and bundle native
  libraries automatically.
- **Data transfer:**
  - Use `Pointer<Struct>` for structured data.
  - Use `ffi.Utf8` for string transfer.
  - Use `TypedData` for bulk numeric data (zero-copy).
  - JSON serialization across the bridge is FORBIDDEN for
    high-frequency or heavy data.

## 2. MODERN C++ STANDARDS

- **Target C++20 minimum** (C++23 where supported).
- **Error handling:** Use `std::expected` (C++23) or
  `std::optional` for error propagation. No exceptions
  across the FFI boundary.
- **Smart pointers:** `std::unique_ptr` by default.
  `std::shared_ptr` only when shared ownership is proven.

## 3. BINARY SIZE GOVERNANCE

- **Compiler flags:** Use `-Os` or `-Oz` for mobile builds.
- **Strip symbols** from production binaries.
- **Avoid template bloat:** Use `std::span` and type-erasure
  to minimize code duplication from templates.
- **Audit regularly:** Track `.so`/`.dylib` size in CI.

## 4. HARDWARE OPTIMIZATION

- **SIMD:** Optimize hot paths with NEON (ARM) or SSE/AVX
  (Intel) intrinsics. Prove gains with benchmarks.
- **Memory alignment:** Use `alignas(64)` for hot data
  structures to match cache lines.
- **Threading:** Use `std::jthread` for background work.
  Ensure no native thread outlives the managed host
  (Dart VM / JVM detach).

## 5. BRIDGE SAFETY

- **Crash isolation:** Implement signal handlers (Linux/Android)
  or structured exception handling (Windows) at bridge entry.
- **Crash diagnostics:** Capture mini-dumps or stack traces.
  Provide analysis instructions for LLDB/GDB.
- **Memory safety:** Run AddressSanitizer (ASan) and
  ThreadSanitizer (TSan) in CI.

## 6. QUALITY GATE

1. ASan/TSan clean in CI builds.
2. Binary size within project budget.
3. FFI bindings auto-generated (not hand-written).
4. No exceptions thrown across the FFI boundary.
