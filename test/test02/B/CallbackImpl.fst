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
  (*state11Onreceive1 : (st: state11) -> (x: int) -> ML (unit);*)
  state11Onreceive1 = (fun _ x ->
    FStar.IO.print_string "B: Received 1 = ";
    print_int x);

  (*state11Onreceive2 : (st: state11) -> (y: int) -> ML (unit);*)
  state11Onreceive2 = (fun _ y ->
    FStar.IO.print_string "B: Received 2 = ";
    print_int y);
}
