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
# 	mv	_divide_L_22_,_param_a_16_
	li	x10, 16
# was:	li	_divide_R_23_, 16
	beq	x10, x0, l.divByZero_24_
# was:	beq	_divide_R_23_, x0, l.divByZero_24_
	div	x12, x11, x10
# was:	div	_times_L_20_, _divide_L_22_, _divide_R_23_
	j	l.divByZero_24_
l.divByZero_24_:
	li	x10, 16
# was:	li	_times_R_21_, 16
	mul	x10, x12, x10
# was:	mul	_eq_L_18_, _times_L_20_, _times_R_21_
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
# 	mv	_size_40_,_let_n_27_
	bge	x10, x0, l.safe_41_
# was:	bge	_size_40_, x0, l.safe_41_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_41_:
	mv	x15, x3
# was:	mv	_arr_30_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_46_, _size_40_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_46_, _tmp_46_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_46_
	sw	x10, 0(x15)
# was:	sw	_size_40_, 0(_arr_30_)
	addi	x11, x15, 4
# was:	addi	_addr_42_, _arr_30_, 4
	mv	x12, x0
# was:	mv	_i_43_, x0
l.loop_beg_44_:
	bge	x12, x10, l.loop_end_45_
# was:	bge	_i_43_, _size_40_, l.loop_end_45_
	sw	x12, 0(x11)
# was:	sw	_i_43_, 0(_addr_42_)
	addi	x11, x11, 4
# was:	addi	_addr_42_, _addr_42_, 4
	addi	x12, x12, 1
# was:	addi	_i_43_, _i_43_, 1
	j	l.loop_beg_44_
l.loop_end_45_:
	lw	x13, 0(x15)
# was:	lw	_size_29_, 0(_arr_30_)
	mv	x12, x3
# was:	mv	_let_x_28_, x3
	slli	x10, x13, 2
# was:	slli	_tmp_56_, _size_29_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_56_, _tmp_56_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_56_
	sw	x13, 0(x12)
# was:	sw	_size_29_, 0(_let_x_28_)
	addi	x11, x12, 4
# was:	addi	_addrg_34_, _let_x_28_, 4
	mv	x10, x0
# was:	mv	_i_35_, x0
	mv	x14, x0
# was:	mv	_counter_36_, x0
	addi	x15, x15, 4
# was:	addi	_elem_31_, _arr_30_, 4
l.loop_beg_37_:
	bge	x10, x13, l.loop_end_38_
# was:	bge	_i_35_, _size_29_, l.loop_end_38_
	lw	x19, 0(x15)
# was:	lw	_res_32_, 0(_elem_31_)
	addi	x15, x15, 4
# was:	addi	_elem_31_, _elem_31_, 4
# 	mv	_eq_L_48_,_res_32_
	mv	x17, x19
# was:	mv	_divide_L_52_, _res_32_
	li	x16, 2
# was:	li	_divide_R_53_, 2
	beq	x16, x0, l.divByZero_54_
# was:	beq	_divide_R_53_, x0, l.divByZero_54_
	div	x18, x17, x16
# was:	div	_times_L_50_, _divide_L_52_, _divide_R_53_
	j	l.divByZero_54_
l.divByZero_54_:
	li	x16, 2
# was:	li	_times_R_51_, 2
	mul	x17, x18, x16
# was:	mul	_eq_R_49_, _times_L_50_, _times_R_51_
	li	x16, 0
# was:	li	_fun_arg_res_47_, 0
	bne	x19, x17, l.false_55_
# was:	bne	_eq_L_48_, _eq_R_49_, l.false_55_
	li	x16, 1
# was:	li	_fun_arg_res_47_, 1
l.false_55_:
# 	mv	_res2_33_,_fun_arg_res_47_
	beq	x16, x0, l.false_39_
# was:	beq	_res2_33_, x0, l.false_39_
	sw	x19, 0(x11)
# was:	sw	_res_32_, 0(_addrg_34_)
	addi	x11, x11, 4
# was:	addi	_addrg_34_, _addrg_34_, 4
	addi	x14, x14, 1
# was:	addi	_counter_36_, _counter_36_, 1
l.false_39_:
	addi	x10, x10, 1
