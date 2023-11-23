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
	mv	x12, x10
# was:	mv	_let_n_17_, x10
# 	mv	_size_19_,_let_n_17_
	bge	x12, x0, l.safe_20_
# was:	bge	_size_19_, x0, l.safe_20_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_20_:
	mv	x17, x3
# was:	mv	_let_x_18_, x3
	slli	x10, x12, 2
# was:	slli	_tmp_25_, _size_19_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_25_, _tmp_25_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_25_
	sw	x12, 0(x17)
# was:	sw	_size_19_, 0(_let_x_18_)
	addi	x11, x17, 4
# was:	addi	_addr_21_, _let_x_18_, 4
	mv	x10, x0
# was:	mv	_i_22_, x0
l.loop_beg_23_:
	bge	x10, x12, l.loop_end_24_
# was:	bge	_i_22_, _size_19_, l.loop_end_24_
	sw	x10, 0(x11)
# was:	sw	_i_22_, 0(_addr_21_)
	addi	x11, x11, 4
# was:	addi	_addr_21_, _addr_21_, 4
	addi	x10, x10, 1
# was:	addi	_i_22_, _i_22_, 1
	j	l.loop_beg_23_
l.loop_end_24_:
	mv	x11, x12
# was:	mv	_size_27_, _let_n_17_
	bge	x11, x0, l.safe_28_
# was:	bge	_size_27_, x0, l.safe_28_
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_28_:
	mv	x15, x3
# was:	mv	_let_y_26_, x3
	slli	x10, x11, 2
# was:	slli	_tmp_33_, _size_27_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_33_, _tmp_33_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_33_
	sw	x11, 0(x15)
# was:	sw	_size_27_, 0(_let_y_26_)
	addi	x12, x15, 4
# was:	addi	_addr_29_, _let_y_26_, 4
	mv	x10, x0
# was:	mv	_i_30_, x0
l.loop_beg_31_:
	bge	x10, x11, l.loop_end_32_
# was:	bge	_i_30_, _size_27_, l.loop_end_32_
	sw	x10, 0(x12)
# was:	sw	_i_30_, 0(_addr_29_)
	addi	x12, x12, 4
# was:	addi	_addr_29_, _addr_29_, 4
	addi	x10, x10, 1
# was:	addi	_i_30_, _i_30_, 1
	j	l.loop_beg_31_
l.loop_end_32_:
	li	x10, 1
# was:	li	_mult1_L_38_, 1
# 	mv	_len_arr_40_,_let_x_18_
	lw	x11, 0(x17)
# was:	lw	_mult2_R_39_, 0(_len_arr_40_)
	mul	x10, x10, x11
# was:	mul	_mult1_L_36_, _mult1_L_38_, _mult2_R_39_
# 	mv	_len_arr_41_,_let_y_26_
	lw	x11, 0(x15)
# was:	lw	_mult2_R_37_, 0(_len_arr_41_)
	mul	x16, x10, x11
# was:	mul	_let_stride_$$Fasto_35_, _mult1_L_36_, _mult2_R_37_
# 	mv	_size_47_,_let_stride_$$Fasto_35_
	bge	x16, x0, l.safe_48_
# was:	bge	_size_47_, x0, l.safe_48_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_48_:
	mv	x14, x3
# was:	mv	_arr_44_, x3
	slli	x10, x16, 2
# was:	slli	_tmp_53_, _size_47_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_53_, _tmp_53_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_53_
	sw	x16, 0(x14)
# was:	sw	_size_47_, 0(_arr_44_)
	addi	x10, x14, 4
# was:	addi	_addr_49_, _arr_44_, 4
	mv	x11, x0
# was:	mv	_i_50_, x0
l.loop_beg_51_:
	bge	x11, x16, l.loop_end_52_
# was:	bge	_i_50_, _size_47_, l.loop_end_52_
	sw	x11, 0(x10)
# was:	sw	_i_50_, 0(_addr_49_)
	addi	x10, x10, 4
