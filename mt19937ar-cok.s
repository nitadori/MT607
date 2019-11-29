	.text
	.file	"mt19937ar-cok.c"
	.globl	init_genrand            # -- Begin function init_genrand
	.p2align	4, 0x90
	.type	init_genrand,@function
init_genrand:                           # @init_genrand
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	movl	%edi, state(%rip)
	movl	$1, %eax
	movl	$2, %ecx
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	%edi, %edx
	shrl	$30, %edx
	xorl	%edi, %edx
	imull	$1812433253, %edx, %edx # imm = 0x6C078965
	addq	%rax, %rdx
	movl	%edx, state-4(,%rcx,4)
	cmpq	$624, %rcx              # imm = 0x270
	je	.LBB0_2
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	leaq	1(%rax), %rdi
	movl	%edx, %esi
	shrl	$30, %esi
	xorl	%edx, %esi
	imull	$1812433253, %esi, %edx # imm = 0x6C078965
	addl	%edx, %edi
	addl	%ecx, %edx
	movl	%edx, state(,%rcx,4)
	addq	$2, %rax
	addq	$2, %rcx
	jmp	.LBB0_1
.LBB0_2:
	movl	$1, left(%rip)
	movb	$1, initf(%rip)
	retq
.Lfunc_end0:
	.size	init_genrand, .Lfunc_end0-init_genrand
	.cfi_endproc
                                        # -- End function
	.globl	init_by_array           # -- Begin function init_by_array
	.p2align	4, 0x90
	.type	init_by_array,@function
init_by_array:                          # @init_by_array
	.cfi_startproc
# %bb.0:
	movl	$19650218, state(%rip)  # imm = 0x12BD6AA
	movl	$1, %r8d
	movl	$19650218, %r9d         # imm = 0x12BD6AA
	movl	$2, %ecx
	.p2align	4, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	%r9d, %eax
	shrl	$30, %eax
	xorl	%r9d, %eax
	imull	$1812433253, %eax, %edx # imm = 0x6C078965
	addl	%r8d, %edx
	movl	%edx, state-4(,%rcx,4)
	cmpq	$624, %rcx              # imm = 0x270
	je	.LBB1_2
# %bb.13:                               #   in Loop: Header=BB1_1 Depth=1
	leaq	1(%r8), %r9
	movl	%edx, %eax
	shrl	$30, %eax
	xorl	%edx, %eax
	imull	$1812433253, %eax, %eax # imm = 0x6C078965
	addl	%eax, %r9d
	addl	%ecx, %eax
	movl	%eax, state(,%rcx,4)
	addq	$2, %r8
	addq	$2, %rcx
	jmp	.LBB1_1
.LBB1_2:
	movl	$1, left(%rip)
	cmpl	$623, %esi              # imm = 0x26F
	movl	$624, %r10d             # imm = 0x270
	cmovgl	%esi, %r10d
	movb	$1, initf(%rip)
	movl	$1, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	jmp	.LBB1_3
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_3 Depth=1
	addl	$1, %r9d
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	cmpl	%esi, %edx
	cmovgel	%r8d, %edx
	addl	$-1, %r10d
	je	.LBB1_7
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	movslq	%r9d, %r11
	movl	state-4(,%r11,4), %eax
	movl	%eax, %ecx
	shrl	$30, %ecx
	xorl	%eax, %ecx
	imull	$1664525, %ecx, %eax    # imm = 0x19660D
	xorl	state(,%r11,4), %eax
	movslq	%edx, %rcx
	movl	(%rdi,%rcx,4), %edx
	addl	%ecx, %edx
	addl	%eax, %edx
	movl	%edx, state(,%r11,4)
	leal	1(%rcx), %edx
	cmpl	$623, %r9d              # imm = 0x26F
	jl	.LBB1_4
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=1
	movl	state+2492(%rip), %eax
	movl	%eax, state(%rip)
	movl	$1, %r9d
	jmp	.LBB1_6
.LBB1_7:
	movl	$-623, %ecx             # imm = 0xFD91
	jmp	.LBB1_8
	.p2align	4, 0x90
.LBB1_9:                                #   in Loop: Header=BB1_8 Depth=1
	addl	$1, %r9d
	incl	%ecx
	je	.LBB1_12
