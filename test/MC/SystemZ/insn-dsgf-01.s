# RUN: llvm-mc -triple s390x-linux-gnu -show-encoding %s | FileCheck %s

#CHECK: dsgf	%r0, -524288            # encoding: [0xe3,0x00,0x00,0x00,0x80,0x1d]
#CHECK: dsgf	%r0, -1                 # encoding: [0xe3,0x00,0x0f,0xff,0xff,0x1d]
#CHECK: dsgf	%r0, 0                  # encoding: [0xe3,0x00,0x00,0x00,0x00,0x1d]
#CHECK: dsgf	%r0, 1                  # encoding: [0xe3,0x00,0x00,0x01,0x00,0x1d]
#CHECK: dsgf	%r0, 524287             # encoding: [0xe3,0x00,0x0f,0xff,0x7f,0x1d]
#CHECK: dsgf	%r0, 0(%r1)             # encoding: [0xe3,0x00,0x10,0x00,0x00,0x1d]
#CHECK: dsgf	%r0, 0(%r15)            # encoding: [0xe3,0x00,0xf0,0x00,0x00,0x1d]
#CHECK: dsgf	%r0, 524287(%r1,%r15)   # encoding: [0xe3,0x01,0xff,0xff,0x7f,0x1d]
#CHECK: dsgf	%r0, 524287(%r15,%r1)   # encoding: [0xe3,0x0f,0x1f,0xff,0x7f,0x1d]
#CHECK: dsgf	%r14, 0                 # encoding: [0xe3,0xe0,0x00,0x00,0x00,0x1d]

	dsgf	%r0, -524288
	dsgf	%r0, -1
	dsgf	%r0, 0
	dsgf	%r0, 1
	dsgf	%r0, 524287
	dsgf	%r0, 0(%r1)
	dsgf	%r0, 0(%r15)
	dsgf	%r0, 524287(%r1,%r15)
	dsgf	%r0, 524287(%r15,%r1)
	dsgf	%r14, 0