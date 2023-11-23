open System.Text
open FSharp.Text.Lexing
open FSharp.Text.Parsing

(* Both lex and parse a program. *)
let parse (s : string) =
    Parser.Prog Lexer.Token
    <| LexBuffer<_>.FromBytes (Encoding.UTF8.GetBytes s)

(* Continually evaluate user expressions. *)
let loop () =
    let mutable running = true
    while running do
        printf "Input an expression: "
        try
            let program = System.Console.ReadLine()
            if program = "exit"
            then
                running <- false
            else
                printfn "Parse result: %A" (parse program)
        with
        | Failure msg -> printfn "%s" msg
        | :? System.ArgumentNullException ->
            running <- false

loop ()