.LBB1_8:                                # =>This Inner Loop Header: Depth=1
	movslq	%r9d, %rax
	movl	state-4(,%rax,4), %edx
	movl	%edx, %esi
	shrl	$30, %esi
	xorl	%edx, %esi
	imull	$1566083941, %esi, %edx # imm = 0x5D588B65
	xorl	state(,%rax,4), %edx
	subl	%eax, %edx
	movl	%edx, state(,%rax,4)
	cmpl	$623, %r9d              # imm = 0x26F
	jl	.LBB1_9
# %bb.10:                               #   in Loop: Header=BB1_8 Depth=1
	movl	state+2492(%rip), %eax
	movl	%eax, state(%rip)
	movl	$1, %r9d
	incl	%ecx
	jne	.LBB1_8
.LBB1_12:
	movl	$-2147483648, state(%rip) # imm = 0x80000000
	movl	$1, left(%rip)
	movb	$1, initf(%rip)
	retq
.Lfunc_end1:
	.size	init_by_array, .Lfunc_end1-init_by_array
	.cfi_endproc
                                        # -- End function
	.globl	genrand_int32           # -- Begin function genrand_int32
	.p2align	4, 0x90
	.type	genrand_int32,@function
genrand_int32:                          # @genrand_int32
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	addl	$-1, left(%rip)
	jne	.LBB2_2
# %bb.1:
	callq	next_state
.LBB2_2:
	movq	next(%rip), %rax
	leaq	4(%rax), %rcx
	movq	%rcx, next(%rip)
	movl	(%rax), %eax
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shll	$7, %eax
	andl	$-1658038656, %eax      # imm = 0x9D2C5680
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx       # imm = 0xEFC60000
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$18, %eax
	xorl	%ecx, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	genrand_int32, .Lfunc_end2-genrand_int32
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function next_state
	.type	next_state,@function
next_state:                             # @next_state
	.cfi_startproc
# %bb.0:
	cmpb	$0, initf(%rip)
	jne	.LBB3_4
# %bb.1:
	movl	$5489, state(%rip)      # imm = 0x1571
	movl	$1, %eax
	movl	$5489, %edx             # imm = 0x1571
	movl	$2, %ecx
	.p2align	4, 0x90
.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	movl	%edx, %esi
	shrl	$30, %esi
	xorl	%edx, %esi
	imull	$1812433253, %esi, %esi # imm = 0x6C078965
	addl	%eax, %esi
	movl	%esi, state-4(,%rcx,4)
	cmpq	$624, %rcx              # imm = 0x270
	je	.LBB3_3
# %bb.10:                               #   in Loop: Header=BB3_2 Depth=1
	leaq	1(%rax), %rdx
	movl	%esi, %edi
	shrl	$30, %edi
	xorl	%esi, %edi
	imull	$1812433253, %edi, %esi # imm = 0x6C078965
	addl	%esi, %edx
	addl	%ecx, %esi
	movl	%esi, state(,%rcx,4)
	addq	$2, %rax
	addq	$2, %rcx
	jmp	.LBB3_2
.LBB3_3:
	movl	$1, left(%rip)
	movb	$1, initf(%rip)
.LBB3_4:
	movl	$624, left(%rip)        # imm = 0x270
	movq	$state, next(%rip)
	movl	state(%rip), %edx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB3_5:                                # =>This Inner Loop Header: Depth=1
	andl	$-2147483648, %edx      # imm = 0x80000000
	movl	state+4(%rax), %ecx
	movl	%ecx, %esi
	andl	$2147483646, %esi       # imm = 0x7FFFFFFE
	orl	%edx, %esi
	movl	%ecx, %edx
	andl	$1, %edx
	negl	%edx
	andl	$-1727483681, %edx      # imm = 0x9908B0DF
	xorl	state+1588(%rax), %edx
	shrl	%esi
	xorl	%esi, %edx
	movl	%edx, state(%rax)
	cmpl	$904, %eax              # imm = 0x388
	je	.LBB3_6
