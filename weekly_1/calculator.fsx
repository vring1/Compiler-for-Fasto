(* ABSTRACT SYNTAX *)
//
type VALUE = INT of int

type BINOP = BPLUS | BMINUS | BTIMES

type RANGEOP = RSUM | RPROD | RMAX | RARGMAX

type EXP =
  | CONSTANT  of VALUE
  | VARIABLE  of string
  | OPERATE   of BINOP * EXP * EXP
  | LET_IN    of string * EXP * EXP
  | OVER      of RANGEOP * string * EXP * EXP * EXP

(* A list mapping variable names to their values. *)
type SymTab = (string * VALUE) list

(* Inserts a variable into the variable table. *)
let bind v k vtab = (v, k) :: vtab : SymTab


(* Lookup a the value of a variable. *)
let rec lookup v = function
  | (v', k) :: vtab -> if v = v' then k else lookup v vtab
  | (_ : SymTab)    -> failwith ("unbound variable : " + v)


let value_to_int_conversion(v: VALUE) : int =
  match v with INT (i: int) -> i
(* EVALUATION *)

(*****************************************************
 * TODO: Task 2: complete the definition of `eval`. You may also
 * define any auxiliary functions as you see fit, to help express `eval`
 * as cleanly and concisely as possible.
 ****************************************************)

(* The evaluation function. *)


let rec eval (vtab : SymTab) (e : EXP) : VALUE =
  match e with
    | CONSTANT n -> n
    | VARIABLE v -> lookup v vtab
    | OPERATE (op, e1, e2) -> 
      let value_1 = eval vtab e1 in
      let value_2 = eval vtab e2 in
      match op with
      | BPLUS -> INT(match (value_1, value_2) with INT(x), INT(y) -> x + y)
      | BMINUS -> INT(match (value_1, value_2) with INT(x), INT(y) -> x - y)
      | BTIMES -> INT(match (value_1, value_2) with INT(x), INT(y) -> x * y)
    | LET_IN (var, e1, e2) ->
      let v1 = eval vtab e1 in
      let vtab2 = bind var v1 vtab in
      eval vtab2 e2
    | OVER (rop, var, e1, e2, e3) ->
      let v1 = eval vtab e1 in
      let v2 = eval vtab e2 in
      let vtab2 = bind var v1 vtab in
      let v3 = eval vtab2 e3 in
      match rop with
        | RSUM -> INT(match (v1, v2, v3) with INT(x), INT(y), INT(z) -> if x <= y then z + value_to_int_conversion(
                                                                                                  eval vtab2 (OVER (rop, var, (CONSTANT (INT (x + 1))), e2, e3))
                                                                                                  )
                                                                                                  else 0)
        | RPROD -> INT(match (v1, v2, v3) with INT(x), INT(y), INT(z) -> if x <= y then z * value_to_int_conversion(
                                                                                                  eval vtab2 (OVER (rop, var, (CONSTANT (INT (x + 1))), e2, e3))
                                                                                                  )
                                                                                                  else 1)
        | RMAX -> INT(match (v1, v2, v3) with INT(x), INT(y), INT(z) -> if x <= y then value_to_int_conversion(
                                                                                                  eval vtab2 (OVER (rop, var, (CONSTANT (INT (x + 1))), e2, e3))
                                                                                                  ) else if z <= value_to_int_conversion(
                                                                                                      eval vtab2 (OVER (rop, var, (CONSTANT (INT (x + 1))), e2, e3))) then
                                                                                                          value_to_int_conversion(
                                                                                                            eval vtab2 (OVER (rop, var, (CONSTANT (INT (x + 1))), e2, e3)))
                                                                                                  else z)
        | RARGMAX -> INT(match (v1, v2, v3) with INT(x), INT(y), INT(z) -> if x <= y then value_to_int_conversion(
                                                                                                  eval vtab2 (OVER (rop, var, (CONSTANT (INT (x + 1))), e2, e3))
                                                                                                  ) 
                                                                                                  else if z > value_to_int_conversion(
                                                                                                    eval vtab2 (OVER (rop, var, (CONSTANT (INT (x + 1))), e2, e3))
                                                                                                  ) then z
                                                                                                  else 0)
      

(* YOU SHOULDN'T NEED TO MODIFY ANYTHING IN THE REMAINDER OF THIS FILE,
   BUT YOU ARE WELCOME TO LOOK AT IT. *)

(* LEXER
 **********
 * A lexer, is a program which reads a stream/list of chars,
 * and transforms them into a list of tokens.
 **********
 * This example code is very simple and naive, but it should not
 * introduce anything which you have not seen on the PoP course.
 * Furhter more, we hope that you will read it, and get an intuition
 * about what is going on
 **********
 *)

type TOKEN =
  | NUM of int | ID of string
  | PLUS | MULT | MINUS | EQ
  | LPAR | RPAR | LET  | IN
  | SUM | PROD | MAX | ARGMAX | OF | TO

let explode (s : string) = [for c in s -> c]
let isA t c = List.exists (fun c' -> c = c') t

let digit      = ['0'..'9']
let letter     = ['a'..'z']
let symbol     = explode "+-*/=()"
let whitespace = explode " \t\n"

let keyword    = ["let"; "in"; "sum"; "prod"; "max"; "argmax"; "of"; "to"]

let rec lex = function
  | (c ::  _) as cs when c |> isA digit      -> lexNum  "" cs
  | (c ::  _) as cs when c |> isA letter     -> lexWord "" cs
  | (c :: cs)       when c |> isA symbol     -> lexSymbol c :: lex cs
  | (c :: cs)       when c |> isA whitespace ->                lex cs
  | (c :: cs)       -> failwith ("invalid character : " + string c)
  | (_ : char list) -> ([] : TOKEN list)

and lexNum s = function
  | (c :: cs) when c |> isA digit -> lexNum (s + string c) cs
  |       cs                      -> (NUM (System.Int32.Parse s)) :: lex cs

and lexWord s = function
  | (c :: cs) when c |> isA (letter @ digit) -> lexWord (s + string c) cs
  |       cs                                 ->
    (if s |> isA keyword then getKeyWord s else ID s) :: lex cs

and lexSymbol = function
  | '+' -> PLUS
  | '-' -> MINUS
  | '*' -> MULT
  | '=' -> EQ
  | '(' -> LPAR
  | ')' -> RPAR
  | sym  -> failwith ("Unknown Symbol : " + string sym)

and getKeyWord = function
  | "let" -> LET
  | "in"  -> IN
  | "sum"  -> SUM
  | "prod"  -> PROD
  | "max"  -> MAX
  | "argmax"  -> ARGMAX
  | "to"  -> TO
  | "of"  -> OF
  | word  -> failwith ("Invalid Keyword : " + word)

(* PARSER
 **********
 * A parser transforms the list of tokens to an abstract syntax tree,
 * which reprecents the syntax of an expression.
 **********
 * The example code uses a somewhat ad hoc approach.
 * Later on in the course, we will see more systematic ways of
 * constructing parsers.
 *)


(* Returns tail of ts, assuming head of ts equals t *)
let expect t ts =
  match ts with
    | t' :: ts1 when t' = t -> ts1
    | _ -> failwith "parse error"

(* Each parser function returns the expression parsed from the beginning
   of the token list, together with any remaining tokens. *)

let rec parse_exp ts =
  match ts with
    | LET :: ID v :: EQ :: ts1 ->
       let (e1, ts2) = parse_exp ts1
       let ts3 = expect IN ts2
       let (e2, ts4) = parse_exp ts3
       (LET_IN (v,e1,e2), ts4)
    | r :: ID v :: EQ :: ts1  when r |> isA [SUM; PROD; MAX; ARGMAX] ->
       let (e1, ts2) = parse_exp ts1
       let ts3 = expect TO ts2
       let (e2, ts4) = parse_exp ts3
       let ts5 = expect OF ts4
       let (e3, ts6) = parse_exp ts5
       let rop = match r with
                  | SUM -> RSUM
                  | PROD -> RPROD
                  | MAX -> RMAX
                  | ARGMAX -> RARGMAX
                  | _ -> failwith ("Unknown range operation : " + string r)
       (OVER (rop, v, e1, e2, e3), ts6)
    | _ -> parse_arith ts

and parse_arith ts =
  let (e1, ts1) = parse_term ts
  parse_terms e1 ts1
and parse_terms e1 ts =
  match ts with
    | PLUS :: ts1 -> let (e2, ts2) = parse_term ts1
                     parse_terms (OPERATE (BPLUS, e1,e2)) ts2
    | MINUS :: ts1 -> let (e2, ts2) = parse_term ts1
                      parse_terms (OPERATE (BMINUS, e1,e2)) ts2
    | _ -> (e1, ts)

and parse_term ts =
  let (e1, ts1) = parse_factor ts
  parse_factors e1 ts1
and parse_factors e1 ts =
  match ts with
    | MULT :: ts1 -> let (e2, ts2) = parse_factor ts1
                     parse_factors (OPERATE (BTIMES, e1,e2)) ts2
    | _ -> (e1, ts)

and parse_factor ts =
  match ts with
    | ID v :: ts1 -> (VARIABLE v, ts1)
    | NUM n :: ts1 -> (CONSTANT (INT n), ts1)
    | LPAR :: ts1 ->
        let (e, ts2) = parse_exp ts1
        let ts3 = expect RPAR ts2
        (e, ts3)
    | _ -> failwith ("parse error")

let parse ts =
  let (e, ts1) = parse_exp ts
  if ts1 = [] then e else failwith "parse error"

(*************
 * When interpreting code, we lex it into tokens, parse the tokens into an
 * abstract syntax tree, and evaluate the tree into some value.
 * The definition of what it means to be a value, and an expression (tree),
 * can be found in the parser.
 *************
 * In this code, the evaluation of such a tree has been reprecented, should
 * be implemented in the below function [eval] {~_^}
 *)

(* FOR RUNNING A PROGRAM *)
let run program = (lex >> parse >> eval []) (explode program)

(* Tests *)
let eval_test_constant = (eval []             (CONSTANT (INT 4)) = INT 4)

//let eval_test_lookup   = (eval [("x", INT 4)] (VARIABLE "x")     = INT 4)

let program0 = "1 - 2 - 3"

let program1 = "let x = 4 in x + 3"

let program2 = ("let x0 = 2 in \
                 let x1 = x0 * x0 in \
                 let x2 = x1 * x1 in x2 * x2")

let program3 = "sum x = 1 to 4 of x*x"
let program4 = "max x = 0 to 10 of 5 * x - x * x"
let program5 = "argmax x = 0 to 10 of 5 * x - x * x"

(*
let eval_test_arithmetic = (run program0 = INT  -4)
let eval_test_let        = (run program1 = INT   7)
let eval_test_nested_let = (run program2 = INT 30)
let eval_test_max        = (run program4 = INT 6)
let eval_test_argmax     = (run program4 = INT 2)
*)

(* THIS FUNCTION CALLS RUN ON USER INPUT IN AN INTERACTIVE LOOP *)
let interpreter () =
  let mutable running = true
  printfn  "Welcome to the calculator! Type \"exit\" to stop."
  while running do
    printf  "Input an expression : "
    let program = System.Console.ReadLine()
    try
      if program = "" then ()
      else if program = "exit" then running <- false
      else printfn "Evaluation result   : %A" (run program)
    with
      | Failure (msg) -> printfn "%s" msg

interpreter ()