# was:	addi	_addr_49_, _addr_49_, 4
	addi	x11, x11, 1
# was:	addi	_i_50_, _i_50_, 1
	j	l.loop_beg_51_
l.loop_end_52_:
	lw	x10, 0(x14)
# was:	lw	_size_43_, 0(_arr_44_)
	mv	x11, x3
# was:	mv	_let_rs_$$Fasto_42_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_105_, _size_43_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_105_, _tmp_105_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_105_
	sw	x10, 0(x11)
# was:	sw	_size_43_, 0(_let_rs_$$Fasto_42_)
	addi	x13, x11, 4
# was:	addi	_addrg_54_, _let_rs_$$Fasto_42_, 4
	mv	x12, x0
# was:	mv	_i_55_, x0
	addi	x14, x14, 4
# was:	addi	_elem_45_, _arr_44_, 4
l.loop_beg_56_:
	bge	x12, x10, l.loop_end_57_
# was:	bge	_i_55_, _size_43_, l.loop_end_57_
	lw	x18, 0(x14)
# was:	lw	_res_46_, 0(_elem_45_)
	addi	x14, x14, 4
# was:	addi	_elem_45_, _elem_45_, 4
# 	mv	_div1_L_60_,_let_stride_$$Fasto_35_
# 	mv	_len_arr_63_,_let_y_26_
	lw	x19, 0(x15)
# was:	lw	_div2_R_61_, 0(_len_arr_63_)
	bne	x19, x0, l.safe_div_62_
# was:	bne	_div2_R_61_, x0, l.safe_div_62_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_62_:
	div	x19, x16, x19
# was:	div	_let_stride_$$Fasto_59_, _div1_L_60_, _div2_R_61_
# 	mv	_div1_L_65_,_res_46_
# 	mv	_div2_R_66_,_let_stride_$$Fasto_59_
	bne	x19, x0, l.safe_div_67_
# was:	bne	_div2_R_66_, x0, l.safe_div_67_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_67_:
	div	x21, x18, x19
# was:	div	_let_i_$$Fasto_64_, _div1_L_65_, _div2_R_66_
# 	mv	_minus_L_69_,_res_46_
# 	mv	_mult1_L_71_,_let_i_$$Fasto_64_
# 	mv	_mult2_R_72_,_let_stride_$$Fasto_59_
	mul	x20, x21, x19
# was:	mul	_minus_R_70_, _mult1_L_71_, _mult2_R_72_
	sub	x20, x18, x20
# was:	sub	_let_flat_ind_$$Fasto_68_, _minus_L_69_, _minus_R_70_
# 	mv	_arr_ind_74_,_let_i_$$Fasto_64_
	addi	x22, x15, 4
# was:	addi	_arr_data_75_, _let_y_26_, 4
	lw	x18, 0(x15)
# was:	lw	_size_76_, 0(_let_y_26_)
	bge	x21, x0, l.nonneg_78_
# was:	bge	_arr_ind_74_, x0, l.nonneg_78_
l.error_77_:
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_78_:
	bge	x21, x18, l.error_77_
# was:	bge	_arr_ind_74_, _size_76_, l.error_77_
	slli	x21, x21, 2
# was:	slli	_arr_ind_74_, _arr_ind_74_, 2
	add	x22, x22, x21
# was:	add	_arr_data_75_, _arr_data_75_, _arr_ind_74_
	lw	x18, 0(x22)
# was:	lw	_let_j_73_, 0(_arr_data_75_)
	mv	x21, x19
# was:	mv	_div1_L_80_, _let_stride_$$Fasto_59_
# 	mv	_len_arr_83_,_let_x_18_
	lw	x19, 0(x17)
# was:	lw	_div2_R_81_, 0(_len_arr_83_)
	bne	x19, x0, l.safe_div_82_
# was:	bne	_div2_R_81_, x0, l.safe_div_82_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_82_:
	div	x21, x21, x19
