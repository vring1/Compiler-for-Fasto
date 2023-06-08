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
# Function write_1darr
f.write_1darr:
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
# was:	mv	_write_1darrres_5_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_15_, _size_6_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_15_, _tmp_15_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_15_
	sw	x18, 0(x19)
# was:	sw	_size_6_, 0(_write_1darrres_5_)
	addi	x20, x19, 4
# was:	addi	_addrg_10_, _write_1darrres_5_, 4
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
# was:	mv	x10, _write_1darrres_5_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function write_2darr
f.write_2darr:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
# 	mv	_param_x_16_,x10
# 	mv	_arr_19_,_param_x_16_
	lw	x18, 0(x10)
# was:	lw	_size_18_, 0(_arr_19_)
	mv	x19, x3
# was:	mv	_write_2darrres_17_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_27_, _size_18_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_27_, _tmp_27_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_27_
	sw	x18, 0(x19)
# was:	sw	_size_18_, 0(_write_2darrres_17_)
	addi	x20, x19, 4
# was:	addi	_addrg_22_, _write_2darrres_17_, 4
	mv	x21, x0
# was:	mv	_i_23_, x0
	addi	x22, x10, 4
# was:	addi	_elem_20_, _arr_19_, 4
l.loop_beg_24_:
	bge	x21, x18, l.loop_end_25_
# was:	bge	_i_23_, _size_18_, l.loop_end_25_
	lw	x10, 0(x22)
# was:	lw	_res_21_, 0(_elem_20_)
	addi	x22, x22, 4
# was:	addi	_elem_20_, _elem_20_, 4
# 	mv	x10,_res_21_
	jal	f.write_1darr
# was:	jal	f.write_1darr, x10
# 	mv	_tmp_26_,x10
# 	mv	_res_21_,_tmp_26_
	sw	x10, 0(x20)
# was:	sw	_res_21_, 0(_addrg_22_)
	addi	x20, x20, 4
# was:	addi	_addrg_22_, _addrg_22_, 4
	addi	x21, x21, 1
# was:	addi	_i_23_, _i_23_, 1
	j	l.loop_beg_24_
l.loop_end_25_:
	mv	x10, x19
# was:	mv	x10, _write_2darrres_17_
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
	sw	x18, -8(x2)
	addi	x2, x2, -8
	li	x10, 2
# was:	li	_size_34_, 2
	bge	x10, x0, l.safe_35_
# was:	bge	_size_34_, x0, l.safe_35_
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_35_:
	mv	x14, x3
# was:	mv	_arr_31_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_40_, _size_34_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_40_, _tmp_40_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_40_
	sw	x10, 0(x14)
# was:	sw	_size_34_, 0(_arr_31_)
	addi	x11, x14, 4
# was:	addi	_addr_36_, _arr_31_, 4
	mv	x12, x0
# was:	mv	_i_37_, x0
l.loop_beg_38_:
	bge	x12, x10, l.loop_end_39_
# was:	bge	_i_37_, _size_34_, l.loop_end_39_
	sw	x12, 0(x11)
# was:	sw	_i_37_, 0(_addr_36_)
	addi	x11, x11, 4
# was:	addi	_addr_36_, _addr_36_, 4
	addi	x12, x12, 1
# was:	addi	_i_37_, _i_37_, 1
	j	l.loop_beg_38_
l.loop_end_39_:
	lw	x11, 0(x14)
# was:	lw	_size_30_, 0(_arr_31_)
	mv	x10, x3
# was:	mv	_let_arr_29_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_53_, _size_30_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_53_, _tmp_53_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_53_
	sw	x11, 0(x10)
# was:	sw	_size_30_, 0(_let_arr_29_)
	addi	x12, x10, 4
# was:	addi	_addrg_41_, _let_arr_29_, 4
	mv	x13, x0
# was:	mv	_i_42_, x0
	addi	x14, x14, 4
# was:	addi	_elem_32_, _arr_31_, 4
l.loop_beg_43_:
	bge	x13, x11, l.loop_end_44_
# was:	bge	_i_42_, _size_30_, l.loop_end_44_
	lw	x16, 0(x14)
# was:	lw	_res_33_, 0(_elem_32_)
	addi	x14, x14, 4
# was:	addi	_elem_32_, _elem_32_, 4
	li	x15, 7
# was:	li	_size_46_, 7
	bge	x15, x0, l.safe_47_
# was:	bge	_size_46_, x0, l.safe_47_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_47_:
	mv	x16, x3
# was:	mv	_fun_arg_res_45_, x3
	slli	x17, x15, 2
# was:	slli	_tmp_52_, _size_46_, 2
	addi	x17, x17, 4
# was:	addi	_tmp_52_, _tmp_52_, 4
	add	x3, x3, x17
# was:	add	x3, x3, _tmp_52_
	sw	x15, 0(x16)
# was:	sw	_size_46_, 0(_fun_arg_res_45_)
	addi	x18, x16, 4
# was:	addi	_addr_48_, _fun_arg_res_45_, 4
	mv	x17, x0
# was:	mv	_i_49_, x0
l.loop_beg_50_:
	bge	x17, x15, l.loop_end_51_
# was:	bge	_i_49_, _size_46_, l.loop_end_51_
	sw	x17, 0(x18)
# was:	sw	_i_49_, 0(_addr_48_)
	addi	x18, x18, 4
# was:	addi	_addr_48_, _addr_48_, 4
	addi	x17, x17, 1
# was:	addi	_i_49_, _i_49_, 1
	j	l.loop_beg_50_
l.loop_end_51_:
# 	mv	_res_33_,_fun_arg_res_45_
	sw	x16, 0(x12)
# was:	sw	_res_33_, 0(_addrg_41_)
	addi	x12, x12, 4
# was:	addi	_addrg_41_, _addrg_41_, 4
	addi	x13, x13, 1
# was:	addi	_i_42_, _i_42_, 1
	j	l.loop_beg_43_
l.loop_end_44_:
# 	mv	_arg_54_,_let_arr_29_
# 	mv	x10,_arg_54_
	jal	f.write_2darr
# was:	jal	f.write_2darr, x10
# 	mv	_mainres_28_,x10
# 	mv	x10,_mainres_28_
	addi	x2, x2, 8
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