# %bb.9:                                #   in Loop: Header=BB3_5 Depth=1
	andl	$-2147483648, %ecx      # imm = 0x80000000
	movl	state+8(%rax), %edx
	movl	%edx, %esi
	andl	$2147483646, %esi       # imm = 0x7FFFFFFE
	orl	%ecx, %esi
	movl	%edx, %ecx
	andl	$1, %ecx
	negl	%ecx
	andl	$-1727483681, %ecx      # imm = 0x9908B0DF
	xorl	state+1592(%rax), %ecx
	shrl	%esi
	xorl	%esi, %ecx
	movl	%ecx, state+4(%rax)
	addq	$8, %rax
	jmp	.LBB3_5
.LBB3_6:
	movl	state-904(%rax), %r8d
	andl	$-2147483648, %ecx      # imm = 0x80000000
	movl	$3, %edi
	.p2align	4, 0x90
.LBB3_7:                                # =>This Inner Loop Header: Depth=1
	movq	%rdi, %rdx
	movl	state-4(%rax,%rdi,4), %esi
	movl	%esi, %edi
	andl	$2147483646, %edi       # imm = 0x7FFFFFFE
	orl	%ecx, %edi
	shrl	%edi
	movl	%esi, %ecx
	andl	$1, %ecx
	negl	%ecx
	andl	$-1727483681, %ecx      # imm = 0x9908B0DF
	xorl	%r8d, %ecx
	xorl	%edi, %ecx
	movl	%ecx, state-8(%rax,%rdx,4)
	andl	$-2147483648, %esi      # imm = 0x80000000
	movl	state(%rax,%rdx,4), %ecx
	movl	%ecx, %edi
	andl	$2147483646, %edi       # imm = 0x7FFFFFFE
	orl	%esi, %edi
	shrl	%edi
	movl	%ecx, %esi
	andl	$1, %esi
	negl	%esi
	andl	$-1727483681, %esi      # imm = 0x9908B0DF
	xorl	state-912(%rax,%rdx,4), %esi
	xorl	%edi, %esi
	movl	%esi, state-4(%rax,%rdx,4)
	movl	state-908(%rax,%rdx,4), %r8d
	andl	$-2147483648, %ecx      # imm = 0x80000000
	leaq	2(%rdx), %rdi
	cmpl	$399, %edi              # imm = 0x18F
	jne	.LBB3_7
# %bb.8:
	movl	state(%rip), %esi
	movl	%esi, %edi
	andl	$2147483646, %edi       # imm = 0x7FFFFFFE
	orl	%ecx, %edi
	shrl	%edi
	andl	$1, %esi
	negl	%esi
	andl	$-1727483681, %esi      # imm = 0x9908B0DF
	xorl	%r8d, %esi
	xorl	%edi, %esi
	movl	%esi, state(%rax,%rdx,4)
	retq
.Lfunc_end3:
	.size	next_state, .Lfunc_end3-next_state
	.cfi_endproc
                                        # -- End function
	.globl	genrand_int31           # -- Begin function genrand_int31
	.p2align	4, 0x90
	.type	genrand_int31,@function
genrand_int31:                          # @genrand_int31
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	addl	$-1, left(%rip)
	jne	.LBB4_2
# %bb.1:
	callq	next_state
.LBB4_2:
	movq	next(%rip), %rax
	leaq	4(%rax), %rcx
	movq	%rcx, next(%rip)
	movl	(%rax), %eax
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shll	$7, %eax
	andl	$-1658038656, %eax      # imm = 0x9D2C5680
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx       # imm = 0xEFC60000
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$18, %eax
	xorl	%ecx, %eax
	shrl	%eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	genrand_int31, .Lfunc_end4-genrand_int31
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function genrand_real1
.LCPI5_0:
	.quad	4463067230725210112     # double 2.3283064370807974E-10
	.text
	.globl	genrand_real1
	.p2align	4, 0x90
	.type	genrand_real1,@function
genrand_real1:                          # @genrand_real1
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	addl	$-1, left(%rip)
	jne	.LBB5_2
# %bb.1:
	callq	next_state