# was:	div	_let_stride_$$Fasto_79_, _div1_L_80_, _div2_R_81_
# 	mv	_div1_L_85_,_let_flat_ind_$$Fasto_68_
# 	mv	_div2_R_86_,_let_stride_$$Fasto_79_
	bne	x21, x0, l.safe_div_87_
# was:	bne	_div2_R_86_, x0, l.safe_div_87_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_87_:
	div	x19, x20, x21
# was:	div	_let_i_$$Fasto_84_, _div1_L_85_, _div2_R_86_
# 	mv	_minus_L_89_,_let_flat_ind_$$Fasto_68_
# 	mv	_mult1_L_91_,_let_i_$$Fasto_84_
# 	mv	_mult2_R_92_,_let_stride_$$Fasto_79_
	mul	x21, x19, x21
# was:	mul	_minus_R_90_, _mult1_L_91_, _mult2_R_92_
	sub	x0, x20, x21
# was:	sub	_let_flat_ind_$$Fasto_88_, _minus_L_89_, _minus_R_90_
	mv	x20, x19
# was:	mv	_arr_ind_94_, _let_i_$$Fasto_84_
	addi	x19, x17, 4
# was:	addi	_arr_data_95_, _let_x_18_, 4
	lw	x21, 0(x17)
# was:	lw	_size_96_, 0(_let_x_18_)
	bge	x20, x0, l.nonneg_98_
# was:	bge	_arr_ind_94_, x0, l.nonneg_98_
l.error_97_:
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_98_:
	bge	x20, x21, l.error_97_
# was:	bge	_arr_ind_94_, _size_96_, l.error_97_
	slli	x20, x20, 2
# was:	slli	_arr_ind_94_, _arr_ind_94_, 2
	add	x19, x19, x20
# was:	add	_arr_data_95_, _arr_data_95_, _arr_ind_94_
	lw	x19, 0(x19)
# was:	lw	_let_i_93_, 0(_arr_data_95_)
# 	mv	_plus_L_103_,_let_i_93_
# 	mv	_plus_R_104_,_let_j_73_
	add	x19, x19, x18
# was:	add	_div1_L_100_, _plus_L_103_, _plus_R_104_
	li	x18, 2
# was:	li	_div2_R_101_, 2
	bne	x18, x0, l.safe_div_102_
# was:	bne	_div2_R_101_, x0, l.safe_div_102_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_102_:
	div	x18, x19, x18
# was:	div	_let_r_99_, _div1_L_100_, _div2_R_101_
# 	mv	_fun_arg_res_58_,_let_r_99_
# 	mv	_res_46_,_fun_arg_res_58_
	sw	x18, 0(x13)
# was:	sw	_res_46_, 0(_addrg_54_)
	addi	x13, x13, 4
# was:	addi	_addrg_54_, _addrg_54_, 4
	addi	x12, x12, 1
# was:	addi	_i_55_, _i_55_, 1
	j	l.loop_beg_56_
l.loop_end_57_:
# 	mv	_arr_108_,_let_rs_$$Fasto_42_
	lw	x10, 0(x11)
# was:	lw	_size_107_, 0(_arr_108_)
	mv	x12, x3
# was:	mv	_let_rs_$$Fasto_106_, x3
	slli	x13, x10, 2
# was:	slli	_tmp_128_, _size_107_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_128_, _tmp_128_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_128_
	sw	x10, 0(x12)
# was:	sw	_size_107_, 0(_let_rs_$$Fasto_106_)
	addi	x14, x12, 4
# was:	addi	_addr_112_, _let_rs_$$Fasto_106_, 4
	addi	x11, x11, 4
# was:	addi	_arr_108_, _arr_108_, 4
	mv	x15, x0
# was:	mv	_i_113_, x0
	mv	x13, x0
# was:	mv	_count_111_, x0
l.loop_beg_114_:
	bge	x15, x10, l.loop_end_115_
# was:	bge	_i_113_, _size_107_, l.loop_end_115_
	lw	x16, 0(x11)
