module CallbackImpl

open GeneratedProto1B
open FStar.Mul
open FStar.All

(*val random : unit -> ML int
let random () = Random.int (100l) |> FStar.Int32.v*)

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let empty1 = fun _ -> ()
let empty2 = fun _ _ -> ()

let callbacks : callbacksB = {
  (*state24Onreceivestart : (st: state24) -> (n: int{((0) <= (n)) && ((n) < (100))}) -> ML (unit);*)
  state24Onreceivestart = empty2;

  (*state26Onreceivelimit : (st: state26) -> (t: int{((t) > (0))}) -> ML (unit);*)
  state26Onreceivelimit = empty2;

  (*state27Onreceiveguess : (st: state27) -> (x: int) -> ML (unit);*)
  state27Onreceiveguess = empty2;

  (*state28Onsend : (st: state28) -> ML (state28Choice st);*)
  state28Onsend = (fun st ->
    let n1 = (Mkstate28?.n1 st) in
    let x = (Mkstate28?.x st) in
    if x = n1 then Choice28win ()
    else if (Mkstate28?.t1 st) = 1 then Choice28lose ()
    else if n1 > x then Choice28higher ()
    else Choice28lower ()
  );

  (*state29Onsendhigher : (st: state29) -> ML (unit);*)
  state29Onsendhigher = empty1;

  (*state30Onsendlose : (st: state30) -> ML (unit);*)
  state30Onsendlose = empty1;

  (*state31Onsendwin : (st: state31) -> ML (unit);*)
  state31Onsendwin = empty1;

  (*state32Onsendlower : (st: state32) -> ML (unit);*)
  state32Onsendlower = empty1;
}
