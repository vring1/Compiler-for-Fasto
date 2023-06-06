	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function incr
f.incr:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_1_,x10
# 	mv	_param_b_2_,x11
# 	mv	_plus_L_4_,_param_a_1_
# 	mv	_plus_R_5_,_param_b_2_
	add	x10, x10, x11
# was:	add	_incrres_3_, _plus_L_4_, _plus_R_5_
# 	mv	x10,_incrres_3_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function writeInt
f.writeInt:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_n_6_,x10
	mv	x18, x10
# was:	mv	_tmp_8_, _param_n_6_
# 	mv	_writeIntres_7_,_tmp_8_
	mv	x10, x18
# was:	mv	x10, _writeIntres_7_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _writeIntres_7_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
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
	li	x13, 3
# was:	li	_size_11_, 3
	mv	x10, x3
# was:	mv	_let_a_10_, x3
	slli	x12, x13, 2
# was:	slli	_tmp_14_, _size_11_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_14_, _tmp_14_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_14_
	sw	x13, 0(x10)
# was:	sw	_size_11_, 0(_let_a_10_)
	addi	x13, x10, 4
# was:	addi	_addr_12_, _let_a_10_, 4
	li	x12, 1
# was:	li	_tmp_13_, 1
	sw	x12, 0(x13)
# was:	sw	_tmp_13_, 0(_addr_12_)
	addi	x13, x13, 4
# was:	addi	_addr_12_, _addr_12_, 4
	li	x12, 2
# was:	li	_tmp_13_, 2
	sw	x12, 0(x13)
# was:	sw	_tmp_13_, 0(_addr_12_)
	addi	x13, x13, 4
# was:	addi	_addr_12_, _addr_12_, 4
	li	x12, 3
# was:	li	_tmp_13_, 3
	sw	x12, 0(x13)
# was:	sw	_tmp_13_, 0(_addr_12_)
	addi	x13, x13, 4
# was:	addi	_addr_12_, _addr_12_, 4
# 	mv	_arr_17_,_let_a_10_
	lw	x19, 0(x10)
# was:	lw	_size_16_, 0(_arr_17_)
	mv	x20, x3
# was:	mv	_let_b_15_, x3
	slli	x12, x19, 2
# was:	slli	_tmp_28_, _size_16_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_28_, _tmp_28_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_28_
	sw	x19, 0(x20)
# was:	sw	_size_16_, 0(_let_b_15_)
	addi	x21, x20, 4
# was:	addi	_addrg_21_, _let_b_15_, 4
	mv	x22, x0
# was:	mv	_i_23_, x0
	addi	x18, x10, 4
# was:	addi	_elem_18_, _arr_17_, 4
	li	x10, 1
# was:	li	_res_19_, 1
l.loop_beg_25_:
	bge	x22, x19, l.loop_end_26_
# was:	bge	_i_23_, _size_16_, l.loop_end_26_
	lw	x10, 0(x18)
# was:	lw	_res_19_, 0(_elem_18_)
	addi	x18, x18, 4
# was:	addi	_elem_18_, _elem_18_, 4
# 	mv	x10,_res_19_
# 	mv	x11,_res2_20_
	mv	x12, x23
# was:	mv	x12, _acc_24_
	jal	f.incr
# was:	jal	f.incr, x10 x11 x12
# 	mv	_tmp_27_,x10
	mv	x11, x10
# was:	mv	_res2_20_, _tmp_27_
	sw	x11, 0(x21)
# was:	sw	_res2_20_, 0(_addrg_21_)
	addi	x21, x21, 4
# was:	addi	_addrg_21_, _addrg_21_, 4
	addi	x22, x22, 1
# was:	addi	_i_23_, _i_23_, 1
	lw	x0, -4(x21)
# was:	lw	_tmp_22_, -4(_addrg_21_)
	j	l.loop_beg_25_
l.loop_end_26_:
	sw	x19, 0(x20)
# was:	sw	_size_16_, 0(_let_b_15_)
	mv	x10, x20
# was:	mv	_arr_30_, _let_b_15_
	lw	x19, 0(x10)
# was:	lw	_size_29_, 0(_arr_30_)
	mv	x18, x3
# was:	mv	_mainres_9_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_38_, _size_29_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_38_, _tmp_38_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_38_
	sw	x19, 0(x18)
# was:	sw	_size_29_, 0(_mainres_9_)
	addi	x20, x18, 4
# was:	addi	_addrg_33_, _mainres_9_, 4
	mv	x21, x0
# was:	mv	_i_34_, x0
	addi	x22, x10, 4
# was:	addi	_elem_31_, _arr_30_, 4
l.loop_beg_35_:
	bge	x21, x19, l.loop_end_36_
# was:	bge	_i_34_, _size_29_, l.loop_end_36_
	lw	x10, 0(x22)
# was:	lw	_res_32_, 0(_elem_31_)
	addi	x22, x22, 4
# was:	addi	_elem_31_, _elem_31_, 4
# 	mv	x10,_res_32_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_37_,x10
# 	mv	_res_32_,_tmp_37_
	sw	x10, 0(x20)
# was:	sw	_res_32_, 0(_addrg_33_)
	addi	x20, x20, 4
# was:	addi	_addrg_33_, _addrg_33_, 4
	addi	x21, x21, 1
# was:	addi	_i_34_, _i_34_, 1
	j	l.loop_beg_35_
l.loop_end_36_:
	mv	x10, x18
# was:	mv	x10, _mainres_9_
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