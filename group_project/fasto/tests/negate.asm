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
# was:	li	_divide_L_14_, 3
	li	x11, 2
# was:	li	_divide_R_15_, 2
	beq	x11, x0, l.divByZero_16_
# was:	beq	_divide_R_15_, x0, l.divByZero_16_
	div	x11, x10, x11
# was:	div	_eq_L_12_, _divide_L_14_, _divide_R_15_
	j	l.divLegal_17_
l.divByZero_16_:
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.divLegal_17_:
	li	x10, 1
# was:	li	_eq_R_13_, 1
	li	x12, 0
# was:	li	_arg_11_, 0
	bne	x11, x10, l.false_18_
# was:	bne	_eq_L_12_, _eq_R_13_, l.false_18_
	li	x12, 1
# was:	li	_arg_11_, 1
l.false_18_:
	mv	x10, x12
# was:	mv	x10, _arg_11_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x19, x10
# was:	mv	_let_x0_10_, x10
	li	x10, 3
# was:	li	_divide_L_24_, 3
	li	x11, 2
# was:	li	_divide_R_25_, 2
	beq	x11, x0, l.divByZero_26_
# was:	beq	_divide_R_25_, x0, l.divByZero_26_
	div	x10, x10, x11
# was:	div	_negate_23_, _divide_L_24_, _divide_R_25_
	j	l.divLegal_27_
l.divByZero_26_:
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.divLegal_27_:
	sub	x11, x0, x10
# was:	sub	_eq_L_21_, x0, _negate_23_
	li	x10, 2
# was:	li	_negate_28_, 2
	sub	x10, x0, x10
# was:	sub	_eq_R_22_, x0, _negate_28_
	li	x12, 0
# was:	li	_arg_20_, 0
	bne	x11, x10, l.false_29_
# was:	bne	_eq_L_21_, _eq_R_22_, l.false_29_
	li	x12, 1
# was:	li	_arg_20_, 1
l.false_29_:
	mv	x10, x12
# was:	mv	x10, _arg_20_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x18, x10
# was:	mv	_let_x1_19_, x10
	li	x10, 3
# was:	li	_divide_L_34_, 3
	li	x11, 2
# was:	li	_negate_38_, 2
	sub	x11, x0, x11
# was:	sub	_divide_R_35_, x0, _negate_38_
	beq	x11, x0, l.divByZero_36_
# was:	beq	_divide_R_35_, x0, l.divByZero_36_
	div	x10, x10, x11
# was:	div	_eq_L_32_, _divide_L_34_, _divide_R_35_
	j	l.divLegal_37_
l.divByZero_36_:
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.divLegal_37_:
	li	x11, 2
# was:	li	_negate_39_, 2
	sub	x11, x0, x11
# was:	sub	_eq_R_33_, x0, _negate_39_
	li	x12, 0
# was:	li	_arg_31_, 0
	bne	x10, x11, l.false_40_
# was:	bne	_eq_L_32_, _eq_R_33_, l.false_40_
	li	x12, 1
# was:	li	_arg_31_, 1
l.false_40_:
	mv	x10, x12
# was:	mv	x10, _arg_31_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x20, x10
# was:	mv	_let_x2_30_, x10
	li	x10, 3
# was:	li	_divide_L_46_, 3
	li	x11, 2
# was:	li	_negate_50_, 2
	sub	x11, x0, x11
# was:	sub	_divide_R_47_, x0, _negate_50_
	beq	x11, x0, l.divByZero_48_
# was:	beq	_divide_R_47_, x0, l.divByZero_48_
	div	x10, x10, x11
# was:	div	_negate_45_, _divide_L_46_, _divide_R_47_
	j	l.divLegal_49_
l.divByZero_48_:
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.divLegal_49_:
	sub	x10, x0, x10
# was:	sub	_eq_L_43_, x0, _negate_45_
	li	x11, 1
# was:	li	_eq_R_44_, 1
	li	x12, 0
# was:	li	_arg_42_, 0
	bne	x10, x11, l.false_51_
# was:	bne	_eq_L_43_, _eq_R_44_, l.false_51_
	li	x12, 1
# was:	li	_arg_42_, 1
l.false_51_:
	mv	x10, x12
# was:	mv	x10, _arg_42_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_let_x3_41_,x10
# 	mv	_and_L_57_,_let_x0_10_
	beq	x19, x0, l.false_60_
# was:	beq	_and_L_57_, x0, l.false_60_
# 	mv	_not_59_,_let_x1_19_
	xori	x11, x18, 1
# was:	xori	_and_R_58_, _not_59_, 1
	beq	x11, x0, l.false_60_
# was:	beq	_and_R_58_, x0, l.false_60_
	li	x11, 1
# was:	li	_and_L_55_, 1
	j	l.end_61_
l.false_60_:
	li	x11, 0
# was:	li	_and_L_55_, 0
l.end_61_:
	beq	x11, x0, l.false_63_
# was:	beq	_and_L_55_, x0, l.false_63_
# 	mv	_not_62_,_let_x2_30_
	xori	x11, x20, 1
# was:	xori	_and_R_56_, _not_62_, 1
	beq	x11, x0, l.false_63_
# was:	beq	_and_R_56_, x0, l.false_63_
	li	x11, 1
# was:	li	_and_L_53_, 1
	j	l.end_64_
l.false_63_:
	li	x11, 0
# was:	li	_and_L_53_, 0
l.end_64_:
	beq	x11, x0, l.false_65_
# was:	beq	_and_L_53_, x0, l.false_65_
# 	mv	_and_R_54_,_let_x3_41_
	beq	x10, x0, l.false_65_
# was:	beq	_and_R_54_, x0, l.false_65_
	li	x10, 1
# was:	li	_arg_52_, 1
	j	l.end_66_
l.false_65_:
	li	x10, 0
# was:	li	_arg_52_, 0
l.end_66_:
# 	mv	x10,_arg_52_
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