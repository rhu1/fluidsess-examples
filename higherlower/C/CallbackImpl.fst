module CallbackImpl

open GeneratedMergeableC
open FStar.Mul
open FStar.All
open FStar.Ref

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let upper = alloc 100
let lower = alloc 0

let callbacks : callbacksC = {
  (* state31Onsendguess : (st: state31) -> ML (int); *)
  state31Onsendguess = (fun _ ->
    let y = (!upper + !lower) / 2 in
    FStar.IO.print_string "C: Guessing ";
    print_int y;
    FStar.IO.print_string "\n";
    y
  );

  (* state33Onreceivetoohigh : (st: state33) -> ML (unit); *)
  state33Onreceivetoohigh = (fun st -> 
    FStar.IO.print_string "Too high\n";
    upper := (Mkstate33?.y st)
  );

  (* state33Onreceivewin : (st: state33) -> ML (unit); *)
  state33Onreceivewin = (fun st -> 
    FStar.IO.print_string "Got it! ";
    print_int (Mkstate33?.y st);
    FStar.IO.print_string "\n"
  );

  (* state33Onreceivetoolow : (st: state33) -> ML (unit); *)
  state33Onreceivetoolow = (fun st -> 
    FStar.IO.print_string "Too low\n";
    lower := (Mkstate33?.y st)
  );
}

