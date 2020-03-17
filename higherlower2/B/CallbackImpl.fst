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
  (*state22Onreceivestart : (st: state22) -> (n: int{((0) <= (n)) && ((n) < (100))}) -> ML (unit);*)
  state22Onreceivestart = empty2;

  (*state24Onreceivelimit : (st: state24) -> (t: int{((t) > (0))}) -> ML (unit);*)
  state24Onreceivelimit = empty2;

  (*state25Onreceiveguess : (st: state25) -> (x: int{((0) <= (x)) && ((x) < (100))}) -> ML (unit);*)
  state25Onreceiveguess = empty2;

  (*state26Onsend : (st: state26) -> ML (state26Choice st);*)
  state26Onsend = (fun st ->
    let n1 = (Mkstate26?.n1 st) in
    let x = (Mkstate26?.x st) in
    if x = n1 then Choice26win ()
    else if (Mkstate26?.t1 st) = 1 then Choice26lose ()  (*comment for demo*)
    else if n1 > x then Choice26higher ()
    (*else if n1 > x then Choice26lower ()*) (*demo*)
    else Choice26lower ()
  );

  (*state27Onsendhigher : (st: state27) -> ML (unit);*)
  state27Onsendhigher = empty1;

  (*state28Onsendlose : (st: state28) -> ML (unit);*)
  state28Onsendlose = empty1;

  (*state29Onsendwin : (st: state29) -> ML (unit);*)
  state29Onsendwin = empty1;

  (*state30Onsendlower : (st: state30) -> ML (unit);*)
  state30Onsendlower = empty1;
}
