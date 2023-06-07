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
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -20
	li	x10, 3
# was:	li	_divide_L_14_, 3
	li	x12, 2
# was:	li	_divide_R_15_, 2
	beq	x12, x0, l.divByZero_16_
# was:	beq	_divide_R_15_, x0, l.divByZero_16_
	div	x11, x10, x12
# was:	div	_eq_L_12_, _divide_L_14_, _divide_R_15_
	j	l.divByZero_16_
l.divByZero_16_:
	li	x12, 1
# was:	li	_eq_R_13_, 1
	li	x10, 0
# was:	li	_arg_11_, 0
	bne	x11, x12, l.false_17_
# was:	bne	_eq_L_12_, _eq_R_13_, l.false_17_
	li	x10, 1
# was:	li	_arg_11_, 1
l.false_17_:
# 	mv	x10,_arg_11_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x19, x10
# was:	mv	_let_x0_10_, x10
	li	x10, 3
# was:	li	_divide_L_23_, 3
	li	x11, 2
# was:	li	_divide_R_24_, 2
	beq	x11, x0, l.divByZero_25_
# was:	beq	_divide_R_24_, x0, l.divByZero_25_
	div	x20, x10, x11
# was:	div	_negate_22_, _divide_L_23_, _divide_R_24_
	j	l.divByZero_25_
l.divByZero_25_:
	sub	x11, x0, x20
# was:	sub	_eq_L_20_, x0, _negate_22_
	li	x10, 2
# was:	li	_negate_26_, 2
	sub	x12, x0, x10
# was:	sub	_eq_R_21_, x0, _negate_26_
	li	x10, 0
# was:	li	_arg_19_, 0
	bne	x11, x12, l.false_27_
# was:	bne	_eq_L_20_, _eq_R_21_, l.false_27_
	li	x10, 1
# was:	li	_arg_19_, 1
l.false_27_:
# 	mv	x10,_arg_19_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x20, x10
# was:	mv	_let_x1_18_, x10
	li	x10, 3
# was:	li	_divide_L_32_, 3
	li	x11, 2
# was:	li	_negate_35_, 2
	sub	x11, x0, x11
# was:	sub	_divide_R_33_, x0, _negate_35_
	beq	x11, x0, l.divByZero_34_
# was:	beq	_divide_R_33_, x0, l.divByZero_34_
	div	x21, x10, x11
# was:	div	_eq_L_30_, _divide_L_32_, _divide_R_33_
	j	l.divByZero_34_
l.divByZero_34_:
	li	x10, 2
# was:	li	_negate_36_, 2
	sub	x11, x0, x10
# was:	sub	_eq_R_31_, x0, _negate_36_
	li	x10, 0
# was:	li	_arg_29_, 0
	bne	x21, x11, l.false_37_
# was:	bne	_eq_L_30_, _eq_R_31_, l.false_37_
	li	x10, 1
# was:	li	_arg_29_, 1
l.false_37_:
# 	mv	x10,_arg_29_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x21, x10
# was:	mv	_let_x2_28_, x10
	li	x10, 3
# was:	li	_divide_L_43_, 3
	li	x11, 2
# was:	li	_negate_46_, 2
	sub	x11, x0, x11
# was:	sub	_divide_R_44_, x0, _negate_46_
	beq	x11, x0, l.divByZero_45_
# was:	beq	_divide_R_44_, x0, l.divByZero_45_
	div	x18, x10, x11
# was:	div	_negate_42_, _divide_L_43_, _divide_R_44_
	j	l.divByZero_45_
l.divByZero_45_:
	sub	x12, x0, x18
# was:	sub	_eq_L_40_, x0, _negate_42_
	li	x10, 1
# was:	li	_eq_R_41_, 1
	li	x11, 0
# was:	li	_arg_39_, 0
	bne	x12, x10, l.false_47_
# was:	bne	_eq_L_40_, _eq_R_41_, l.false_47_
	li	x11, 1
# was:	li	_arg_39_, 1
l.false_47_:
	mv	x10, x11
# was:	mv	x10, _arg_39_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_let_x3_38_,x10
# 	mv	_and_L_53_,_let_x0_10_
	beq	x19, x0, l.false_56_
# was:	beq	_and_L_53_, x0, l.false_56_
# 	mv	_not_55_,_let_x1_18_
	xori	x11, x20, 1
# was:	xori	_and_R_54_, _not_55_, 1
	beq	x11, x0, l.false_56_
# was:	beq	_and_R_54_, x0, l.false_56_
	li	x11, 1
# was:	li	_and_L_51_, 1
	j	l.end_57_
l.false_56_:
	li	x11, 0
# was:	li	_and_L_51_, 0
l.end_57_:
	beq	x11, x0, l.false_59_
# was:	beq	_and_L_51_, x0, l.false_59_
# 	mv	_not_58_,_let_x2_28_
	xori	x11, x21, 1
# was:	xori	_and_R_52_, _not_58_, 1
	beq	x11, x0, l.false_59_
# was:	beq	_and_R_52_, x0, l.false_59_
	li	x11, 1
# was:	li	_and_L_49_, 1
	j	l.end_60_
l.false_59_:
	li	x11, 0
# was:	li	_and_L_49_, 0
l.end_60_:
	beq	x11, x0, l.false_61_
# was:	beq	_and_L_49_, x0, l.false_61_
# 	mv	_and_R_50_,_let_x3_38_
	beq	x10, x0, l.false_61_
# was:	beq	_and_R_50_, x0, l.false_61_
	li	x10, 1
# was:	li	_arg_48_, 1
	j	l.end_62_
l.false_61_:
	li	x10, 0
# was:	li	_arg_48_, 0
l.end_62_:
# 	mv	x10,_arg_48_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_mainres_9_,x10
# 	mv	x10,_mainres_9_
	addi	x2, x2, 20
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