.LBB5_2:
	movq	next(%rip), %rax
	leaq	4(%rax), %rcx
	movq	%rcx, next(%rip)
	movl	(%rax), %eax
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shll	$7, %eax
	andl	$-1658038656, %eax      # imm = 0x9D2C5680
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx       # imm = 0xEFC60000
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$18, %eax
	xorl	%ecx, %eax
	vcvtusi2sd	%eax, %xmm0, %xmm0
	vmulsd	.LCPI5_0(%rip), %xmm0, %xmm0
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	genrand_real1, .Lfunc_end5-genrand_real1
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function genrand_real2
.LCPI6_0:
	.quad	4463067230724161536     # double 2.3283064365386963E-10
	.text
	.globl	genrand_real2
	.p2align	4, 0x90
	.type	genrand_real2,@function
genrand_real2:                          # @genrand_real2
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	addl	$-1, left(%rip)
	jne	.LBB6_2
# %bb.1:
	callq	next_state
.LBB6_2:
	movq	next(%rip), %rax
	leaq	4(%rax), %rcx
	movq	%rcx, next(%rip)
	movl	(%rax), %eax
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shll	$7, %eax
	andl	$-1658038656, %eax      # imm = 0x9D2C5680
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx       # imm = 0xEFC60000
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$18, %eax
	xorl	%ecx, %eax
	vcvtusi2sd	%eax, %xmm0, %xmm0
	vmulsd	.LCPI6_0(%rip), %xmm0, %xmm0
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	genrand_real2, .Lfunc_end6-genrand_real2
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function genrand_real3
.LCPI7_0:
	.quad	4602678819172646912     # double 0.5
.LCPI7_1:
	.quad	4463067230724161536     # double 2.3283064365386963E-10
	.text
	.globl	genrand_real3
	.p2align	4, 0x90
	.type	genrand_real3,@function
genrand_real3:                          # @genrand_real3
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	addl	$-1, left(%rip)
	jne	.LBB7_2
# %bb.1:
	callq	next_state
.LBB7_2:
	movq	next(%rip), %rax
	leaq	4(%rax), %rcx
	movq	%rcx, next(%rip)
	movl	(%rax), %eax
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shll	$7, %eax
	andl	$-1658038656, %eax      # imm = 0x9D2C5680
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx       # imm = 0xEFC60000
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$18, %eax
	xorl	%ecx, %eax
	vcvtusi2sd	%eax, %xmm0, %xmm0
	vaddsd	.LCPI7_0(%rip), %xmm0, %xmm0
	vmulsd	.LCPI7_1(%rip), %xmm0, %xmm0
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end7:
	.size	genrand_real3, .Lfunc_end7-genrand_real3
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function genrand_res53
.LCPI8_0:
	.quad	4724276009111650304     # double 67108864
.LCPI8_1:
	.quad	4368491638549381120     # double 1.1102230246251565E-16
	.text
	.globl	genrand_res53
	.p2align	4, 0x90
	.type	genrand_res53,@function
genrand_res53:                          # @genrand_res53
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	left(%rip), %eax
	addl	$-1, %eax
	movl	%eax, left(%rip)
	jne	.LBB8_2
# %bb.1:
	callq	next_state
	movl	left(%rip), %eax
.LBB8_2:
	movq	next(%rip), %rdx
	leaq	4(%rdx), %rcx
	movq	%rcx, next(%rip)
	movl	(%rdx), %edx
	movl	%edx, %esi
	shrl	$11, %esi
	xorl	%edx, %esi
	movl	%esi, %edx
	shll	$7, %edx
	andl	$-1658038656, %edx      # imm = 0x9D2C5680
	xorl	%esi, %edx
	movl	%edx, %esi
	shll	$15, %esi
	andl	$-272236544, %esi       # imm = 0xEFC60000
	xorl	%edx, %esi
	movl	%esi, %ebx
	shrl	$18, %ebx
	xorl	%esi, %ebx
	shrl	$5, %ebx
	addl	$-1, %eax
	movl	%eax, left(%rip)
	jne	.LBB8_4
# %bb.3:
	callq	next_state
	movq	next(%rip), %rcx
