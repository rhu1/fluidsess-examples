module CallbackImpl

open GeneratedProto1A
open FStar.Mul
open FStar.All

(*val random : unit -> ML int
let random () = Random.int (100l) |> FStar.Int32.v*)

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let callbacks : callbacksA = {
  (*state4Onsend1 : (st: state4) -> ML (unit);*)
  state4Onsend1 = (fun _ ->
    FStar.IO.print_string "A: Sending 1\n");
}
