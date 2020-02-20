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
  (*state4Onsend : (st: state4) -> ML (state4Choice st);*)
  state4Onsend = (fun _ ->
    FStar.IO.print_string "A: Sending 2\n";
    (Choice42 2)
  );
}
