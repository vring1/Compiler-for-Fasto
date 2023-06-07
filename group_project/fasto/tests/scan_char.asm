	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function concat
f.concat:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_1_,x10
	mv	x12, x11
# was:	mv	_param_y_2_, x11
	li	x14, 2
# was:	li	_size_4_, 2
	mv	x11, x3
# was:	mv	_concatres_3_, x3
	addi	x13, x14, 3
# was:	addi	_tmp_7_, _size_4_, 3
	andi	x13, x13, -4
# was:	andi	_tmp_7_, _tmp_7_, -4
	addi	x13, x13, 4
# was:	addi	_tmp_7_, _tmp_7_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_7_
	sw	x14, 0(x11)
# was:	sw	_size_4_, 0(_concatres_3_)
	addi	x13, x11, 4
# was:	addi	_addr_5_, _concatres_3_, 4
	li	x14, 0
# was:	li	_arr_ind_8_, 0
	addi	x15, x10, 4
# was:	addi	_arr_data_9_, _param_x_1_, 4
	lw	x10, 0(x10)
# was:	lw	_size_10_, 0(_param_x_1_)
	bge	x14, x0, l.nonneg_12_
# was:	bge	_arr_ind_8_, x0, l.nonneg_12_
l.error_11_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_12_:
	bge	x14, x10, l.error_11_
# was:	bge	_arr_ind_8_, _size_10_, l.error_11_
	add	x15, x15, x14
# was:	add	_arr_data_9_, _arr_data_9_, _arr_ind_8_
	lbu	x10, 0(x15)
# was:	lbu	_tmp_6_, 0(_arr_data_9_)
	sb	x10, 0(x13)
# was:	sb	_tmp_6_, 0(_addr_5_)
	addi	x13, x13, 1
# was:	addi	_addr_5_, _addr_5_, 1
	li	x14, 0
# was:	li	_arr_ind_13_, 0
	addi	x10, x12, 4
# was:	addi	_arr_data_14_, _param_y_2_, 4
	lw	x12, 0(x12)
# was:	lw	_size_15_, 0(_param_y_2_)
	bge	x14, x0, l.nonneg_17_
# was:	bge	_arr_ind_13_, x0, l.nonneg_17_
l.error_16_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_17_:
	bge	x14, x12, l.error_16_
# was:	bge	_arr_ind_13_, _size_15_, l.error_16_
	add	x10, x10, x14
# was:	add	_arr_data_14_, _arr_data_14_, _arr_ind_13_
	lbu	x10, 0(x10)
# was:	lbu	_tmp_6_, 0(_arr_data_14_)
	sb	x10, 0(x13)
# was:	sb	_tmp_6_, 0(_addr_5_)
	addi	x13, x13, 1
# was:	addi	_addr_5_, _addr_5_, 1
	mv	x10, x11
# was:	mv	x10, _concatres_3_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function writeChar
f.writeChar:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_n_18_,x10
# 	mv	_tmp_20_,_param_n_18_
	mv	x18, x10
# was:	mv	_writeCharres_19_, _tmp_20_
# 	mv	x10,_tmp_20_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _writeCharres_19_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
	li	x11, 3
# was:	li	_size_23_, 3
	mv	x10, x3
# was:	mv	_let_a_22_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_26_, _size_23_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_26_, _tmp_26_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_26_
	sw	x11, 0(x10)
# was:	sw	_size_23_, 0(_let_a_22_)
	addi	x11, x10, 4
# was:	addi	_addr_24_, _let_a_22_, 4
	la	x12, s.1_27_
# was:	la	_tmp_25_, s.1_27_
# s.1_27_: string "1"
	sw	x12, 0(x11)
# was:	sw	_tmp_25_, 0(_addr_24_)
	addi	x11, x11, 4
# was:	addi	_addr_24_, _addr_24_, 4
	la	x12, s.2_28_
# was:	la	_tmp_25_, s.2_28_
# s.2_28_: string "2"
	sw	x12, 0(x11)
# was:	sw	_tmp_25_, 0(_addr_24_)
	addi	x11, x11, 4
