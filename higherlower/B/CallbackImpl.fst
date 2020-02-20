module CallbackImpl

open GeneratedMergeableB
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
  (*state18Onreceivenum : (st: state18) -> (x: int) -> ML (unit);*)
  state18Onreceivenum = empty2;

  (*state20Onreceiveguess : (st: state20) -> (y: int) -> ML (unit);*)
  state20Onreceiveguess = empty2;

  (*state21Onsend : (st: state21) -> ML (state21Choice st);*)
  state21Onsend = (fun st ->
    (*let x1 = (Mkstate21?.x1 st) in
    let y = (Mkstate21?.y st) in*)
    if (Mkstate21?.y st) > (Mkstate21?.x1 st) then (Choice21toohigh ())
    else if (Mkstate21?.y st) = (Mkstate21?.x1 st) then (Choice21win ())
    else (Choice21toolow ())
  );

  (*state22Onsendconthigh : (st: state22) -> ML (unit);*)
  state22Onsendconthigh = empty1;

  (*state23Onsendover : (st: state23) -> ML (unit);*)
  state23Onsendover = empty1;

  (*state24Onsendcontlow : (st: state24) -> ML (unit);*)
  state24Onsendcontlow = empty1;
}
