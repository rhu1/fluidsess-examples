module CallbackImpl

open GeneratedProto1A
open FStar.Mul
open FStar.All

val random : unit -> ML int
let random () = Random.int (99l) |> FStar.Int32.v

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let empty1 = fun _ -> ()

let myrandom () =
  let x = random() in
  if 0 <= x && x < 100 then x else 0  (* FIXME *)

let callbacks : callbacksA = {
  (*state6Onsendstart : (st: state6) -> ML (n:int{((0) <= (n)) && ((n) < (100))});*)
  state6Onsendstart = (fun _ ->
    let x = myrandom() in
    FStar.IO.print_string "A: Random ";
    print_int x;
    FStar.IO.print_string "\n";
    x
  );

  (*state8Onsendlimit : (st: state8) -> ML (t:int{((t) > (0))});*)
  state8Onsendlimit = (fun _ -> 5);

  (*state9Onreceivehigher : (st: state9) -> ML (unit);*)
  state9Onreceivehigher = empty1;

  (*state9Onreceivelower : (st: state9) -> ML (unit);*)
  state9Onreceivelower = empty1;

  (*state9Onreceivelose : (st: state9) -> ML (unit);*)
  state9Onreceivelose = (fun _ ->
    FStar.IO.print_string "Lost!\n");

  (*state9Onreceivewin : (st: state9) -> ML (unit);*)
  state9Onreceivewin = (fun _ ->
    FStar.IO.print_string "Won!\n");
}

