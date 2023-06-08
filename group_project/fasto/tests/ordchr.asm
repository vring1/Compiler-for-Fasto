	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
	mv	x12, x10
# was:	mv	_size_8_, _let_n_2_
	bge	x12, x0, l.safe_9_
# was:	bge	_size_8_, x0, l.safe_9_
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_9_:
	mv	x10, x3
# was:	mv	_arr_5_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_14_, _size_8_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_14_, _tmp_14_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_14_
	sw	x12, 0(x10)
# was:	sw	_size_8_, 0(_arr_5_)
	addi	x11, x10, 4
# was:	addi	_addr_10_, _arr_5_, 4
	mv	x13, x0
# was:	mv	_i_11_, x0
l.loop_beg_12_:
	bge	x13, x12, l.loop_end_13_
# was:	bge	_i_11_, _size_8_, l.loop_end_13_
	sw	x13, 0(x11)
# was:	sw	_i_11_, 0(_addr_10_)
	addi	x11, x11, 4
# was:	addi	_addr_10_, _addr_10_, 4
	addi	x13, x13, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	lw	x20, 0(x10)
# was:	lw	_size_4_, 0(_arr_5_)
	mv	x19, x3
# was:	mv	_let_s1_3_, x3
	addi	x11, x20, 3
# was:	addi	_tmp_20_, _size_4_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_20_, _tmp_20_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_20_, _tmp_20_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_20_
	sw	x20, 0(x19)
# was:	sw	_size_4_, 0(_let_s1_3_)
	addi	x18, x19, 4
# was:	addi	_addrg_15_, _let_s1_3_, 4
	mv	x21, x0
# was:	mv	_i_16_, x0
	addi	x22, x10, 4
# was:	addi	_elem_6_, _arr_5_, 4
l.loop_beg_17_:
	bge	x21, x20, l.loop_end_18_
# was:	bge	_i_16_, _size_4_, l.loop_end_18_
	lw	x10, 0(x22)
# was:	lw	_res_7_, 0(_elem_6_)
	addi	x22, x22, 4
# was:	addi	_elem_6_, _elem_6_, 4
	jal	p.getchar
# was:	jal	p.getchar, 
# 	mv	_fun_arg_res_19_,x10
# 	mv	_res_7_,_fun_arg_res_19_
	sb	x10, 0(x18)
# was:	sb	_res_7_, 0(_addrg_15_)
	addi	x18, x18, 1
# was:	addi	_addrg_15_, _addrg_15_, 1
	addi	x21, x21, 1
# was:	addi	_i_16_, _i_16_, 1
	j	l.loop_beg_17_
l.loop_end_18_:
	mv	x10, x19
# was:	mv	_arr_31_, _let_s1_3_
	lw	x20, 0(x10)
# was:	lw	_size_30_, 0(_arr_31_)
	mv	x18, x3
# was:	mv	_arr_27_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_39_, _size_30_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_39_, _tmp_39_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_39_
	sw	x20, 0(x18)
# was:	sw	_size_30_, 0(_arr_27_)
	addi	x21, x18, 4
# was:	addi	_addrg_34_, _arr_27_, 4
	mv	x19, x0
# was:	mv	_i_35_, x0
	addi	x22, x10, 4
# was:	addi	_elem_32_, _arr_31_, 4
l.loop_beg_36_:
	bge	x19, x20, l.loop_end_37_
# was:	bge	_i_35_, _size_30_, l.loop_end_37_
	lbu	x10, 0(x22)
# was:	lbu	_res_33_, 0(_elem_32_)
	addi	x22, x22, 1
# was:	addi	_elem_32_, _elem_32_, 1
# 	mv	x10,_res_33_
	jal	f.ord
# was:	jal	f.ord, x10
# 	mv	_tmp_38_,x10
# 	mv	_res_33_,_tmp_38_
	sw	x10, 0(x21)
# was:	sw	_res_33_, 0(_addrg_34_)
	addi	x21, x21, 4
# was:	addi	_addrg_34_, _addrg_34_, 4
	addi	x19, x19, 1
# was:	addi	_i_35_, _i_35_, 1
	j	l.loop_beg_36_
l.loop_end_37_:
	lw	x11, 0(x18)
# was:	lw	_size_26_, 0(_arr_27_)
	mv	x10, x3
# was:	mv	_arr_23_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_47_, _size_26_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_47_, _tmp_47_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_47_
	sw	x11, 0(x10)
# was:	sw	_size_26_, 0(_arr_23_)
	addi	x13, x10, 4
# was:	addi	_addrg_40_, _arr_23_, 4
	mv	x12, x0
# was:	mv	_i_41_, x0
	addi	x14, x18, 4
# was:	addi	_elem_28_, _arr_27_, 4
l.loop_beg_42_:
	bge	x12, x11, l.loop_end_43_
# was:	bge	_i_41_, _size_26_, l.loop_end_43_
	lw	x15, 0(x14)
# was:	lw	_res_29_, 0(_elem_28_)
	addi	x14, x14, 4
# was:	addi	_elem_28_, _elem_28_, 4
	mv	x16, x15
# was:	mv	_plus_L_45_, _res_29_
	li	x15, 1
# was:	li	_plus_R_46_, 1
	add	x15, x16, x15
# was:	add	_fun_arg_res_44_, _plus_L_45_, _plus_R_46_
# 	mv	_res_29_,_fun_arg_res_44_
	sw	x15, 0(x13)
# was:	sw	_res_29_, 0(_addrg_40_)
	addi	x13, x13, 4
# was:	addi	_addrg_40_, _addrg_40_, 4
	addi	x12, x12, 1
# was:	addi	_i_41_, _i_41_, 1
	j	l.loop_beg_42_
l.loop_end_43_:
	lw	x18, 0(x10)
# was:	lw	_size_22_, 0(_arr_23_)
	mv	x19, x3
# was:	mv	_let_s2_21_, x3
	addi	x11, x18, 3
# was:	addi	_tmp_53_, _size_22_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_53_, _tmp_53_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_53_, _tmp_53_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_53_
	sw	x18, 0(x19)
# was:	sw	_size_22_, 0(_let_s2_21_)
	addi	x20, x19, 4
# was:	addi	_addrg_48_, _let_s2_21_, 4
	mv	x21, x0
# was:	mv	_i_49_, x0
	addi	x22, x10, 4
# was:	addi	_elem_24_, _arr_23_, 4
l.loop_beg_50_:
	bge	x21, x18, l.loop_end_51_
# was:	bge	_i_49_, _size_22_, l.loop_end_51_
	lw	x10, 0(x22)
# was:	lw	_res_25_, 0(_elem_24_)
	addi	x22, x22, 4
# was:	addi	_elem_24_, _elem_24_, 4
# 	mv	x10,_res_25_
	jal	f.chr
# was:	jal	f.chr, x10
# 	mv	_tmp_52_,x10
# 	mv	_res_25_,_tmp_52_
	sb	x10, 0(x20)
# was:	sb	_res_25_, 0(_addrg_48_)
	addi	x20, x20, 1
# was:	addi	_addrg_48_, _addrg_48_, 1
	addi	x21, x21, 1
# was:	addi	_i_49_, _i_49_, 1
	j	l.loop_beg_50_
l.loop_end_51_:
	mv	x10, x19
# was:	mv	_tmp_54_, _let_s2_21_
	mv	x18, x10
# was:	mv	_mainres_1_, _tmp_54_
# 	mv	x10,_tmp_54_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _mainres_1_
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