	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function write_int
f.write_int:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
	mv	x18, x10
# was:	mv	_tmp_3_, _param_x_1_
# 	mv	_write_intres_2_,_tmp_3_
	mv	x10, x18
# was:	mv	x10, _write_intres_2_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _write_intres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function write_int_arr
f.write_int_arr:
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
# was:	mv	_write_int_arrres_5_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_15_, _size_6_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_15_, _tmp_15_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_15_
	sw	x18, 0(x19)
# was:	sw	_size_6_, 0(_write_int_arrres_5_)
	addi	x20, x19, 4
# was:	addi	_addrg_10_, _write_int_arrres_5_, 4
	mv	x21, x0
# was:	mv	_i_11_, x0
	addi	x22, x10, 4
# was:	addi	_elem_8_, _arr_7_, 4
l.loop_beg_12_:
	bge	x21, x18, l.loop_end_13_
# was:	bge	_i_11_, _size_6_, l.loop_end_13_
	lw	x10, 0(x22)
# was:	lw	_res_9_, 0(_elem_8_)
	addi	x22, x22, 4
# was:	addi	_elem_8_, _elem_8_, 4
# 	mv	x10,_res_9_
	jal	f.write_int
# was:	jal	f.write_int, x10
# 	mv	_tmp_14_,x10
# 	mv	_res_9_,_tmp_14_
	sw	x10, 0(x20)
# was:	sw	_res_9_, 0(_addrg_10_)
	addi	x20, x20, 4
# was:	addi	_addrg_10_, _addrg_10_, 4
	addi	x21, x21, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	mv	x10, x19
# was:	mv	x10, _write_int_arrres_5_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function isMul16
f.isMul16:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	mv	x11, x10
# was:	mv	_param_a_16_, x10
# 	mv	_div1_L_22_,_param_a_16_
	li	x10, 16
# was:	li	_div2_R_23_, 16
	bne	x10, x0, l.safe_div_24_
# was:	bne	_div2_R_23_, x0, l.safe_div_24_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_24_:
	div	x12, x11, x10
# was:	div	_mult1_L_20_, _div1_L_22_, _div2_R_23_
	li	x10, 16
# was:	li	_mult2_R_21_, 16
	mul	x10, x12, x10
# was:	mul	_eq_L_18_, _mult1_L_20_, _mult2_R_21_
	mv	x12, x11
# was:	mv	_eq_R_19_, _param_a_16_
	li	x11, 0
# was:	li	_isMul16res_17_, 0
	bne	x10, x12, l.false_25_
# was:	bne	_eq_L_18_, _eq_R_19_, l.false_25_
	li	x11, 1
# was:	li	_isMul16res_17_, 1
l.false_25_:
	mv	x10, x11
# was:	mv	x10, _isMul16res_17_
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
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_27_,x10
	mv	x12, x10
# was:	mv	_size_34_, _let_n_27_
	bge	x12, x0, l.safe_35_
# was:	bge	_size_34_, x0, l.safe_35_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_35_:
	mv	x10, x3
# was:	mv	_arr_30_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_40_, _size_34_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_40_, _tmp_40_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_40_
	sw	x12, 0(x10)
# was:	sw	_size_34_, 0(_arr_30_)
	addi	x11, x10, 4
# was:	addi	_addr_36_, _arr_30_, 4
	mv	x13, x0
# was:	mv	_i_37_, x0
l.loop_beg_38_:
	bge	x13, x12, l.loop_end_39_
# was:	bge	_i_37_, _size_34_, l.loop_end_39_
	sw	x13, 0(x11)
# was:	sw	_i_37_, 0(_addr_36_)
	addi	x11, x11, 4
# was:	addi	_addr_36_, _addr_36_, 4
	addi	x13, x13, 1
# was:	addi	_i_37_, _i_37_, 1
	j	l.loop_beg_38_
l.loop_end_39_:
	lw	x12, 0(x10)
# was:	lw	_size_29_, 0(_arr_30_)
	mv	x11, x3
# was:	mv	_let_x_28_, x3
	slli	x13, x12, 2
# was:	slli	_tmp_55_, _size_29_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_55_, _tmp_55_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_55_
	sw	x12, 0(x11)
# was:	sw	_size_29_, 0(_let_x_28_)
	addi	x13, x11, 4
# was:	addi	_addr_41_, _let_x_28_, 4
	addi	x10, x10, 4
# was:	addi	_arr_30_, _arr_30_, 4
	mv	x15, x0
# was:	mv	_i_42_, x0
	mv	x14, x0
# was:	mv	_count_33_, x0
l.loop_beg_43_:
	bge	x15, x12, l.loop_end_44_
# was:	bge	_i_42_, _size_29_, l.loop_end_44_
	lw	x18, 0(x10)
# was:	lw	_elem_31_, 0(_arr_30_)
	addi	x10, x10, 4
# was:	addi	_arr_30_, _arr_30_, 4
# 	mv	_eq_L_47_,_elem_31_
	mv	x17, x18
# was:	mv	_div1_L_51_, _elem_31_
	li	x16, 2
# was:	li	_div2_R_52_, 2
	bne	x16, x0, l.safe_div_53_
# was:	bne	_div2_R_52_, x0, l.safe_div_53_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_53_:
	div	x17, x17, x16
