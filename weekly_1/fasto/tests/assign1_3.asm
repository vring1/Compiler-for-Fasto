	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function mul
f.mul:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
# 	mv	_param_y_2_,x11
# 	mv	_eq_L_8_,_param_x_1_
	li	x13, 0
# was:	li	_eq_R_9_, 0
	li	x12, 0
# was:	li	_cond_7_, 0
	bne	x10, x13, l.false_10_
# was:	bne	_eq_L_8_, _eq_R_9_, l.false_10_
	li	x12, 1
# was:	li	_cond_7_, 1
l.false_10_:
	bne	x12, x0, l.then_4_
# was:	bne	_cond_7_, x0, l.then_4_
	j	l.else_5_
l.then_4_:
	li	x10, 0
# was:	li	_mulres_3_, 0
	j	l.endif_6_
l.else_5_:
# 	mv	_eq_L_15_,_param_y_2_
	li	x13, 0
# was:	li	_eq_R_16_, 0
	li	x12, 0
# was:	li	_cond_14_, 0
	bne	x11, x13, l.false_17_
# was:	bne	_eq_L_15_, _eq_R_16_, l.false_17_
	li	x12, 1
# was:	li	_cond_14_, 1
l.false_17_:
	bne	x12, x0, l.then_11_
# was:	bne	_cond_14_, x0, l.then_11_
	j	l.else_12_
l.then_11_:
	li	x10, 0
# was:	li	_mulres_3_, 0
	j	l.endif_13_
l.else_12_:
# 	mv	_lt_L_22_,_param_y_2_
	li	x12, 0
# was:	li	_lt_R_23_, 0
	slt	x12, x11, x12
# was:	slt	_cond_21_, _lt_L_22_, _lt_R_23_
	bne	x12, x0, l.then_18_
# was:	bne	_cond_21_, x0, l.then_18_
	j	l.else_19_
l.then_18_:
	li	x12, 0
# was:	li	_minus_L_26_, 0
# 	mv	_minus_R_27_,_param_x_1_
	sub	x18, x12, x10
# was:	sub	_plus_L_24_, _minus_L_26_, _minus_R_27_
# 	mv	_arg_28_,_param_x_1_
	mv	x12, x11
# was:	mv	_plus_L_30_, _param_y_2_
	li	x11, 1
# was:	li	_plus_R_31_, 1
	add	x11, x12, x11
# was:	add	_arg_29_, _plus_L_30_, _plus_R_31_
# 	mv	x10,_arg_28_
# 	mv	x11,_arg_29_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_25_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_24_, _plus_R_25_
	j	l.endif_20_
l.else_19_:
	mv	x18, x10
# was:	mv	_plus_L_32_, _param_x_1_
# 	mv	_arg_34_,_param_x_1_
# 	mv	_minus_L_36_,_param_y_2_
	li	x12, 1
# was:	li	_minus_R_37_, 1
	sub	x11, x11, x12
# was:	sub	_arg_35_, _minus_L_36_, _minus_R_37_
# 	mv	x10,_arg_34_
# 	mv	x11,_arg_35_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_33_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_32_, _plus_R_33_
l.endif_20_:
l.endif_13_:
l.endif_6_:
# 	mv	x10,_mulres_3_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function readInt
f.readInt:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_i_38_,x10
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_readIntres_39_,x10
# 	mv	x10,_readIntres_39_
	addi	x2, x2, 4
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
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_41_,x10
# 	mv	_lt_L_46_,_let_n_41_
	li	x11, 1
# was:	li	_lt_R_47_, 1
	slt	x11, x10, x11
# was:	slt	_cond_45_, _lt_L_46_, _lt_R_47_
	bne	x11, x0, l.then_42_
# was:	bne	_cond_45_, x0, l.then_42_
	j	l.else_43_
l.then_42_:
	la	x0, s.Incorre_49_
# was:	la	_let_error_48_, s.Incorre_49_
# s.Incorre_49_: string "Incorrect Input!"
	li	x18, 0
# was:	li	_mainres_40_, 0
	j	l.endif_44_
l.else_43_:
# 	mv	_size_51_,_let_n_41_
	bge	x10, x0, l.safe_52_
# was:	bge	_size_51_, x0, l.safe_52_
	li	x10, 23