# was:	addi	_i_35_, _i_35_, 1
	j	l.loop_beg_37_
l.loop_end_38_:
	sw	x14, 0(x12)
# was:	sw	_counter_36_, 0(_let_x_28_)
	mv	x10, x12
# was:	mv	_arr_59_, _let_x_28_
	lw	x11, 0(x10)
# was:	lw	_size_58_, 0(_arr_59_)
	mv	x12, x3
# was:	mv	_let_y_57_, x3
	slli	x13, x11, 2
# was:	slli	_tmp_69_, _size_58_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_69_, _tmp_69_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_69_
	sw	x11, 0(x12)
# was:	sw	_size_58_, 0(_let_y_57_)
	addi	x14, x12, 4
# was:	addi	_addrg_62_, _let_y_57_, 4
	mv	x13, x0
# was:	mv	_i_63_, x0
	addi	x15, x10, 4
# was:	addi	_elem_60_, _arr_59_, 4
l.loop_beg_64_:
	bge	x13, x11, l.loop_end_65_
# was:	bge	_i_63_, _size_58_, l.loop_end_65_
	lw	x10, 0(x15)
# was:	lw	_res_61_, 0(_elem_60_)
	addi	x15, x15, 4
# was:	addi	_elem_60_, _elem_60_, 4
# 	mv	_times_L_67_,_res_61_
	mv	x16, x10
# was:	mv	_times_R_68_, _res_61_
	mul	x10, x10, x16
# was:	mul	_fun_arg_res_66_, _times_L_67_, _times_R_68_
# 	mv	_res_61_,_fun_arg_res_66_
	sw	x10, 0(x14)
# was:	sw	_res_61_, 0(_addrg_62_)
	addi	x14, x14, 4
# was:	addi	_addrg_62_, _addrg_62_, 4
	addi	x13, x13, 1
# was:	addi	_i_63_, _i_63_, 1
	j	l.loop_beg_64_
l.loop_end_65_:
# 	mv	_arr_72_,_let_y_57_
	lw	x18, 0(x12)
# was:	lw	_size_71_, 0(_arr_72_)
	mv	x19, x3
# was:	mv	_let_z_70_, x3
	slli	x10, x18, 2
# was:	slli	_tmp_83_, _size_71_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_83_, _tmp_83_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_83_
	sw	x18, 0(x19)
# was:	sw	_size_71_, 0(_let_z_70_)
	addi	x21, x19, 4
# was:	addi	_addrg_76_, _let_z_70_, 4
	mv	x20, x0
# was:	mv	_i_77_, x0
	mv	x22, x0
# was:	mv	_counter_78_, x0
	addi	x23, x12, 4
# was:	addi	_elem_73_, _arr_72_, 4
l.loop_beg_79_:
	bge	x20, x18, l.loop_end_80_
# was:	bge	_i_77_, _size_71_, l.loop_end_80_
	lw	x24, 0(x23)
# was:	lw	_res_74_, 0(_elem_73_)
	addi	x23, x23, 4
# was:	addi	_elem_73_, _elem_73_, 4
	mv	x10, x24
# was:	mv	x10, _res_74_
	jal	f.isMul16
# was:	jal	f.isMul16, x10
# 	mv	_tmp_82_,x10
# 	mv	_res2_75_,_tmp_82_
	beq	x10, x0, l.false_81_
# was:	beq	_res2_75_, x0, l.false_81_
	sw	x24, 0(x21)
# was:	sw	_res_74_, 0(_addrg_76_)
	addi	x21, x21, 4
# was:	addi	_addrg_76_, _addrg_76_, 4
	addi	x22, x22, 1
# was:	addi	_counter_78_, _counter_78_, 1
l.false_81_:
	addi	x20, x20, 1
# was:	addi	_i_77_, _i_77_, 1
	j	l.loop_beg_79_
l.loop_end_80_:
	sw	x22, 0(x19)
# was:	sw	_counter_78_, 0(_let_z_70_)
	mv	x10, x19
# was:	mv	_arg_84_, _let_z_70_
# 	mv	x10,_arg_84_
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