# was:	div	_mult1_L_49_, _div1_L_51_, _div2_R_52_
	li	x16, 2
# was:	li	_mult2_R_50_, 2
	mul	x17, x17, x16
# was:	mul	_eq_R_48_, _mult1_L_49_, _mult2_R_50_
	li	x16, 0
# was:	li	_fun_arg_res_46_, 0
	bne	x18, x17, l.false_54_
# was:	bne	_eq_L_47_, _eq_R_48_, l.false_54_
	li	x16, 1
# was:	li	_fun_arg_res_46_, 1
l.false_54_:
# 	mv	_bool_32_,_fun_arg_res_46_
	beq	x16, x0, l.if_end_45_
# was:	beq	_bool_32_, x0, l.if_end_45_
	sw	x18, 0(x13)
# was:	sw	_elem_31_, 0(_addr_41_)
	addi	x13, x13, 4
# was:	addi	_addr_41_, _addr_41_, 4
	addi	x14, x14, 1
# was:	addi	_count_33_, _count_33_, 1
l.if_end_45_:
	addi	x15, x15, 1
# was:	addi	_i_42_, _i_42_, 1
	j	l.loop_beg_43_
l.loop_end_44_:
	sw	x14, 0(x11)
# was:	sw	_count_33_, 0(_let_x_28_)
	mv	x10, x11
# was:	mv	_arr_58_, _let_x_28_
	lw	x12, 0(x10)
# was:	lw	_size_57_, 0(_arr_58_)
	mv	x20, x3
# was:	mv	_let_y_56_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_68_, _size_57_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_68_, _tmp_68_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_68_
	sw	x12, 0(x20)
# was:	sw	_size_57_, 0(_let_y_56_)
	addi	x11, x20, 4
# was:	addi	_addrg_61_, _let_y_56_, 4
	mv	x13, x0
# was:	mv	_i_62_, x0
	addi	x14, x10, 4
# was:	addi	_elem_59_, _arr_58_, 4
l.loop_beg_63_:
	bge	x13, x12, l.loop_end_64_
# was:	bge	_i_62_, _size_57_, l.loop_end_64_
	lw	x10, 0(x14)
# was:	lw	_res_60_, 0(_elem_59_)
	addi	x14, x14, 4
# was:	addi	_elem_59_, _elem_59_, 4
# 	mv	_mult1_L_66_,_res_60_
	mv	x15, x10
# was:	mv	_mult2_R_67_, _res_60_
	mul	x10, x10, x15
# was:	mul	_fun_arg_res_65_, _mult1_L_66_, _mult2_R_67_
# 	mv	_res_60_,_fun_arg_res_65_
	sw	x10, 0(x11)
# was:	sw	_res_60_, 0(_addrg_61_)
	addi	x11, x11, 4
# was:	addi	_addrg_61_, _addrg_61_, 4
	addi	x13, x13, 1
# was:	addi	_i_62_, _i_62_, 1
	j	l.loop_beg_63_
l.loop_end_64_:
# 	mv	_arr_71_,_let_y_56_
	lw	x19, 0(x20)
# was:	lw	_size_70_, 0(_arr_71_)
	mv	x18, x3
# was:	mv	_let_z_69_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_81_, _size_70_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_81_, _tmp_81_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_81_
	sw	x19, 0(x18)
# was:	sw	_size_70_, 0(_let_z_69_)
	addi	x21, x18, 4
# was:	addi	_addr_75_, _let_z_69_, 4
	addi	x20, x20, 4
# was:	addi	_arr_71_, _arr_71_, 4
	mv	x22, x0
# was:	mv	_i_76_, x0
	mv	x23, x0
# was:	mv	_count_74_, x0
l.loop_beg_77_:
	bge	x22, x19, l.loop_end_78_
# was:	bge	_i_76_, _size_70_, l.loop_end_78_
	lw	x24, 0(x20)
# was:	lw	_elem_72_, 0(_arr_71_)
	addi	x20, x20, 4
# was:	addi	_arr_71_, _arr_71_, 4
	mv	x10, x24
# was:	mv	x10, _elem_72_
	jal	f.isMul16
# was:	jal	f.isMul16, x10
# 	mv	_tmp_80_,x10
# 	mv	_bool_73_,_tmp_80_
	beq	x10, x0, l.if_end_79_
# was:	beq	_bool_73_, x0, l.if_end_79_
	sw	x24, 0(x21)
# was:	sw	_elem_72_, 0(_addr_75_)
	addi	x21, x21, 4
# was:	addi	_addr_75_, _addr_75_, 4
	addi	x23, x23, 1
# was:	addi	_count_74_, _count_74_, 1
l.if_end_79_:
	addi	x22, x22, 1
# was:	addi	_i_76_, _i_76_, 1
	j	l.loop_beg_77_
l.loop_end_78_:
	sw	x23, 0(x18)
# was:	sw	_count_74_, 0(_let_z_69_)
	mv	x10, x18
# was:	mv	_arg_82_, _let_z_69_
# 	mv	x10,_arg_82_
	jal	f.write_int_arr
# was:	jal	f.write_int_arr, x10
# 	mv	_mainres_26_,x10
# 	mv	x10,_mainres_26_
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