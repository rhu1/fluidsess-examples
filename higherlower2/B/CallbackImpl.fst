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
  (*state55Onreceivenum : (st: state55) -> (x: int) -> ML (unit);*)
  state55Onreceivenum = empty2;

  (*state57Onreceivelimit : (st: state57) -> (z: int) -> ML (unit);*)
  state57Onreceivelimit = empty2;

  (*state58Onreceiveguess : (st: state58) -> (y: int) -> ML (unit);*)
  state58Onreceiveguess = empty2;

  (*state59Onsend : (st: state59) -> ML (state59Choice st);*)
  state59Onsend = (fun st ->
    let x1 = (Mkstate59?.x1 st) in
    let y = (Mkstate59?.y st) in
    if y > x1 then (Choice59toohigh ())
    else if y = x1 then
      let z1 = (Mkstate59?.z1 st) in
      (if z1 > 0 then Choice59win () else Choice59lose ())
    else (Choice59toolow ())
  );

  (*state60Onsendconthigh : (st: state60) -> ML (unit);*)
  state60Onsendconthigh = empty1;

  (*state61Onsendlose : (st: state61) -> ML (unit);*)
  state61Onsendlose = empty1;

  (*state62Onsendwin : (st: state62) -> ML (unit);*)
  state62Onsendwin = empty1;

  (*state63Onsendcontlow : (st: state63) -> ML (unit);*)
  state63Onsendcontlow = empty1;
}
