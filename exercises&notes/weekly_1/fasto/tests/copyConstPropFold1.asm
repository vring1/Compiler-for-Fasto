	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	li	x12, 40
# was:	li	_let_length_2_, 40
# 	mv	_size_4_,_let_length_2_
	bge	x12, x0, l.safe_5_
# was:	bge	_size_4_, x0, l.safe_5_
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_5_:
	mv	x10, x3
# was:	mv	_let_array_3_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_10_, _size_4_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_10_, _tmp_10_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_10_
	sw	x12, 0(x10)
# was:	sw	_size_4_, 0(_let_array_3_)
	addi	x13, x10, 4
# was:	addi	_addr_6_, _let_array_3_, 4
	mv	x11, x0
# was:	mv	_i_7_, x0
l.loop_beg_8_:
	bge	x11, x12, l.loop_end_9_
# was:	bge	_i_7_, _size_4_, l.loop_end_9_
	sw	x11, 0(x13)
# was:	sw	_i_7_, 0(_addr_6_)
	addi	x13, x13, 4
# was:	addi	_addr_6_, _addr_6_, 4
	addi	x11, x11, 1
# was:	addi	_i_7_, _i_7_, 1
	j	l.loop_beg_8_
l.loop_end_9_:
# 	mv	_div1_L_12_,_let_length_2_
	li	x11, 10
# was:	li	_div2_R_13_, 10
	bne	x11, x0, l.safe_div_14_
# was:	bne	_div2_R_13_, x0, l.safe_div_14_
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_14_:
	div	x11, x12, x11
# was:	div	_let_index_11_, _div1_L_12_, _div2_R_13_
# 	mv	_arr_ind_16_,_let_index_11_
	addi	x12, x10, 4
# was:	addi	_arr_data_17_, _let_array_3_, 4
	lw	x10, 0(x10)
# was:	lw	_size_18_, 0(_let_array_3_)
	bge	x11, x0, l.nonneg_20_
# was:	bge	_arr_ind_16_, x0, l.nonneg_20_
l.error_19_:
	li	x10, 5
# was:	li	x10, 5
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_20_:
	bge	x11, x10, l.error_19_
# was:	bge	_arr_ind_16_, _size_18_, l.error_19_
	slli	x11, x11, 2
# was:	slli	_arr_ind_16_, _arr_ind_16_, 2
	add	x12, x12, x11
# was:	add	_arr_data_17_, _arr_data_17_, _arr_ind_16_
	lw	x11, 0(x12)
# was:	lw	_let_x_15_, 0(_arr_data_17_)
# 	mv	_mult1_L_24_,_let_x_15_
	li	x10, 1
# was:	li	_mult2_R_25_, 1
	mul	x11, x11, x10
# was:	mul	_plus_L_22_, _mult1_L_24_, _mult2_R_25_
	li	x10, 0
# was:	li	_plus_R_23_, 0
	add	x18, x11, x10
# was:	add	_tmp_21_, _plus_L_22_, _plus_R_23_
# 	mv	_mainres_1_,_tmp_21_
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _mainres_1_
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