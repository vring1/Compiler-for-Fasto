	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function write_char
f.write_char:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
	mv	x18, x10
# was:	mv	_tmp_3_, _param_x_1_
# 	mv	_write_charres_2_,_tmp_3_
	mv	x10, x18
# was:	mv	x10, _write_charres_2_
	jal	p.putchar
# was:	jal	p.putchar, x10
	mv	x10, x18
# was:	mv	x10, _write_charres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function write_char_arr
f.write_char_arr:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
# 	mv	_param_x_4_,x10
# 	mv	_arr_7_,_param_x_4_
	lw	x18, 0(x10)
# was:	lw	_size_6_, 0(_arr_7_)
	mv	x19, x3
# was:	mv	_write_char_arrres_5_, x3
	addi	x11, x18, 3
# was:	addi	_tmp_15_, _size_6_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_15_, _tmp_15_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_15_, _tmp_15_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_15_
	sw	x18, 0(x19)
# was:	sw	_size_6_, 0(_write_char_arrres_5_)
	addi	x20, x19, 4
# was:	addi	_addrg_10_, _write_char_arrres_5_, 4
	mv	x21, x0
# was:	mv	_i_11_, x0
	addi	x22, x10, 4
# was:	addi	_elem_8_, _arr_7_, 4
l.loop_beg_12_:
	bge	x21, x18, l.loop_end_13_
# was:	bge	_i_11_, _size_6_, l.loop_end_13_
	lbu	x10, 0(x22)
# was:	lbu	_res_9_, 0(_elem_8_)
	addi	x22, x22, 1
# was:	addi	_elem_8_, _elem_8_, 1
# 	mv	x10,_res_9_
	jal	f.write_char
# was:	jal	f.write_char, x10
# 	mv	_tmp_14_,x10
# 	mv	_res_9_,_tmp_14_
	sb	x10, 0(x20)
# was:	sb	_res_9_, 0(_addrg_10_)
	addi	x20, x20, 1
# was:	addi	_addrg_10_, _addrg_10_, 1
	addi	x21, x21, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	mv	x10, x19
# was:	mv	x10, _write_char_arrres_5_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function isSpecificChar
f.isSpecificChar:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	mv	x12, x10
# was:	mv	_param_a_16_, x10
# 	mv	_eq_L_20_,_param_a_16_
	li	x11, 101
# was:	li	_eq_R_21_, 101
	li	x10, 0
# was:	li	_or_L_18_, 0
	bne	x12, x11, l.false_22_
# was:	bne	_eq_L_20_, _eq_R_21_, l.false_22_
	li	x10, 1
# was:	li	_or_L_18_, 1
l.false_22_:
	bne	x10, x0, l.true_26_
# was:	bne	_or_L_18_, x0, l.true_26_
# 	mv	_eq_L_23_,_param_a_16_
	li	x11, 97
# was:	li	_eq_R_24_, 97
	li	x10, 0
# was:	li	_or_R_19_, 0
	bne	x12, x11, l.false_25_
# was:	bne	_eq_L_23_, _eq_R_24_, l.false_25_
	li	x10, 1
# was:	li	_or_R_19_, 1
l.false_25_:
	bne	x10, x0, l.true_26_
# was:	bne	_or_R_19_, x0, l.true_26_
	li	x10, 0
# was:	li	_isSpecificCharres_17_, 0
	j	l.end_27_
l.true_26_:
	li	x10, 1
# was:	li	_isSpecificCharres_17_, 1
l.end_27_:
# 	mv	x10,_isSpecificCharres_17_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -32
	li	x12, 5
# was:	li	_size_30_, 5
	mv	x10, x3
# was:	mv	_let_arr_29_, x3
	addi	x11, x12, 3
# was:	addi	_tmp_33_, _size_30_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_33_, _tmp_33_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_33_, _tmp_33_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_33_
	sw	x12, 0(x10)
