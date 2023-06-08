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
	li	x10, 5
# was:	li	_size_3_, 5
	mv	x14, x3
# was:	mv	_let_a_2_, x3
	addi	x11, x10, 3
# was:	addi	_tmp_6_, _size_3_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_6_, _tmp_6_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_6_, _tmp_6_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_6_
	sw	x10, 0(x14)
# was:	sw	_size_3_, 0(_let_a_2_)
	addi	x10, x14, 4
# was:	addi	_addr_4_, _let_a_2_, 4
	li	x11, 1
# was:	li	_tmp_5_, 1
	sb	x11, 0(x10)
# was:	sb	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 1
# was:	addi	_addr_4_, _addr_4_, 1
	li	x11, 0
# was:	li	_tmp_5_, 0
	sb	x11, 0(x10)
# was:	sb	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 1
# was:	addi	_addr_4_, _addr_4_, 1
	li	x11, 1
# was:	li	_tmp_5_, 1
	sb	x11, 0(x10)
# was:	sb	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 1
# was:	addi	_addr_4_, _addr_4_, 1
	li	x11, 1
# was:	li	_tmp_5_, 1
	sb	x11, 0(x10)
# was:	sb	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 1
# was:	addi	_addr_4_, _addr_4_, 1
	li	x11, 0
# was:	li	_tmp_5_, 0
	sb	x11, 0(x10)
# was:	sb	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 1
# was:	addi	_addr_4_, _addr_4_, 1
# 	mv	_arr_9_,_let_a_2_
	lw	x12, 0(x14)
# was:	lw	_size_8_, 0(_arr_9_)
	mv	x13, x3
# was:	mv	_let_b_7_, x3
	addi	x10, x12, 3
# was:	addi	_tmp_23_, _size_8_, 3
	andi	x10, x10, -4
# was:	andi	_tmp_23_, _tmp_23_, -4
	addi	x10, x10, 4
# was:	addi	_tmp_23_, _tmp_23_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_23_
	sw	x12, 0(x13)
# was:	sw	_size_8_, 0(_let_b_7_)
	addi	x11, x13, 4
# was:	addi	_addrg_13_, _let_b_7_, 4
	mv	x10, x0
# was:	mv	_i_15_, x0
	addi	x14, x14, 4
# was:	addi	_elem_10_, _arr_9_, 4
	li	x15, 1
# was:	li	_res_11_, 1
l.loop_beg_16_:
	bge	x10, x12, l.loop_end_17_
# was:	bge	_i_15_, _size_8_, l.loop_end_17_
	lbu	x16, 0(x14)
# was:	lbu	_res2_12_, 0(_elem_10_)
	addi	x14, x14, 1
# was:	addi	_elem_10_, _elem_10_, 1
# 	mv	_and_L_19_,_res_11_
	beq	x15, x0, l.false_21_
# was:	beq	_and_L_19_, x0, l.false_21_
# 	mv	_and_R_20_,_res2_12_
	beq	x16, x0, l.false_21_
# was:	beq	_and_R_20_, x0, l.false_21_
	li	x15, 1
# was:	li	_fun_arg_res_18_, 1
	j	l.end_22_
l.false_21_:
	li	x15, 0
# was:	li	_fun_arg_res_18_, 0
l.end_22_:
# 	mv	_res_11_,_fun_arg_res_18_
	sb	x15, 0(x11)
# was:	sb	_res_11_, 0(_addrg_13_)
	addi	x11, x11, 1
# was:	addi	_addrg_13_, _addrg_13_, 1
	addi	x10, x10, 1
# was:	addi	_i_15_, _i_15_, 1
	lbu	x0, -1(x11)
# was:	lbu	_tmp_14_, -1(_addrg_13_)
	j	l.loop_beg_16_
l.loop_end_17_:
	sw	x12, 0(x13)
# was:	sw	_size_8_, 0(_let_b_7_)
# 	mv	_arr_25_,_let_b_7_
	lw	x19, 0(x13)
# was:	lw	_size_24_, 0(_arr_25_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	addi	x10, x19, 3
# was:	addi	_tmp_35_, _size_24_, 3
	andi	x10, x10, -4
# was:	andi	_tmp_35_, _tmp_35_, -4
	addi	x10, x10, 4
# was:	addi	_tmp_35_, _tmp_35_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_35_
	sw	x19, 0(x18)
# was:	sw	_size_24_, 0(_mainres_1_)
	addi	x21, x18, 4
# was:	addi	_addrg_28_, _mainres_1_, 4
	mv	x20, x0
# was:	mv	_i_29_, x0
	addi	x22, x13, 4
# was:	addi	_elem_26_, _arr_25_, 4
l.loop_beg_30_:
	bge	x20, x19, l.loop_end_31_
# was:	bge	_i_29_, _size_24_, l.loop_end_31_
	lbu	x23, 0(x22)
# was:	lbu	_res_27_, 0(_elem_26_)
	addi	x22, x22, 1
# was:	addi	_elem_26_, _elem_26_, 1
# 	mv	_tmp_33_,_res_27_
# 	mv	_fun_arg_res_32_,_tmp_33_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x23, x0, l.wBoolF_34_
# was:	bne	_fun_arg_res_32_, x0, l.wBoolF_34_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_34_:
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_res_27_,_fun_arg_res_32_
	sb	x23, 0(x21)
# was:	sb	_res_27_, 0(_addrg_28_)
	addi	x21, x21, 1
# was:	addi	_addrg_28_, _addrg_28_, 1
	addi	x20, x20, 1
# was:	addi	_i_29_, _i_29_, 1
	j	l.loop_beg_30_
l.loop_end_31_:
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