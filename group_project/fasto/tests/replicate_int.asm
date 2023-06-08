	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -28
	li	x11, 16
# was:	li	_elem_5_, 16
	li	x10, 4
# was:	li	_size_4_, 4
	bge	x10, x0, l.safe_6_
# was:	bge	_size_4_, x0, l.safe_6_
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_6_:
	mv	x12, x3
# was:	mv	_arr_3_, x3
	slli	x13, x10, 2
# was:	slli	_tmp_7_, _size_4_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_7_, _tmp_7_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_7_
	sw	x10, 0(x12)
# was:	sw	_size_4_, 0(_arr_3_)
	mv	x13, x12
# was:	mv	_let_fs_2_, _arr_3_
	sw	x10, 0(x12)
# was:	sw	_size_4_, 0(_arr_3_)
	addi	x12, x12, 4
# was:	addi	_arr_3_, _arr_3_, 4
	mv	x14, x0
# was:	mv	_i_10_, x0
l.loop_beg_8_:
	bge	x14, x10, l.loop_end_9_
# was:	bge	_i_10_, _size_4_, l.loop_end_9_
	sw	x11, 0(x12)
# was:	sw	_elem_5_, 0(_arr_3_)
	addi	x12, x12, 4
# was:	addi	_arr_3_, _arr_3_, 4
	addi	x14, x14, 1
# was:	addi	_i_10_, _i_10_, 1
	j	l.loop_beg_8_
l.loop_end_9_:
	mv	x10, x13
# was:	mv	_arr_12_, _let_fs_2_
	lw	x19, 0(x10)
# was:	lw	_size_11_, 0(_arr_12_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_21_, _size_11_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_21_, _tmp_21_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_21_
	sw	x19, 0(x18)
# was:	sw	_size_11_, 0(_mainres_1_)
	addi	x20, x18, 4
# was:	addi	_addrg_15_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_16_, x0
	addi	x22, x10, 4
# was:	addi	_elem_13_, _arr_12_, 4
l.loop_beg_17_:
	bge	x21, x19, l.loop_end_18_
# was:	bge	_i_16_, _size_11_, l.loop_end_18_
	lw	x23, 0(x22)
# was:	lw	_res_14_, 0(_elem_13_)
	addi	x22, x22, 4
# was:	addi	_elem_13_, _elem_13_, 4
# 	mv	_tmp_20_,_res_14_
# 	mv	_fun_arg_res_19_,_tmp_20_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_19_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_14_,_fun_arg_res_19_
	sw	x23, 0(x20)
# was:	sw	_res_14_, 0(_addrg_15_)
	addi	x20, x20, 4
# was:	addi	_addrg_15_, _addrg_15_, 4
	addi	x21, x21, 1
# was:	addi	_i_16_, _i_16_, 1
	j	l.loop_beg_17_
l.loop_end_18_:
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 28
	lw	x23, -28(x2)
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
f.ord:
	mv	x10, x10
	jr	x1
f.chr:
	andi	x10, x10, 255
	jr	x1
p.putint:
	li	x17, 1
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getint:
	li	x17, 5
	ecall
	jr	x1
p.putchar:
	li	x17, 11
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getchar:
	li	x17, 12
	ecall
	jr	x1
p.putstring:
	lw	x7, 0(x10)
	addi	x6, x10, 4
	add	x7, x6, x7
	li	x17, 11
l.ps_begin:
	bge	x6, x7, l.ps_done
	lbu	x10, 0(x6)
	ecall
	addi	x6, x6, 1
	j	l.ps_begin
l.ps_done:
	jr	x1
p.RuntimeError:
	mv	x6, x10
	li	x17, 4
	la	x10, m.RunErr
	ecall
	li	x17, 1
	mv	x10, x6
	ecall
	li	x17, 4
	la	x10, m.colon_space
	ecall
	mv	x10, x11
	ecall
	la	x10, m.nl
	ecall
	j	l.stop
	.data	
# Fixed strings for runtime I/O
m.RunErr:
	.asciz	"Runtime error at line "
m.colon_space:
	.asciz	": "
m.nl:
	.asciz	"\n"
m.space:
	.asciz	" "
# Message strings for specific errors
m.BadSize:
	.asciz	"negative array size"
m.BadIndex:
	.asciz	"array index out of bounds"
m.DivZero:
	.asciz	"division by zero"
# String literals (including lengths) from program
	.align	2
s.true:
	.word	4
	.asciz	"true"
	.align	2
s.false:
	.word	5
	.asciz	"false"
	.align	2
# Space for Fasto heap
d.heap:
	.space	100000