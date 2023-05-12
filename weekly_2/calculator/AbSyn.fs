module AbSyn

(* These are the same types as in last week's assignment. *)

type VALUE = INT of int

type BINOP = BPLUS | BMINUS | BTIMES

type RANGEOP = RSUM | RPROD | RMAX | RARGMAX

type EXP =
  | CONSTANT  of VALUE
  | VARIABLE  of string
  | OPERATE   of BINOP * EXP * EXP
  | LET_IN    of string * EXP * EXP
  | OVER      of RANGEOP * string * EXP * EXP * EXP