# was:	sw	_size_30_, 0(_let_arr_29_)
	addi	x12, x10, 4
# was:	addi	_addr_31_, _let_arr_29_, 4
	li	x11, 104
# was:	li	_tmp_32_, 104
	sb	x11, 0(x12)
# was:	sb	_tmp_32_, 0(_addr_31_)
	addi	x12, x12, 1
# was:	addi	_addr_31_, _addr_31_, 1
	li	x11, 101
# was:	li	_tmp_32_, 101
	sb	x11, 0(x12)
# was:	sb	_tmp_32_, 0(_addr_31_)
	addi	x12, x12, 1
# was:	addi	_addr_31_, _addr_31_, 1
	li	x11, 106
# was:	li	_tmp_32_, 106
	sb	x11, 0(x12)
# was:	sb	_tmp_32_, 0(_addr_31_)
	addi	x12, x12, 1
# was:	addi	_addr_31_, _addr_31_, 1
	li	x11, 115
# was:	li	_tmp_32_, 115
	sb	x11, 0(x12)
# was:	sb	_tmp_32_, 0(_addr_31_)
	addi	x12, x12, 1
# was:	addi	_addr_31_, _addr_31_, 1
	li	x11, 97
# was:	li	_tmp_32_, 97
	sb	x11, 0(x12)
# was:	sb	_tmp_32_, 0(_addr_31_)
	addi	x12, x12, 1
# was:	addi	_addr_31_, _addr_31_, 1
# 	mv	_arr_36_,_let_arr_29_
	lw	x18, 0(x10)
# was:	lw	_size_35_, 0(_arr_36_)
	mv	x19, x3
# was:	mv	_let_resulting_arr_34_, x3
	addi	x11, x18, 3
# was:	addi	_tmp_47_, _size_35_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_47_, _tmp_47_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_47_, _tmp_47_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_47_
	sw	x18, 0(x19)
# was:	sw	_size_35_, 0(_let_resulting_arr_34_)
	addi	x21, x19, 4
# was:	addi	_addrg_40_, _let_resulting_arr_34_, 4
	mv	x20, x0
# was:	mv	_i_41_, x0
	mv	x22, x0
# was:	mv	_counter_42_, x0
	addi	x23, x10, 4
# was:	addi	_elem_37_, _arr_36_, 4
l.loop_beg_43_:
	bge	x20, x18, l.loop_end_44_
# was:	bge	_i_41_, _size_35_, l.loop_end_44_
	lbu	x24, 0(x23)
# was:	lbu	_res_38_, 0(_elem_37_)
	addi	x23, x23, 1
# was:	addi	_elem_37_, _elem_37_, 1
	mv	x10, x24
# was:	mv	x10, _res_38_
	jal	f.isSpecificChar
# was:	jal	f.isSpecificChar, x10
# 	mv	_tmp_46_,x10
# 	mv	_res2_39_,_tmp_46_
	beq	x10, x0, l.false_45_
# was:	beq	_res2_39_, x0, l.false_45_
	sb	x24, 0(x21)
# was:	sb	_res_38_, 0(_addrg_40_)
	addi	x21, x21, 1
# was:	addi	_addrg_40_, _addrg_40_, 1
	addi	x22, x22, 1
# was:	addi	_counter_42_, _counter_42_, 1
l.false_45_:
	addi	x20, x20, 1
# was:	addi	_i_41_, _i_41_, 1
	j	l.loop_beg_43_
l.loop_end_44_:
	sw	x22, 0(x19)
# was:	sw	_counter_42_, 0(_let_resulting_arr_34_)
	mv	x10, x19
# was:	mv	_arg_48_, _let_resulting_arr_34_
# 	mv	x10,_arg_48_
	jal	f.write_char_arr
# was:	jal	f.write_char_arr, x10
# 	mv	_mainres_28_,x10
# 	mv	x10,_mainres_28_
	addi	x2, x2, 32
	lw	x24, -32(x2)
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