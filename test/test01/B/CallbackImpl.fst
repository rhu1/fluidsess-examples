module CallbackImpl

open GeneratedProto1B
open FStar.Mul
open FStar.All

(*val random : unit -> ML int
let random () = Random.int (100l) |> FStar.Int32.v*)

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let callbacks : callbacksB = {
  (*state11Onreceive1 : (st: state11) -> ML (unit);*)
  state11Onreceive1 = (fun _ ->
    FStar.IO.print_string "B: Received 1\n");

}
