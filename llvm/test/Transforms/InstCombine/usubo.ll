; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s

declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64)
declare { i8, i1 } @llvm.usub.with.overflow.i8(i8, i8)

define i1 @test_generic(i64 %a, i64 %b) {
; CHECK-LABEL: @test_generic(
; CHECK-NEXT:    [[OVERFLOW:%.*]] = icmp ult i64 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret i1 [[OVERFLOW]]
;
  %res = tail call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %a, i64 %b)
  %overflow = extractvalue { i64, i1 } %res, 1
  ret i1 %overflow
}

define i1 @test_constant0(i8 %a) {
; CHECK-LABEL: @test_constant0(
; CHECK-NEXT:    ret i1 false
;
  %res = tail call { i8, i1 } @llvm.usub.with.overflow.i8(i8 %a, i8 0)
  %overflow = extractvalue { i8, i1 } %res, 1
  ret i1 %overflow
}

define i1 @test_constant1(i8 %a) {
; CHECK-LABEL: @test_constant1(
; CHECK-NEXT:    [[OVERFLOW:%.*]] = icmp eq i8 [[A:%.*]], 0
; CHECK-NEXT:    ret i1 [[OVERFLOW]]
;
  %res = tail call { i8, i1 } @llvm.usub.with.overflow.i8(i8 %a, i8 1)
  %overflow = extractvalue { i8, i1 } %res, 1
  ret i1 %overflow
}

define i1 @test_constant2(i8 %a) {
; CHECK-LABEL: @test_constant2(
; CHECK-NEXT:    [[OVERFLOW:%.*]] = icmp ult i8 [[A:%.*]], 2
; CHECK-NEXT:    ret i1 [[OVERFLOW]]
;
  %res = tail call { i8, i1 } @llvm.usub.with.overflow.i8(i8 %a, i8 2)
  %overflow = extractvalue { i8, i1 } %res, 1
  ret i1 %overflow
}

define i1 @test_constant3(i8 %a) {
; CHECK-LABEL: @test_constant3(
; CHECK-NEXT:    [[OVERFLOW:%.*]] = icmp ult i8 [[A:%.*]], 3
; CHECK-NEXT:    ret i1 [[OVERFLOW]]
;
  %res = tail call { i8, i1 } @llvm.usub.with.overflow.i8(i8 %a, i8 3)
  %overflow = extractvalue { i8, i1 } %res, 1
  ret i1 %overflow
}

define i1 @test_constant4(i8 %a) {
; CHECK-LABEL: @test_constant4(
; CHECK-NEXT:    [[OVERFLOW:%.*]] = icmp ult i8 [[A:%.*]], 4
; CHECK-NEXT:    ret i1 [[OVERFLOW]]
;
  %res = tail call { i8, i1 } @llvm.usub.with.overflow.i8(i8 %a, i8 4)
  %overflow = extractvalue { i8, i1 } %res, 1
  ret i1 %overflow
}


define i1 @test_constant127(i8 %a) {
; CHECK-LABEL: @test_constant127(
; CHECK-NEXT:    [[OVERFLOW:%.*]] = icmp ult i8 [[A:%.*]], 127
; CHECK-NEXT:    ret i1 [[OVERFLOW]]
;
  %res = tail call { i8, i1 } @llvm.usub.with.overflow.i8(i8 %a, i8 127)
  %overflow = extractvalue { i8, i1 } %res, 1
  ret i1 %overflow
}

define i1 @test_constant128(i8 %a) {
; CHECK-LABEL: @test_constant128(
; CHECK-NEXT:    [[OVERFLOW:%.*]] = icmp sgt i8 [[A:%.*]], -1
; CHECK-NEXT:    ret i1 [[OVERFLOW]]
;
  %res = tail call { i8, i1 } @llvm.usub.with.overflow.i8(i8 %a, i8 128)
  %overflow = extractvalue { i8, i1 } %res, 1
  ret i1 %overflow
}

define i1 @test_constant255(i8 %a) {
; CHECK-LABEL: @test_constant255(
; CHECK-NEXT:    [[OVERFLOW:%.*]] = icmp ne i8 [[A:%.*]], -1
; CHECK-NEXT:    ret i1 [[OVERFLOW]]
;
  %res = tail call { i8, i1 } @llvm.usub.with.overflow.i8(i8 %a, i8 255)
  %overflow = extractvalue { i8, i1 } %res, 1
  ret i1 %overflow
}

