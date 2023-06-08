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
	li	x11, 3
# was:	li	_size_3_, 3
	mv	x14, x3
# was:	mv	_let_a_2_, x3
	slli	x10, x11, 2
# was:	slli	_tmp_6_, _size_3_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_6_, _tmp_6_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_6_
	sw	x11, 0(x14)
# was:	sw	_size_3_, 0(_let_a_2_)
	addi	x10, x14, 4
# was:	addi	_addr_4_, _let_a_2_, 4
	li	x11, 1
# was:	li	_tmp_5_, 1
	sw	x11, 0(x10)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 4
# was:	addi	_addr_4_, _addr_4_, 4
	li	x11, 2
# was:	li	_tmp_5_, 2
	sw	x11, 0(x10)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 4
# was:	addi	_addr_4_, _addr_4_, 4
	li	x11, 3
# was:	li	_tmp_5_, 3
	sw	x11, 0(x10)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 4
# was:	addi	_addr_4_, _addr_4_, 4
# 	mv	_arr_9_,_let_a_2_
	lw	x11, 0(x14)
# was:	lw	_size_8_, 0(_arr_9_)
	mv	x10, x3
# was:	mv	_let_b_7_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_21_, _size_8_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_21_, _tmp_21_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_21_
	sw	x11, 0(x10)
# was:	sw	_size_8_, 0(_let_b_7_)
	addi	x13, x10, 4
# was:	addi	_addrg_13_, _let_b_7_, 4
	mv	x12, x0
# was:	mv	_i_15_, x0
	addi	x14, x14, 4
# was:	addi	_elem_10_, _arr_9_, 4
	li	x15, 1
# was:	li	_res_11_, 1
l.loop_beg_16_:
	bge	x12, x11, l.loop_end_17_
# was:	bge	_i_15_, _size_8_, l.loop_end_17_
	lw	x16, 0(x14)
# was:	lw	_res2_12_, 0(_elem_10_)
	addi	x14, x14, 4
# was:	addi	_elem_10_, _elem_10_, 4
# 	mv	_plus_L_19_,_res_11_
# 	mv	_plus_R_20_,_res2_12_
	add	x15, x15, x16
# was:	add	_fun_arg_res_18_, _plus_L_19_, _plus_R_20_
# 	mv	_res_11_,_fun_arg_res_18_
	sw	x15, 0(x13)
# was:	sw	_res_11_, 0(_addrg_13_)
	addi	x13, x13, 4
# was:	addi	_addrg_13_, _addrg_13_, 4
	addi	x12, x12, 1
# was:	addi	_i_15_, _i_15_, 1
	lw	x0, -4(x13)
# was:	lw	_tmp_14_, -4(_addrg_13_)
	j	l.loop_beg_16_
l.loop_end_17_:
	sw	x11, 0(x10)
# was:	sw	_size_8_, 0(_let_b_7_)
# 	mv	_arr_23_,_let_b_7_
	lw	x18, 0(x10)
# was:	lw	_size_22_, 0(_arr_23_)
	mv	x19, x3
# was:	mv	_mainres_1_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_32_, _size_22_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_32_, _tmp_32_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_32_
	sw	x18, 0(x19)
# was:	sw	_size_22_, 0(_mainres_1_)
	addi	x20, x19, 4
# was:	addi	_addrg_26_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_27_, x0
	addi	x22, x10, 4
# was:	addi	_elem_24_, _arr_23_, 4
l.loop_beg_28_:
	bge	x21, x18, l.loop_end_29_
# was:	bge	_i_27_, _size_22_, l.loop_end_29_
	lw	x23, 0(x22)
# was:	lw	_res_25_, 0(_elem_24_)
	addi	x22, x22, 4
# was:	addi	_elem_24_, _elem_24_, 4
# 	mv	_tmp_31_,_res_25_
# 	mv	_fun_arg_res_30_,_tmp_31_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_30_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_25_,_fun_arg_res_30_
	sw	x23, 0(x20)
# was:	sw	_res_25_, 0(_addrg_26_)
	addi	x20, x20, 4
# was:	addi	_addrg_26_, _addrg_26_, 4
	addi	x21, x21, 1
# was:	addi	_i_27_, _i_27_, 1
	j	l.loop_beg_28_
l.loop_end_29_:
	mv	x10, x19
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