# was:	li	x10, 23
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_52_:
	mv	x19, x3
# was:	mv	_let_arr_50_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_57_, _size_51_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_57_, _tmp_57_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_57_
	sw	x10, 0(x19)
# was:	sw	_size_51_, 0(_let_arr_50_)
	addi	x11, x19, 4
# was:	addi	_addr_53_, _let_arr_50_, 4
	mv	x12, x0
# was:	mv	_i_54_, x0
l.loop_beg_55_:
	bge	x12, x10, l.loop_end_56_
# was:	bge	_i_54_, _size_51_, l.loop_end_56_
	sw	x12, 0(x11)
# was:	sw	_i_54_, 0(_addr_53_)
	addi	x11, x11, 4
# was:	addi	_addr_53_, _addr_53_, 4
	addi	x12, x12, 1
# was:	addi	_i_54_, _i_54_, 1
	j	l.loop_beg_55_
l.loop_end_56_:
# 	mv	_arr_60_,_let_arr_50_
	lw	x20, 0(x19)
# was:	lw	_size_59_, 0(_arr_60_)
	mv	x18, x3
# was:	mv	_let_arraydiff_58_, x3
	slli	x10, x20, 2
# was:	slli	_tmp_68_, _size_59_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_68_, _tmp_68_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_68_
	sw	x20, 0(x18)
# was:	sw	_size_59_, 0(_let_arraydiff_58_)
	addi	x21, x18, 4
# was:	addi	_addrg_63_, _let_arraydiff_58_, 4
	mv	x22, x0
# was:	mv	_i_64_, x0
	addi	x23, x19, 4
# was:	addi	_elem_61_, _arr_60_, 4
l.loop_beg_65_:
	bge	x22, x20, l.loop_end_66_
# was:	bge	_i_64_, _size_59_, l.loop_end_66_
	lw	x10, 0(x23)
# was:	lw	_res_62_, 0(_elem_61_)
	addi	x23, x23, 4
# was:	addi	_elem_61_, _elem_61_, 4
# 	mv	x10,_res_62_
	jal	f.readInt
# was:	jal	f.readInt, x10
# 	mv	_tmp_67_,x10
# 	mv	_res_62_,_tmp_67_
	sw	x10, 0(x21)
# was:	sw	_res_62_, 0(_addrg_63_)
	addi	x21, x21, 4
# was:	addi	_addrg_63_, _addrg_63_, 4
	addi	x22, x22, 1
# was:	addi	_i_64_, _i_64_, 1
	j	l.loop_beg_65_
l.loop_end_66_:
# 	mv	_arr_71_,_let_arr_50_
	lw	x10, 0(x19)
# was:	lw	_size_70_, 0(_arr_71_)
	mv	x20, x3
# was:	mv	_let_difs_69_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_105_, _size_70_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_105_, _tmp_105_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_105_
	sw	x10, 0(x20)
# was:	sw	_size_70_, 0(_let_difs_69_)
	addi	x11, x20, 4
# was:	addi	_addrg_74_, _let_difs_69_, 4
	mv	x12, x0
# was:	mv	_i_75_, x0
	addi	x13, x19, 4
# was:	addi	_elem_72_, _arr_71_, 4
l.loop_beg_76_:
	bge	x12, x10, l.loop_end_77_
# was:	bge	_i_75_, _size_70_, l.loop_end_77_
	lw	x15, 0(x13)
# was:	lw	_res_73_, 0(_elem_72_)
	addi	x13, x13, 4
# was:	addi	_elem_72_, _elem_72_, 4
# 	mv	_eq_L_83_,_res_73_
	li	x14, 0
# was:	li	_eq_R_84_, 0
	li	x16, 0
# was:	li	_cond_82_, 0
	bne	x15, x14, l.false_85_
# was:	bne	_eq_L_83_, _eq_R_84_, l.false_85_
	li	x16, 1
# was:	li	_cond_82_, 1
l.false_85_:
	bne	x16, x0, l.then_79_
# was:	bne	_cond_82_, x0, l.then_79_
	j	l.else_80_
l.then_79_:
	li	x15, 0
# was:	li	_arr_ind_86_, 0
	addi	x14, x18, 4
# was:	addi	_arr_data_87_, _let_arraydiff_58_, 4
	lw	x16, 0(x18)
