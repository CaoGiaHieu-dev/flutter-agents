---
name: cpp-native-bridge
description: Chuyên gia C++ xử lý hệ thống lõi tốc độ cao, giao tiếp trực tiếp với Dart FFI và cấu hình Android JNI an toàn.
risk: critical
tags: ["cpp", "jni", "ffi", "performance", "dart"]
---
# C++ & Native Bridge Protocol

## When to use this skill
- Implementing heavy algorithms (e.g., computer vision, audio processing, matrix math).
- Creating bindings between C++ libraries and Dart/Flutter or Java/Kotlin.

## How to use it (Strict Execution Rules)

### 1. Dart FFI (For Flutter Integration)
- **Bypass Platform Channels:** For heavy payloads, DO NOT use Platform Channels due to serialization overhead. Use `dart:ffi`.
- **Memory Management:** Allocate memory directly on the native heap using `malloc` or `calloc`. Ensure every allocation has a corresponding `free` to prevent memory leaks.
- **Binding Generation:** Use the `ffigen` package to parse C++ `.h` header files and auto-generate Dart bindings. Do not write large binding files manually.

### 2. Android JNI Guidelines
- **Reference Management:** JNI is highly susceptible to memory leaks in the JVM. You MUST strictly manage `LocalRef` and `GlobalRef`. Delete local references immediately inside loops.
- **CMake Standards:** Configure CMake using modern standards: `set(CMAKE_CXX_STANDARD 17)` and `set(CMAKE_OBJCXX_STANDARD 17)` for Apple platforms.

### 3. Error Handling
- Never let C++ exceptions cross the language boundary (into Dart or Java). Catch all exceptions within the C++ layer and return standardized error codes or error structs.
