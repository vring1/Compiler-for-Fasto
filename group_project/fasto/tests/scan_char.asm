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
	li	x10, 3
# was:	li	_size_3_, 3
	mv	x14, x3
# was:	mv	_let_a_2_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_6_, _size_3_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_6_, _tmp_6_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_6_
	sw	x10, 0(x14)
# was:	sw	_size_3_, 0(_let_a_2_)
	addi	x11, x14, 4
# was:	addi	_addr_4_, _let_a_2_, 4
	la	x10, s.1_7_
# was:	la	_tmp_5_, s.1_7_
# s.1_7_: string "1"
	sw	x10, 0(x11)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x11, x11, 4
# was:	addi	_addr_4_, _addr_4_, 4
	la	x10, s.2_8_
# was:	la	_tmp_5_, s.2_8_
# s.2_8_: string "2"
	sw	x10, 0(x11)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x11, x11, 4
# was:	addi	_addr_4_, _addr_4_, 4
	la	x10, s.3_9_
# was:	la	_tmp_5_, s.3_9_
# s.3_9_: string "3"
	sw	x10, 0(x11)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x11, x11, 4
# was:	addi	_addr_4_, _addr_4_, 4
# 	mv	_arr_12_,_let_a_2_
	lw	x10, 0(x14)
# was:	lw	_size_11_, 0(_arr_12_)
	mv	x11, x3
# was:	mv	_let_b_10_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_37_, _size_11_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_37_, _tmp_37_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_37_
	sw	x10, 0(x11)
# was:	sw	_size_11_, 0(_let_b_10_)
	addi	x12, x11, 4
# was:	addi	_addrg_16_, _let_b_10_, 4
	mv	x13, x0
# was:	mv	_i_18_, x0
	addi	x14, x14, 4
# was:	addi	_elem_13_, _arr_12_, 4
	la	x15, s.0_21_
# was:	la	_res_14_, s.0_21_
# s.0_21_: string "0"
l.loop_beg_19_:
	bge	x13, x10, l.loop_end_20_
# was:	bge	_i_18_, _size_11_, l.loop_end_20_
	lw	x18, 0(x14)
# was:	lw	_res2_15_, 0(_elem_13_)
	addi	x14, x14, 4
# was:	addi	_elem_13_, _elem_13_, 4
	li	x19, 2
# was:	li	_size_23_, 2
	mv	x17, x3
# was:	mv	_fun_arg_res_22_, x3
	addi	x16, x19, 3
# was:	addi	_tmp_26_, _size_23_, 3
	andi	x16, x16, -4
# was:	andi	_tmp_26_, _tmp_26_, -4
	addi	x16, x16, 4
# was:	addi	_tmp_26_, _tmp_26_, 4
	add	x3, x3, x16
# was:	add	x3, x3, _tmp_26_
	sw	x19, 0(x17)
# was:	sw	_size_23_, 0(_fun_arg_res_22_)
	addi	x19, x17, 4
# was:	addi	_addr_24_, _fun_arg_res_22_, 4
	li	x16, 0
# was:	li	_arr_ind_27_, 0
	addi	x20, x15, 4
# was:	addi	_arr_data_28_, _res_14_, 4
	lw	x15, 0(x15)
# was:	lw	_size_29_, 0(_res_14_)
	bge	x16, x0, l.nonneg_31_
# was:	bge	_arr_ind_27_, x0, l.nonneg_31_
l.error_30_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_31_:
	bge	x16, x15, l.error_30_
# was:	bge	_arr_ind_27_, _size_29_, l.error_30_
	add	x20, x20, x16
# was:	add	_arr_data_28_, _arr_data_28_, _arr_ind_27_
	lbu	x15, 0(x20)
# was:	lbu	_tmp_25_, 0(_arr_data_28_)
	sb	x15, 0(x19)
# was:	sb	_tmp_25_, 0(_addr_24_)
	addi	x19, x19, 1
# was:	addi	_addr_24_, _addr_24_, 1
	li	x16, 0
# was:	li	_arr_ind_32_, 0
	addi	x15, x18, 4
# was:	addi	_arr_data_33_, _res2_15_, 4
	lw	x18, 0(x18)
# was:	lw	_size_34_, 0(_res2_15_)
	bge	x16, x0, l.nonneg_36_
# was:	bge	_arr_ind_32_, x0, l.nonneg_36_
l.error_35_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_36_:
	bge	x16, x18, l.error_35_
# was:	bge	_arr_ind_32_, _size_34_, l.error_35_
	add	x15, x15, x16
# was:	add	_arr_data_33_, _arr_data_33_, _arr_ind_32_
	lbu	x15, 0(x15)
# was:	lbu	_tmp_25_, 0(_arr_data_33_)
	sb	x15, 0(x19)
# was:	sb	_tmp_25_, 0(_addr_24_)
	addi	x19, x19, 1
# was:	addi	_addr_24_, _addr_24_, 1
	mv	x15, x17
# was:	mv	_res_14_, _fun_arg_res_22_
	sw	x15, 0(x12)
# was:	sw	_res_14_, 0(_addrg_16_)
	addi	x12, x12, 4
# was:	addi	_addrg_16_, _addrg_16_, 4
	addi	x13, x13, 1
# was:	addi	_i_18_, _i_18_, 1
	lw	x0, -4(x12)
# was:	lw	_tmp_17_, -4(_addrg_16_)
	j	l.loop_beg_19_
l.loop_end_20_:
	sw	x10, 0(x11)
# was:	sw	_size_11_, 0(_let_b_10_)
# 	mv	_arr_39_,_let_b_10_
	lw	x19, 0(x11)
# was:	lw	_size_38_, 0(_arr_39_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_48_, _size_38_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_48_, _tmp_48_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_48_
	sw	x19, 0(x18)
# was:	sw	_size_38_, 0(_mainres_1_)
	addi	x20, x18, 4
# was:	addi	_addrg_42_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_43_, x0
	addi	x22, x11, 4
# was:	addi	_elem_40_, _arr_39_, 4
l.loop_beg_44_:
	bge	x21, x19, l.loop_end_45_
# was:	bge	_i_43_, _size_38_, l.loop_end_45_
	lw	x23, 0(x22)
# was:	lw	_res_41_, 0(_elem_40_)
	addi	x22, x22, 4
# was:	addi	_elem_40_, _elem_40_, 4
	mv	x10, x23
# was:	mv	_tmp_47_, _res_41_
	mv	x23, x10
# was:	mv	_fun_arg_res_46_, _tmp_47_
# 	mv	x10,_tmp_47_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_res_41_,_fun_arg_res_46_
	sw	x23, 0(x20)
# was:	sw	_res_41_, 0(_addrg_42_)
	addi	x20, x20, 4
# was:	addi	_addrg_42_, _addrg_42_, 4
	addi	x21, x21, 1
# was:	addi	_i_43_, _i_43_, 1
	j	l.loop_beg_44_
l.loop_end_45_:
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
s.0_21_:
	.word	1
	.asciz	"0"
	.align	2
s.3_9_:
	.word	1
	.asciz	"3"
	.align	2
s.2_8_:
	.word	1
	.asciz	"2"
	.align	2
s.1_7_:
	.word	1
	.asciz	"1"
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