# was:	lw	_elem_109_, 0(_arr_108_)
	addi	x11, x11, 4
# was:	addi	_arr_108_, _arr_108_, 4
# 	mv	_minus_L_120_,_elem_109_
	mv	x18, x16
# was:	mv	_div1_L_124_, _elem_109_
	li	x17, 5
# was:	li	_div2_R_125_, 5
	bne	x17, x0, l.safe_div_126_
# was:	bne	_div2_R_125_, x0, l.safe_div_126_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_126_:
	div	x18, x18, x17
# was:	div	_mult1_L_122_, _div1_L_124_, _div2_R_125_
	li	x17, 5
# was:	li	_mult2_R_123_, 5
	mul	x17, x18, x17
# was:	mul	_minus_R_121_, _mult1_L_122_, _mult2_R_123_
	sub	x19, x16, x17
# was:	sub	_eq_L_118_, _minus_L_120_, _minus_R_121_
	li	x18, 0
# was:	li	_eq_R_119_, 0
	li	x17, 0
# was:	li	_fun_arg_res_117_, 0
	bne	x19, x18, l.false_127_
# was:	bne	_eq_L_118_, _eq_R_119_, l.false_127_
	li	x17, 1
# was:	li	_fun_arg_res_117_, 1
l.false_127_:
# 	mv	_bool_110_,_fun_arg_res_117_
	beq	x17, x0, l.if_end_116_
# was:	beq	_bool_110_, x0, l.if_end_116_
	sw	x16, 0(x14)
# was:	sw	_elem_109_, 0(_addr_112_)
	addi	x14, x14, 4
# was:	addi	_addr_112_, _addr_112_, 4
	addi	x13, x13, 1
# was:	addi	_count_111_, _count_111_, 1
l.if_end_116_:
	addi	x15, x15, 1
# was:	addi	_i_113_, _i_113_, 1
	j	l.loop_beg_114_
l.loop_end_115_:
	sw	x13, 0(x12)
# was:	sw	_count_111_, 0(_let_rs_$$Fasto_106_)
# 	mv	_arr_130_,_let_rs_$$Fasto_106_
	lw	x11, 0(x12)
# was:	lw	_size_129_, 0(_arr_130_)
	mv	x10, x3
# was:	mv	_arg_34_, x3
	slli	x13, x11, 2
# was:	slli	_tmp_140_, _size_129_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_140_, _tmp_140_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_140_
	sw	x11, 0(x10)
# was:	sw	_size_129_, 0(_arg_34_)
	addi	x13, x10, 4
# was:	addi	_addrg_133_, _arg_34_, 4
	mv	x14, x0
# was:	mv	_i_134_, x0
	addi	x15, x12, 4
# was:	addi	_elem_131_, _arr_130_, 4
l.loop_beg_135_:
	bge	x14, x11, l.loop_end_136_
# was:	bge	_i_134_, _size_129_, l.loop_end_136_
	lw	x12, 0(x15)
# was:	lw	_res_132_, 0(_elem_131_)
	addi	x15, x15, 4
# was:	addi	_elem_131_, _elem_131_, 4
# 	mv	_mult1_L_138_,_res_132_
	mv	x16, x12
# was:	mv	_mult2_R_139_, _res_132_
	mul	x12, x12, x16
# was:	mul	_fun_arg_res_137_, _mult1_L_138_, _mult2_R_139_
# 	mv	_res_132_,_fun_arg_res_137_
	sw	x12, 0(x13)
# was:	sw	_res_132_, 0(_addrg_133_)
	addi	x13, x13, 4
# was:	addi	_addrg_133_, _addrg_133_, 4
	addi	x14, x14, 1
# was:	addi	_i_134_, _i_134_, 1
	j	l.loop_beg_135_
l.loop_end_136_:
# 	mv	x10,_arg_34_
	jal	f.write_int_arr
# was:	jal	f.write_int_arr, x10
# 	mv	_mainres_16_,x10
# 	mv	x10,_mainres_16_
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