# was:	lw	_size_88_, 0(_let_arraydiff_58_)
	bge	x15, x0, l.nonneg_90_
# was:	bge	_arr_ind_86_, x0, l.nonneg_90_
l.error_89_:
	li	x10, 27
# was:	li	x10, 27
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_90_:
	bge	x15, x16, l.error_89_
# was:	bge	_arr_ind_86_, _size_88_, l.error_89_
	slli	x15, x15, 2
# was:	slli	_arr_ind_86_, _arr_ind_86_, 2
	add	x14, x14, x15
# was:	add	_arr_data_87_, _arr_data_87_, _arr_ind_86_
	lw	x15, 0(x14)
# was:	lw	_fun_arg_res_78_, 0(_arr_data_87_)
	j	l.endif_81_
l.else_80_:
	mv	x16, x15
# was:	mv	_arr_ind_93_, _res_73_
	addi	x14, x18, 4
# was:	addi	_arr_data_94_, _let_arraydiff_58_, 4
	lw	x17, 0(x18)
# was:	lw	_size_95_, 0(_let_arraydiff_58_)
	bge	x16, x0, l.nonneg_97_
# was:	bge	_arr_ind_93_, x0, l.nonneg_97_
l.error_96_:
	li	x10, 28
# was:	li	x10, 28
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_97_:
	bge	x16, x17, l.error_96_
# was:	bge	_arr_ind_93_, _size_95_, l.error_96_
	slli	x16, x16, 2
# was:	slli	_arr_ind_93_, _arr_ind_93_, 2
	add	x14, x14, x16
# was:	add	_arr_data_94_, _arr_data_94_, _arr_ind_93_
	lw	x14, 0(x14)
# was:	lw	_minus_L_91_, 0(_arr_data_94_)
	mv	x16, x15
# was:	mv	_minus_L_99_, _res_73_
	li	x15, 1
# was:	li	_minus_R_100_, 1
	sub	x17, x16, x15
# was:	sub	_arr_ind_98_, _minus_L_99_, _minus_R_100_
	addi	x15, x18, 4
# was:	addi	_arr_data_101_, _let_arraydiff_58_, 4
	lw	x16, 0(x18)
# was:	lw	_size_102_, 0(_let_arraydiff_58_)
	bge	x17, x0, l.nonneg_104_
# was:	bge	_arr_ind_98_, x0, l.nonneg_104_
l.error_103_:
	li	x10, 28
# was:	li	x10, 28
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_104_:
	bge	x17, x16, l.error_103_
# was:	bge	_arr_ind_98_, _size_102_, l.error_103_
	slli	x17, x17, 2
# was:	slli	_arr_ind_98_, _arr_ind_98_, 2
	add	x15, x15, x17
# was:	add	_arr_data_101_, _arr_data_101_, _arr_ind_98_
	lw	x15, 0(x15)
# was:	lw	_minus_R_92_, 0(_arr_data_101_)
	sub	x15, x14, x15
# was:	sub	_fun_arg_res_78_, _minus_L_91_, _minus_R_92_
l.endif_81_:
# 	mv	_res_73_,_fun_arg_res_78_
	sw	x15, 0(x11)
# was:	sw	_res_73_, 0(_addrg_74_)
	addi	x11, x11, 4
# was:	addi	_addrg_74_, _addrg_74_, 4
	addi	x12, x12, 1
# was:	addi	_i_75_, _i_75_, 1
	j	l.loop_beg_76_
l.loop_end_77_:
	mv	x10, x19
# was:	mv	_arr_108_, _let_arr_50_
	lw	x19, 0(x10)
# was:	lw	_size_107_, 0(_arr_108_)
	mv	x18, x3
# was:	mv	_let_sum_squares_106_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_128_, _size_107_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_128_, _tmp_128_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_128_
	sw	x19, 0(x18)
# was:	sw	_size_107_, 0(_let_sum_squares_106_)
	addi	x22, x18, 4
# was:	addi	_addrg_111_, _let_sum_squares_106_, 4
	mv	x21, x0
# was:	mv	_i_112_, x0
	addi	x23, x10, 4
# was:	addi	_elem_109_, _arr_108_, 4
l.loop_beg_113_:
	bge	x21, x19, l.loop_end_114_
# was:	bge	_i_112_, _size_107_, l.loop_end_114_
	lw	x13, 0(x23)
