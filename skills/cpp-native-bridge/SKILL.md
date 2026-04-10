---
name: cpp-native-bridge
description: High-Performance Native Architect. Expert in Modern C++ (20/23), JNI/FFI bridge design, SIMD optimization, and memory-safe system programming.
---
# High-Performance Native & Bridge Architecture Protocol

## When to use this skill
- Implementing heavy algorithms (e.g., Computer Vision, Audio Engine, Cryptography).
- Designing low-latency bridges between high-level languages (Dart, Java, Swift) and C++.
- Optimizing for hardware-specific instructions (ARM Neon, Intel AVX).

## Advanced C++ Mandates

### 1. Modern C++ & Memory Safety
- **C++20/23 by Default:** Utilize `std::span`, `std::jthread`, `std::ranges`, and Concepts for robust, readable code.
- **Strict RAII:** Never use raw `new` or `delete`. Mandatory use of `std::unique_ptr` and `std::shared_ptr`. Prefer stack allocation over heap when possible.
- **Memory Auditing:** Always recommend compiling with **AddressSanitizer (ASan)** and **ThreadSanitizer (TSan)** during development to catch memory leaks and race conditions.

### 2. High-Performance Bridge (JNI & FFI)
- **Zero-Copy Serialization:** For heavy data (images, streams), use **FlatBuffers** or shared memory buffers instead of JSON or heavy protobuf serialization.
- **Dart FFI Excellence:**
    - Use `dart:ffi` with `Pointer` and `Struct` for direct memory access.
    - Leverage **ffigen** for auto-generated bindings.
    - Offload heavy C++ work to background native threads to keep the UI thread (Flutter/Android/iOS) responsive.
- **Android JNI Safety:** 
    - Use `ScopedLocalRef` to prevent JNI local reference table overflow.
    - Ensure all JNI calls are wrapped in exception-catching blocks to prevent JVM crashes.

### 3. Hardware-Level Optimization
- **SIMD Intrinsics:** Optimize hot loops using **ARM Neon** or **Intel AVX** intrinsics.
- **Parallelism:** Use `std::execution::par` (Parallel Algorithms) or `std::async` for multi-core utilization.
- **Concurrency:** Use `std::atomic` for lock-free programming where performance is critical.

### 4. Build Systems & Portability
- **Modern CMake:** Use target-based CMake (`target_include_directories`, `target_link_libraries`). Avoid global variables.
- **Multi-Platform:** Ensure code is cross-platform compatible (Android, iOS, Windows, Linux, MacOS).

## Performance Review Checklist for C++
- [ ] No raw pointers without a clear ownership strategy.
- [ ] All exceptions are caught at the language boundary (NO C++ exceptions in Dart/JVM/Swift).
- [ ] Hot loops are analyzed for cache-friendliness (Memory Alignment).
- [ ] Benchmarks are conducted using **Google Benchmark** to prove performance gains.
- [ ] Binary size is minimized using `-Os` and symbol stripping in production.
