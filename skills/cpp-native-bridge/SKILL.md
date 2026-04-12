---
name: cpp-native-bridge
description: High-Performance Native Architect. Expert in Modern C++ (23), 
             Hardware-Optimized SIMD, and Memory-Safe Zero-Copy Bridging.
---
# 🚀 High-Performance Native & Bridge Architecture Protocol (v5.0)

This protocol enforces elite, hardware-level optimization and memory safety 
at the language boundary (Dart/Swift/JVM to C++).

---

## 🏗️ PHASE 1: MODERN C++ & MEMORY INTEGRITY
- **C++20/23 Mandates:** Use `std::span` for safe views, `std::expected` for 
  functional error handling, and `consteval` for compile-time validation.
- **Strict RAII:** Raw `new` and `delete` are FORBIDDEN. Use smart pointers 
  (`std::unique_ptr`). Prefer stack allocation or custom pool allocators.
- **Boundary Safety:** Never let an exception escape the bridge. Catch 
  all at the entry point and translate into the target language's errors.

## ⚡ PHASE 2: HARDWARE-LEVEL OPTIMIZATION (Elite)
- **SIMD Intrinsics:** Proactively optimize heavy loops using **NEON (ARM)** 
  or **AVX2 (Intel)** intrinsics.
- **Zero-Copy Serialization:** For large data (Images, Audio), use 
  **FlatBuffers** or raw pointers with shared memory. Never use JSON.
- **Cache-Line Alignment:** Align hot data structures to 64-byte boundaries 
  to prevent false sharing and minimize cache misses.
- **Branchless Logic:** Use lookup tables or bitwise operations in hot paths.

## 🌉 PHASE 3: THE BRIDGE (FFI/JNI)
- **Dart FFI Excellence:** Use `dart:ffi` with Pointer-based access. Automate 
  bindings using `ffigen`.
- **Background Workers:** Heavy C++ computation MUST happen in background 
  threads (pthreads/std::jthread) to keep the UI thread responsive.

## ✅ PHASE 4: PERFORMANCE QUALITY GATE
1. **Asan/Tsan:** Mandatory audit for memory leaks and data races.
2. **Google Benchmark:** Prove performance gains for every hot path.
3. **80-Column Rule:** All docs and C++ code must follow 80-column wrapping.
