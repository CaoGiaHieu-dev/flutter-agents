---
name: cpp-native-bridge
description: High-Performance Native Architect. Expert in Modern C++ (23), 
             Hardware-Optimized SIMD, and Binary Size Governance.
---
# 🚀 High-Performance Native & Bridge Architecture Protocol (Legendary Edition)

This protocol enforces hardware-level optimization and extreme resource 
governance for cross-language (Managed to Native) systems.

---

## 🏗️ 1. MODERN C++ & BINARY GOVERNANCE (New)
- **Zero-Waste Compilation:** 
    - MANDATORY use of `-Os` or `-Oz` for mobile binary size optimization.
    - Proactively strip symbols from production binaries.
    - Audit for "Template Bloat" — use `std::span` and type-erasure to 
      minimize code duplication.
- **Modern Standards:** Use C++23 `std::expected` for error handling and 
  `std::print` for structured logging.

## ⚡ 2. HARDWARE-LEVEL OPTIMIZATION
- **SIMD (Elite):** Optimize hot paths with **NEON (ARM)** or **AVX2 
  (Intel)** intrinsics. Prove gains with Google Benchmark.
- **Memory Alignment:** Use `alignas(64)` for hot data structures to match 
  CPU cache lines and prevent false sharing.
- **Zero-Copy FFI:** Use shared memory buffers or FlatBuffers. JSON 
  serialization is FORBIDDEN across the bridge for heavy data.

## 🌉 3. THE BRIDGE & CRASH DIAGNOSTICS (New)
- **Fault Tolerance:** Implement **Signal Handlers** (Android/Linux) or 
  **Structured Exception Handling** (Windows) at the bridge entry.
- **Crash Dumps:** Capture mini-dumps or stack traces during native 
  crashes. Provide automated analysis instructions for LLDB/GDB.
- **Background Integrity:** Heavy computation MUST use `std::jthread`. 
  Ensure no C++ thread continues to run after the managed host (Dart/JVM) 
  has detached.

## ✅ 4. PERFORMANCE QUALITY GATE
1. **Asan/Tsan:** Mandatory checks for memory leaks and data races.
2. **Size Audit:** Verify that the library size does not exceed the project 
   budget.
3. **80-Column Rule:** All docs and C++ code must follow 80-column wrapping.