.LBB8_4:
	leaq	4(%rcx), %rax
	movq	%rax, next(%rip)
	movl	(%rcx), %eax
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shll	$7, %eax
	andl	$-1658038656, %eax      # imm = 0x9D2C5680
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx       # imm = 0xEFC60000
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$18, %eax
	xorl	%ecx, %eax
	shrl	$6, %eax
	vcvtsi2sd	%ebx, %xmm0, %xmm0
	vmulsd	.LCPI8_0(%rip), %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	.LCPI8_1(%rip), %xmm0, %xmm0
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end8:
	.size	genrand_res53, .Lfunc_end8-genrand_res53
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function next_state_avx
.LCPI9_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI9_1:
	.long	2567483615              # 0x9908b0df
	.text
	.globl	next_state_avx
	.p2align	4, 0x90
	.type	next_state_avx,@function
next_state_avx:                         # @next_state_avx
	.cfi_startproc
# %bb.0:
	vmovdqa64	state(%rip), %zmm1
	vmovdqa64	state+64(%rip), %zmm2
	vmovdqa64	state+1600(%rip), %zmm3
	valignd	$13, state+1536(%rip), %zmm3, %zmm4 # zmm4 = mem[13,14,15],zmm3[0,1,2,3,4,5,6,7,8,9,10,11,12]
	valignd	$1, %zmm1, %zmm2, %zmm5 # zmm5 = zmm1[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm2[0]
	vpbroadcastq	.LCPI9_0(%rip), %zmm0 # zmm0 = [9223372034707292159,9223372034707292159,9223372034707292159,9223372034707292159,9223372034707292159,9223372034707292159,9223372034707292159,9223372034707292159]
	vpandq	%zmm0, %zmm5, %zmm5
	vpandnq	%zmm1, %zmm0, %zmm1
	vporq	%zmm1, %zmm5, %zmm1
	vpsrld	$1, %zmm1, %zmm5
	vpslld	$31, %zmm1, %zmm1
	vpmovd2m	%zmm1, %k1
	vpbroadcastd	.LCPI9_1(%rip), %zmm1 # zmm1 = [2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615,2567483615]
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm4, %zmm5, %zmm4
	vmovdqa64	state+128(%rip), %zmm5
	vmovdqa64	state+1664(%rip), %zmm6
	vmovdqa64	%zmm4, state(%rip)
	valignd	$1, %zmm2, %zmm5, %zmm4 # zmm4 = zmm2[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm3, %zmm6, %zmm3 # zmm3 = zmm3[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm4, %zmm4
	vpandnq	%zmm2, %zmm0, %zmm2
	vporq	%zmm2, %zmm4, %zmm2
	vpsrld	$1, %zmm2, %zmm4
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm4, %zmm4 {%k1}
	vpxord	%zmm3, %zmm4, %zmm2
	vmovdqa64	state+192(%rip), %zmm3
	vmovdqa64	state+1728(%rip), %zmm4
	vmovdqa64	%zmm2, state+64(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+256(%rip), %zmm5
	vmovdqa64	state+1792(%rip), %zmm6
	vmovdqa64	%zmm2, state+128(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+320(%rip), %zmm3
	vmovdqa64	state+1856(%rip), %zmm4
	vmovdqa64	%zmm2, state+192(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+384(%rip), %zmm5
	vmovdqa64	state+1920(%rip), %zmm6
	vmovdqa64	%zmm2, state+256(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+448(%rip), %zmm3
	vmovdqa64	state+1984(%rip), %zmm4
	vmovdqa64	%zmm2, state+320(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+512(%rip), %zmm5
	vmovdqa64	state+2048(%rip), %zmm6
	vmovdqa64	%zmm2, state+384(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+576(%rip), %zmm3
	vmovdqa64	state+2112(%rip), %zmm4
	vmovdqa64	%zmm2, state+448(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+640(%rip), %zmm5
	vmovdqa64	state+2176(%rip), %zmm6
	vmovdqa64	%zmm2, state+512(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+704(%rip), %zmm3
	vmovdqa64	state+2240(%rip), %zmm4
	vmovdqa64	%zmm2, state+576(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+768(%rip), %zmm5
	vmovdqa64	state+2304(%rip), %zmm6
	vmovdqa64	%zmm2, state+640(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+832(%rip), %zmm3
	vmovdqa64	state+2368(%rip), %zmm4
	vmovdqa64	%zmm2, state+704(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+896(%rip), %zmm5
	vmovdqa64	state+2432(%rip), %zmm6
	vmovdqa64	%zmm2, state+768(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+960(%rip), %zmm3
	vmovdqa64	state(%rip), %zmm4
	vmovdqa64	%zmm2, state+832(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+1024(%rip), %zmm5
	vmovdqa64	state+64(%rip), %zmm6
	vmovdqa64	%zmm2, state+896(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+1088(%rip), %zmm3
	vmovdqa64	state+128(%rip), %zmm4
	vmovdqa64	%zmm2, state+960(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+1152(%rip), %zmm5
	vmovdqa64	state+192(%rip), %zmm6
	vmovdqa64	%zmm2, state+1024(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+1216(%rip), %zmm3
	vmovdqa64	state+256(%rip), %zmm4
	vmovdqa64	%zmm2, state+1088(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+1280(%rip), %zmm5
	vmovdqa64	state+320(%rip), %zmm6
	vmovdqa64	%zmm2, state+1152(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+1344(%rip), %zmm3
	vmovdqa64	state+384(%rip), %zmm4
	vmovdqa64	%zmm2, state+1216(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+1408(%rip), %zmm5
	vmovdqa64	state+448(%rip), %zmm6
	vmovdqa64	%zmm2, state+1280(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+1472(%rip), %zmm3
	vmovdqa64	state+512(%rip), %zmm4
	vmovdqa64	%zmm2, state+1344(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+1536(%rip), %zmm5
	vmovdqa64	state+576(%rip), %zmm6
	vmovdqa64	%zmm2, state+1408(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+1600(%rip), %zmm3
	vmovdqa64	state+640(%rip), %zmm4
	vmovdqa64	%zmm2, state+1472(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+1664(%rip), %zmm5
	vmovdqa64	state+704(%rip), %zmm6
	vmovdqa64	%zmm2, state+1536(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+1728(%rip), %zmm3
	vmovdqa64	state+768(%rip), %zmm4
	vmovdqa64	%zmm2, state+1600(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+1792(%rip), %zmm5
	vmovdqa64	state+832(%rip), %zmm6
	vmovdqa64	%zmm2, state+1664(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+1856(%rip), %zmm3
	vmovdqa64	state+896(%rip), %zmm4
	vmovdqa64	%zmm2, state+1728(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+1920(%rip), %zmm5
	vmovdqa64	state+960(%rip), %zmm6
	vmovdqa64	%zmm2, state+1792(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+1984(%rip), %zmm3
	vmovdqa64	state+1024(%rip), %zmm4
	vmovdqa64	%zmm2, state+1856(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+2048(%rip), %zmm5
	vmovdqa64	state+1088(%rip), %zmm6
	vmovdqa64	%zmm2, state+1920(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+2112(%rip), %zmm3
	vmovdqa64	state+1152(%rip), %zmm4
	vmovdqa64	%zmm2, state+1984(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+2176(%rip), %zmm5
	vmovdqa64	state+1216(%rip), %zmm6
	vmovdqa64	%zmm2, state+2048(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+2240(%rip), %zmm3
	vmovdqa64	state+1280(%rip), %zmm4
	vmovdqa64	%zmm2, state+2112(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+2304(%rip), %zmm5
	vmovdqa64	state+1344(%rip), %zmm6
	vmovdqa64	%zmm2, state+2176(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state+2368(%rip), %zmm3
	vmovdqa64	state+1408(%rip), %zmm4
	vmovdqa64	%zmm2, state+2240(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm6 # zmm6 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm5
	vporq	%zmm5, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm5
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm5, %zmm5 {%k1}
	vpxord	%zmm6, %zmm5, %zmm2
	vmovdqa64	state+2432(%rip), %zmm5
	vmovdqa64	state+1472(%rip), %zmm6
	vmovdqa64	%zmm2, state+2304(%rip)
	valignd	$1, %zmm3, %zmm5, %zmm2 # zmm2 = zmm3[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm5[0]
	valignd	$13, %zmm4, %zmm6, %zmm4 # zmm4 = zmm4[13,14,15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm3, %zmm0, %zmm3
	vporq	%zmm3, %zmm2, %zmm2
	vpsrld	$1, %zmm2, %zmm3
	vpslld	$31, %zmm2, %zmm2
	vpmovd2m	%zmm2, %k1
	vpxord	%zmm1, %zmm3, %zmm3 {%k1}
	vpxord	%zmm4, %zmm3, %zmm2
	vmovdqa64	state(%rip), %zmm3
	vmovdqa64	state+1536(%rip), %zmm4
	vmovdqa64	%zmm2, state+2368(%rip)
	valignd	$1, %zmm5, %zmm3, %zmm2 # zmm2 = zmm5[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],zmm3[0]
	valignd	$13, %zmm6, %zmm4, %zmm3 # zmm3 = zmm6[13,14,15],zmm4[0,1,2,3,4,5,6,7,8,9,10,11,12]
	vpandq	%zmm0, %zmm2, %zmm2
	vpandnq	%zmm5, %zmm0, %zmm0
	vporq	%zmm0, %zmm2, %zmm0
	vpsrld	$1, %zmm0, %zmm2
	vpslld	$31, %zmm0, %zmm0
	vpmovd2m	%zmm0, %k1
	vpxord	%zmm1, %zmm2, %zmm2 {%k1}
	vpxord	%zmm3, %zmm2, %zmm0
	vmovdqa64	%zmm0, state+2432(%rip)
	vzeroupper
	retq
.Lfunc_end9:
	.size	next_state_avx, .Lfunc_end9-next_state_avx
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI10_0:
	.quad	4463067230724161536     # double 2.3283064365386963E-10
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	vmovapd	.L__const.main.init(%rip), %xmm0
	vmovapd	%xmm0, (%rsp)
	movq	%rsp, %rdi
	movl	$4, %esi
	callq	init_by_array
	movl	$.Lstr, %edi
	callq	puts
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB10_1
	.p2align	4, 0x90
.LBB10_5:                               #   in Loop: Header=BB10_1 Depth=1
	addl	$-1, %ebp
	addl	$1, %ebx
	cmpl	$-1000, %ebp            # imm = 0xFC18
	je	.LBB10_6
.LBB10_1:                               # =>This Inner Loop Header: Depth=1
	movzwl	%bx, %eax
	imull	$52429, %eax, %eax      # imm = 0xCCCD
	shrl	$18, %eax
	leal	(%rax,%rax,4), %eax
	movl	$-4, %r14d
	subl	%eax, %r14d
	addl	$-1, left(%rip)
	jne	.LBB10_3
# %bb.2:                                #   in Loop: Header=BB10_1 Depth=1
	callq	next_state
.LBB10_3:                               #   in Loop: Header=BB10_1 Depth=1
	movq	next(%rip), %rax
	leaq	4(%rax), %rcx
	movq	%rcx, next(%rip)
	movl	(%rax), %eax
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shll	$7, %eax
	andl	$-1658038656, %eax      # imm = 0x9D2C5680
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx       # imm = 0xEFC60000
	xorl	%eax, %ecx
	movl	%ecx, %esi
	shrl	$18, %esi
	xorl	%ecx, %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	cmpw	%bp, %r14w
	jne	.LBB10_5
# %bb.4:                                #   in Loop: Header=BB10_1 Depth=1
	movl	$10, %edi
	callq	putchar
	jmp	.LBB10_5
.LBB10_6:
	movl	$.Lstr.9, %edi
	callq	puts
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB10_7
	.p2align	4, 0x90
.LBB10_11:                              #   in Loop: Header=BB10_7 Depth=1
	addl	$-1, %ebp
	addl	$1, %ebx
	cmpl	$-1000, %ebp            # imm = 0xFC18
	je	.LBB10_12
.LBB10_7:                               # =>This Inner Loop Header: Depth=1
	movzwl	%bx, %eax
	imull	$52429, %eax, %eax      # imm = 0xCCCD
	shrl	$18, %eax
	leal	(%rax,%rax,4), %eax
	movl	$-4, %r14d
	subl	%eax, %r14d
	addl	$-1, left(%rip)
	jne	.LBB10_9
# %bb.8:                                #   in Loop: Header=BB10_7 Depth=1
	callq	next_state
.LBB10_9:                               #   in Loop: Header=BB10_7 Depth=1
	movq	next(%rip), %rax
	leaq	4(%rax), %rcx
	movq	%rcx, next(%rip)
	movl	(%rax), %eax
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shll	$7, %eax
	andl	$-1658038656, %eax      # imm = 0x9D2C5680
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx       # imm = 0xEFC60000
	xorl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$18, %eax
	xorl	%ecx, %eax
	vcvtusi2sd	%eax, %xmm1, %xmm0
	vmulsd	.LCPI10_0(%rip), %xmm0, %xmm0
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	cmpw	%bp, %r14w
	jne	.LBB10_11
# %bb.10:                               #   in Loop: Header=BB10_7 Depth=1
	movl	$10, %edi
	callq	putchar
	jmp	.LBB10_11
.LBB10_12:
	movq	%rsp, %rbx
	movq	%rbx, %rdi
	movl	$4, %esi
	callq	init_by_array
	callq	next_state
	movl	$main.s0, %edi
	movl	$state, %esi
	movl	$2496, %edx             # imm = 0x9C0
	callq	memcpy
	movq	%rbx, %rdi
	movl	$4, %esi
	callq	init_by_array
	callq	next_state_avx
	movl	$main.s1, %edi
	movl	$state, %esi
	movl	$2496, %edx             # imm = 0x9C0
	callq	memcpy
	movl	$.L.str.5, %edi
	callq	puts
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB10_14:                              # =>This Inner Loop Header: Depth=1
	movl	main.s0(,%rbx,4), %edx
	movl	main.s1(,%rbx,4), %ecx
	movl	$.L.str.6, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf
	movl	main.s0(,%rbx,4), %eax
	cmpl	main.s1(,%rbx,4), %eax
	jne	.LBB10_15
# %bb.13:                               #   in Loop: Header=BB10_14 Depth=1
	addq	$1, %rbx
	cmpq	$624, %rbx              # imm = 0x270
	jne	.LBB10_14
# %bb.16:
	xorl	%eax, %eax
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB10_15:
	.cfi_def_cfa_offset 48
	movl	$.L.str.7, %edi
	movl	$.L.str.8, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$309, %edx              # imm = 0x135
	callq	__assert_fail
.Lfunc_end10:
	.size	main, .Lfunc_end10-main
	.cfi_endproc
                                        # -- End function
	.type	state,@object           # @state
	.local	state
	.comm	state,2496,64
	.type	left,@object            # @left
	.data
	.p2align	2
left:
	.long	1                       # 0x1
	.size	left, 4

	.type	initf,@object           # @initf
	.local	initf
	.comm	initf,1,4
	.type	next,@object            # @next
	.local	next
	.comm	next,8,8
	.type	.L__const.main.init,@object # @__const.main.init
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.L__const.main.init:
	.long	291                     # 0x123
	.long	564                     # 0x234
	.long	837                     # 0x345
	.long	1110                    # 0x456
	.size	.L__const.main.init, 16

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%10u "
	.size	.L.str.1, 6

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"%10.8f "
	.size	.L.str.4, 8

	.type	main.s0,@object         # @main.s0
	.local	main.s0
	.comm	main.s0,2496,16
	.type	main.s1,@object         # @main.s1
	.local	main.s1
	.comm	main.s1,2496,16
	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"compare"
	.size	.L.str.5, 8

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"%3d: %08x, %08x\n"
	.size	.L.str.6, 17

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"s0[i] == s1[i]"
	.size	.L.str.7, 15

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"mt19937ar-cok.c"
	.size	.L.str.8, 16

	.type	.L__PRETTY_FUNCTION__.main,@object # @__PRETTY_FUNCTION__.main
.L__PRETTY_FUNCTION__.main:
	.asciz	"int main(void)"
	.size	.L__PRETTY_FUNCTION__.main, 15

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"1000 outputs of genrand_int32()"
	.size	.Lstr, 32

	.type	.Lstr.9,@object         # @str.9
.Lstr.9:
	.asciz	"\n1000 outputs of genrand_real2()"
	.size	.Lstr.9, 33


	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym state
