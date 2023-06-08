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
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
# 	mv	_size_15_,_let_n_2_
	bge	x10, x0, l.safe_16_
# was:	bge	_size_15_, x0, l.safe_16_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_16_:
	mv	x15, x3
# was:	mv	_arr_5_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_21_, _size_15_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_21_, _tmp_21_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_21_
	sw	x10, 0(x15)
# was:	sw	_size_15_, 0(_arr_5_)
	addi	x11, x15, 4
# was:	addi	_addr_17_, _arr_5_, 4
	mv	x12, x0
# was:	mv	_i_18_, x0
l.loop_beg_19_:
	bge	x12, x10, l.loop_end_20_
# was:	bge	_i_18_, _size_15_, l.loop_end_20_
	sw	x12, 0(x11)
# was:	sw	_i_18_, 0(_addr_17_)
	addi	x11, x11, 4
# was:	addi	_addr_17_, _addr_17_, 4
	addi	x12, x12, 1
# was:	addi	_i_18_, _i_18_, 1
	j	l.loop_beg_19_
l.loop_end_20_:
	lw	x11, 0(x15)
# was:	lw	_size_4_, 0(_arr_5_)
	mv	x10, x3
# was:	mv	_let_x_3_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_32_, _size_4_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_32_, _tmp_32_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_32_
	sw	x11, 0(x10)
# was:	sw	_size_4_, 0(_let_x_3_)
	addi	x13, x10, 4
# was:	addi	_addrg_9_, _let_x_3_, 4
	mv	x12, x0
# was:	mv	_i_10_, x0
	mv	x14, x0
# was:	mv	_counter_11_, x0
	addi	x15, x15, 4
# was:	addi	_elem_6_, _arr_5_, 4
l.loop_beg_12_:
	bge	x12, x11, l.loop_end_13_
# was:	bge	_i_10_, _size_4_, l.loop_end_13_
	lw	x18, 0(x15)
# was:	lw	_res_7_, 0(_elem_6_)
	addi	x15, x15, 4
# was:	addi	_elem_6_, _elem_6_, 4
# 	mv	_eq_L_23_,_res_7_
	mv	x17, x18
# was:	mv	_divide_L_27_, _res_7_
	li	x16, 2
# was:	li	_divide_R_28_, 2
	beq	x16, x0, l.divByZero_29_
# was:	beq	_divide_R_28_, x0, l.divByZero_29_
	div	x17, x17, x16
# was:	div	_times_L_25_, _divide_L_27_, _divide_R_28_
	j	l.divLegal_30_
l.divByZero_29_:
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.divLegal_30_:
	li	x16, 2
# was:	li	_times_R_26_, 2
	mul	x17, x17, x16
# was:	mul	_eq_R_24_, _times_L_25_, _times_R_26_
	li	x16, 0
# was:	li	_fun_arg_res_22_, 0
	bne	x18, x17, l.false_31_
# was:	bne	_eq_L_23_, _eq_R_24_, l.false_31_
	li	x16, 1
# was:	li	_fun_arg_res_22_, 1
l.false_31_:
# 	mv	_res2_8_,_fun_arg_res_22_
	beq	x16, x0, l.false_14_
# was:	beq	_res2_8_, x0, l.false_14_
	sw	x18, 0(x13)
# was:	sw	_res_7_, 0(_addrg_9_)
	addi	x13, x13, 4
# was:	addi	_addrg_9_, _addrg_9_, 4
	addi	x14, x14, 1
# was:	addi	_counter_11_, _counter_11_, 1
l.false_14_:
	addi	x12, x12, 1
# was:	addi	_i_10_, _i_10_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	sw	x14, 0(x10)
# was:	sw	_counter_11_, 0(_let_x_3_)
# 	mv	_arr_34_,_let_x_3_
	lw	x19, 0(x10)
# was:	lw	_size_33_, 0(_arr_34_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_43_, _size_33_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_43_, _tmp_43_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_43_
	sw	x19, 0(x18)
# was:	sw	_size_33_, 0(_mainres_1_)
	addi	x20, x18, 4
# was:	addi	_addrg_37_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_38_, x0
	addi	x22, x10, 4
# was:	addi	_elem_35_, _arr_34_, 4
l.loop_beg_39_:
	bge	x21, x19, l.loop_end_40_
# was:	bge	_i_38_, _size_33_, l.loop_end_40_
	lw	x23, 0(x22)
# was:	lw	_res_36_, 0(_elem_35_)
	addi	x22, x22, 4
# was:	addi	_elem_35_, _elem_35_, 4
# 	mv	_tmp_42_,_res_36_
# 	mv	_fun_arg_res_41_,_tmp_42_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_41_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_36_,_fun_arg_res_41_
	sw	x23, 0(x20)
# was:	sw	_res_36_, 0(_addrg_37_)
	addi	x20, x20, 4
# was:	addi	_addrg_37_, _addrg_37_, 4
	addi	x21, x21, 1
# was:	addi	_i_38_, _i_38_, 1
	j	l.loop_beg_39_
l.loop_end_40_:
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