# was:	addi	_addr_24_, _addr_24_, 4
	la	x12, s.3_29_
# was:	la	_tmp_25_, s.3_29_
# s.3_29_: string "3"
	sw	x12, 0(x11)
# was:	sw	_tmp_25_, 0(_addr_24_)
	addi	x11, x11, 4
# was:	addi	_addr_24_, _addr_24_, 4
# 	mv	_arr_32_,_let_a_22_
	lw	x19, 0(x10)
# was:	lw	_size_31_, 0(_arr_32_)
	mv	x18, x3
# was:	mv	_let_b_30_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_43_, _size_31_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_43_, _tmp_43_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_43_
	sw	x19, 0(x18)
# was:	sw	_size_31_, 0(_let_b_30_)
	addi	x20, x18, 4
# was:	addi	_addrg_36_, _let_b_30_, 4
	mv	x21, x0
# was:	mv	_i_38_, x0
	addi	x22, x10, 4
# was:	addi	_elem_33_, _arr_32_, 4
	la	x10, s.0_41_
# was:	la	_res_34_, s.0_41_
# s.0_41_: string "0"
l.loop_beg_39_:
	bge	x21, x19, l.loop_end_40_
# was:	bge	_i_38_, _size_31_, l.loop_end_40_
	lw	x11, 0(x22)
# was:	lw	_res2_35_, 0(_elem_33_)
	addi	x22, x22, 4
# was:	addi	_elem_33_, _elem_33_, 4
# 	mv	x10,_res_34_
# 	mv	x11,_res2_35_
	jal	f.concat
# was:	jal	f.concat, x10 x11
# 	mv	_tmp_42_,x10
# 	mv	_res_34_,_tmp_42_
	sw	x10, 0(x20)
# was:	sw	_res_34_, 0(_addrg_36_)
	addi	x20, x20, 4
# was:	addi	_addrg_36_, _addrg_36_, 4
	addi	x21, x21, 1
# was:	addi	_i_38_, _i_38_, 1
	lw	x0, -4(x20)
# was:	lw	_tmp_37_, -4(_addrg_36_)
	j	l.loop_beg_39_
l.loop_end_40_:
	sw	x19, 0(x18)
# was:	sw	_size_31_, 0(_let_b_30_)
	mv	x10, x18
# was:	mv	_arr_45_, _let_b_30_
	lw	x18, 0(x10)
# was:	lw	_size_44_, 0(_arr_45_)
	mv	x19, x3
# was:	mv	_mainres_21_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_53_, _size_44_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_53_, _tmp_53_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_53_
	sw	x18, 0(x19)
# was:	sw	_size_44_, 0(_mainres_21_)
	addi	x20, x19, 4
# was:	addi	_addrg_48_, _mainres_21_, 4
	mv	x21, x0
# was:	mv	_i_49_, x0
	addi	x22, x10, 4
# was:	addi	_elem_46_, _arr_45_, 4
l.loop_beg_50_:
	bge	x21, x18, l.loop_end_51_
# was:	bge	_i_49_, _size_44_, l.loop_end_51_
	lw	x10, 0(x22)
# was:	lw	_res_47_, 0(_elem_46_)
	addi	x22, x22, 4
# was:	addi	_elem_46_, _elem_46_, 4
# 	mv	x10,_res_47_
	jal	f.writeChar
# was:	jal	f.writeChar, x10
# 	mv	_tmp_52_,x10
# 	mv	_res_47_,_tmp_52_
	sw	x10, 0(x20)
# was:	sw	_res_47_, 0(_addrg_48_)
	addi	x20, x20, 4
# was:	addi	_addrg_48_, _addrg_48_, 4
	addi	x21, x21, 1
# was:	addi	_i_49_, _i_49_, 1
	j	l.loop_beg_50_
l.loop_end_51_:
	mv	x10, x19
# was:	mv	x10, _mainres_21_
	addi	x2, x2, 24
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
s.0_41_:
	.word	1
	.asciz	"0"
	.align	2
s.3_29_:
	.word	1
	.asciz	"3"
	.align	2
s.2_28_:
	.word	1
	.asciz	"2"
	.align	2
s.1_27_:
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