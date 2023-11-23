	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function write_nl
f.write_nl:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_b_1_,x10
	mv	x18, x10
# was:	mv	_tmp_4_, _param_b_1_
# 	mv	_let_res_3_,_tmp_4_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_5_
# was:	bne	_let_res_3_, x0, l.wBoolF_5_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_5_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_8_
# was:	la	_tmp_7_, s.X_8_
# s.X_8_: string "\n"
# 	mv	_let_tmp_6_,_tmp_7_
# 	mv	x10,_tmp_7_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	_write_nlres_2_, _let_res_3_
# 	mv	x10,_write_nlres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -16
	li	x10, 3
# was:	li	_div1_L_14_, 3
	li	x11, 2
# was:	li	_div2_R_15_, 2
	bne	x11, x0, l.safe_div_16_
# was:	bne	_div2_R_15_, x0, l.safe_div_16_
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_16_:
	div	x10, x10, x11
# was:	div	_eq_L_12_, _div1_L_14_, _div2_R_15_
	li	x12, 1
# was:	li	_eq_R_13_, 1
	li	x11, 0
# was:	li	_arg_11_, 0
	bne	x10, x12, l.false_17_
# was:	bne	_eq_L_12_, _eq_R_13_, l.false_17_
	li	x11, 1
# was:	li	_arg_11_, 1
l.false_17_:
	mv	x10, x11
# was:	mv	x10, _arg_11_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x18, x10
# was:	mv	_let_x0_10_, x10
	li	x10, 3
# was:	li	_div1_L_22_, 3
	sub	x10, x0, x10
# was:	sub	_div1_L_22_, x0, _div1_L_22_
	li	x11, 2
# was:	li	_div2_R_23_, 2
	bne	x11, x0, l.safe_div_24_
# was:	bne	_div2_R_23_, x0, l.safe_div_24_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_24_:
	div	x10, x10, x11
# was:	div	_eq_L_20_, _div1_L_22_, _div2_R_23_
	li	x12, 2
# was:	li	_eq_R_21_, 2
	sub	x12, x0, x12
# was:	sub	_eq_R_21_, x0, _eq_R_21_
	li	x11, 0
# was:	li	_arg_19_, 0
	bne	x10, x12, l.false_25_
# was:	bne	_eq_L_20_, _eq_R_21_, l.false_25_
	li	x11, 1
# was:	li	_arg_19_, 1
l.false_25_:
	mv	x10, x11
# was:	mv	x10, _arg_19_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x19, x10
# was:	mv	_let_x1_18_, x10
	li	x10, 3
# was:	li	_div1_L_30_, 3
	li	x11, 2
# was:	li	_div2_R_31_, 2
	sub	x11, x0, x11
# was:	sub	_div2_R_31_, x0, _div2_R_31_
	bne	x11, x0, l.safe_div_32_
# was:	bne	_div2_R_31_, x0, l.safe_div_32_
	li	x10, 9
# was:	li	x10, 9
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_32_:
	div	x10, x10, x11
# was:	div	_eq_L_28_, _div1_L_30_, _div2_R_31_
	li	x12, 2
# was:	li	_eq_R_29_, 2
	sub	x12, x0, x12
# was:	sub	_eq_R_29_, x0, _eq_R_29_
	li	x11, 0
# was:	li	_arg_27_, 0
	bne	x10, x12, l.false_33_
# was:	bne	_eq_L_28_, _eq_R_29_, l.false_33_
	li	x11, 1
# was:	li	_arg_27_, 1
l.false_33_:
	mv	x10, x11
# was:	mv	x10, _arg_27_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x20, x10
# was:	mv	_let_x2_26_, x10
	li	x10, 3
# was:	li	_div1_L_38_, 3
	sub	x10, x0, x10
# was:	sub	_div1_L_38_, x0, _div1_L_38_
	li	x11, 2
# was:	li	_div2_R_39_, 2
	sub	x11, x0, x11
# was:	sub	_div2_R_39_, x0, _div2_R_39_
	bne	x11, x0, l.safe_div_40_
# was:	bne	_div2_R_39_, x0, l.safe_div_40_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_div_40_:
	div	x10, x10, x11
# was:	div	_eq_L_36_, _div1_L_38_, _div2_R_39_
	li	x12, 1
# was:	li	_eq_R_37_, 1
	li	x11, 0
# was:	li	_arg_35_, 0
	bne	x10, x12, l.false_41_
# was:	bne	_eq_L_36_, _eq_R_37_, l.false_41_
	li	x11, 1
# was:	li	_arg_35_, 1
l.false_41_:
	mv	x10, x11
# was:	mv	x10, _arg_35_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_let_x3_34_,x10
# 	mv	_arg_42_,_let_x0_10_
	beq	x18, x0, l.endAnd_45_
# was:	beq	_arg_42_, x0, l.endAnd_45_
	mv	x18, x19
# was:	mv	_arg_42_, _let_x1_18_
	xori	x18, x18, 1
# was:	xori	_arg_42_, _arg_42_, 1
l.endAnd_45_:
	beq	x18, x0, l.endAnd_44_
# was:	beq	_arg_42_, x0, l.endAnd_44_
	mv	x18, x20
# was:	mv	_arg_42_, _let_x2_26_
	xori	x18, x18, 1
# was:	xori	_arg_42_, _arg_42_, 1
l.endAnd_44_:
	beq	x18, x0, l.endAnd_43_
# was:	beq	_arg_42_, x0, l.endAnd_43_
	mv	x18, x10
# was:	mv	_arg_42_, _let_x3_34_
l.endAnd_43_:
	mv	x10, x18
# was:	mv	x10, _arg_42_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_mainres_9_,x10
# 	mv	x10,_mainres_9_
	addi	x2, x2, 16
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
s.X_8_:
	.word	1
	.asciz	"\n"
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
