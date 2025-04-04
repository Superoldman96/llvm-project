; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 5
; RUN: llc < %s -march=nvptx64 -mcpu=sm_90a -mattr=+ptx80 | FileCheck %s
; RUN: %if ptxas-12.0 %{ llc < %s -march=nvptx64 -mcpu=sm_90a -mattr=+ptx80 | %ptxas-verify -arch=sm_90a %}

target triple = "nvptx64-nvidia-cuda"

declare void @llvm.nvvm.wgmma.fence.sync.aligned()

define void @test_wgmma_fence_sync_aligned() {
; CHECK-LABEL: test_wgmma_fence_sync_aligned(
; CHECK:       {
; CHECK-EMPTY:
; CHECK-EMPTY:
; CHECK-NEXT:  // %bb.0:
; CHECK-NEXT:    wgmma.fence.sync.aligned;
; CHECK-NEXT:    ret;
  call void @llvm.nvvm.wgmma.fence.sync.aligned()
  ret void
}

declare void @llvm.nvvm.wgmma.commit_group.sync.aligned()

define void @test_wgmma_commit_group_sync_aligned() {
; CHECK-LABEL: test_wgmma_commit_group_sync_aligned(
; CHECK:       {
; CHECK-EMPTY:
; CHECK-EMPTY:
; CHECK-NEXT:  // %bb.0:
; CHECK-NEXT:    wgmma.commit_group.sync.aligned;
; CHECK-NEXT:    ret;
  call void @llvm.nvvm.wgmma.commit_group.sync.aligned()
  ret void
}

declare void @llvm.nvvm.wgmma.wait_group.sync.aligned(i64)

define void @test_wgmma_wait_group_sync_aligned() {
; CHECK-LABEL: test_wgmma_wait_group_sync_aligned(
; CHECK:       {
; CHECK-EMPTY:
; CHECK-EMPTY:
; CHECK-NEXT:  // %bb.0:
; CHECK-NEXT:    wgmma.wait_group.sync.aligned 10;
; CHECK-NEXT:    ret;
  call void @llvm.nvvm.wgmma.wait_group.sync.aligned(i64 10)
  ret void
}