# was:	lw	_res_110_, 0(_elem_109_)
	addi	x23, x23, 4
# was:	addi	_elem_109_, _elem_109_, 4
	mv	x12, x13
# was:	mv	_arr_ind_117_, _res_110_
	addi	x10, x20, 4
# was:	addi	_arr_data_118_, _let_difs_69_, 4
	lw	x11, 0(x20)
# was:	lw	_size_119_, 0(_let_difs_69_)
	bge	x12, x0, l.nonneg_121_
# was:	bge	_arr_ind_117_, x0, l.nonneg_121_
l.error_120_:
	li	x10, 31
# was:	li	x10, 31
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_121_:
	bge	x12, x11, l.error_120_
# was:	bge	_arr_ind_117_, _size_119_, l.error_120_
	slli	x12, x12, 2
# was:	slli	_arr_ind_117_, _arr_ind_117_, 2
	add	x10, x10, x12
# was:	add	_arr_data_118_, _arr_data_118_, _arr_ind_117_
	lw	x10, 0(x10)
# was:	lw	_arg_116_, 0(_arr_data_118_)
# 	mv	_arr_ind_123_,_res_110_
	addi	x11, x20, 4
# was:	addi	_arr_data_124_, _let_difs_69_, 4
	lw	x12, 0(x20)
# was:	lw	_size_125_, 0(_let_difs_69_)
	bge	x13, x0, l.nonneg_127_
# was:	bge	_arr_ind_123_, x0, l.nonneg_127_
l.error_126_:
	li	x10, 31
# was:	li	x10, 31
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_127_:
	bge	x13, x12, l.error_126_
# was:	bge	_arr_ind_123_, _size_125_, l.error_126_
	slli	x13, x13, 2
# was:	slli	_arr_ind_123_, _arr_ind_123_, 2
	add	x11, x11, x13
# was:	add	_arr_data_124_, _arr_data_124_, _arr_ind_123_
	lw	x11, 0(x11)
# was:	lw	_arg_122_, 0(_arr_data_124_)
# 	mv	x10,_arg_116_
# 	mv	x11,_arg_122_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_fun_arg_res_115_,x10
	mv	x13, x10
# was:	mv	_res_110_, _fun_arg_res_115_
	sw	x13, 0(x22)
# was:	sw	_res_110_, 0(_addrg_111_)
	addi	x22, x22, 4
# was:	addi	_addrg_111_, _addrg_111_, 4
	addi	x21, x21, 1
# was:	addi	_i_112_, _i_112_, 1
	j	l.loop_beg_113_
l.loop_end_114_:
# 	mv	_arr_130_,_let_sum_squares_106_
	lw	x11, 0(x18)
# was:	lw	_size_131_, 0(_arr_130_)
	li	x10, 0
# was:	li	_let_reduced_129_, 0
	addi	x18, x18, 4
# was:	addi	_arr_130_, _arr_130_, 4
	mv	x13, x0
# was:	mv	_ind_var_132_, x0
l.loop_beg_134_:
	bge	x13, x11, l.loop_end_135_
# was:	bge	_ind_var_132_, _size_131_, l.loop_end_135_
	lw	x12, 0(x18)
# was:	lw	_tmp_133_, 0(_arr_130_)
	addi	x18, x18, 4
# was:	addi	_arr_130_, _arr_130_, 4
# 	mv	_plus_L_137_,_let_reduced_129_
# 	mv	_plus_R_138_,_tmp_133_
	add	x10, x10, x12
# was:	add	_fun_arg_res_136_, _plus_L_137_, _plus_R_138_
# 	mv	_let_reduced_129_,_fun_arg_res_136_
	addi	x13, x13, 1
# was:	addi	_ind_var_132_, _ind_var_132_, 1
	j	l.loop_beg_134_
l.loop_end_135_:
# 	mv	_tmp_139_,_let_reduced_129_
	mv	x18, x10
# was:	mv	_mainres_40_, _tmp_139_
	mv	x10, x18
# was:	mv	x10, _mainres_40_
	jal	p.putint
# was:	jal	p.putint, x10
l.endif_44_:
	mv	x10, x18
# was:	mv	x10, _mainres_40_
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
s.Incorre_49_:
	.word	16
	.asciz	"Incorrect Input!"
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