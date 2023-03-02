# RUN: llvm-mc -triple s390x-linux-gnu -show-encoding %s | FileCheck %s

#CHECK: alfi	%r0, 0                  # encoding: [0xc2,0x0b,0x00,0x00,0x00,0x00]
#CHECK: alfi	%r0, 4294967295         # encoding: [0xc2,0x0b,0xff,0xff,0xff,0xff]
#CHECK: alfi	%r15, 0                 # encoding: [0xc2,0xfb,0x00,0x00,0x00,0x00]

	alfi	%r0, 0
	alfi	%r0, (1 << 32) - 1
	alfi	%r15, 0
