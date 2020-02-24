module CallbackImpl

open GeneratedMergeableC
open FStar.Mul
open FStar.All
open FStar.Ref

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

(* refinement subtyping as scrib local proto subtyping? refinements and state vars *)

let callbacks : callbacksC = {
  (* state31Onsendguess : (st: state31) -> ML (int); *)
  state31Onsendguess = (fun st ->
    (*state31Onsendguess : (st: state31) -> ML (y:int{((y) = (Mkstate31?.z st))});*)
    let z = (Mkstate31?.z st) in
    FStar.IO.print_string "C: Guessing ";
    print_int z;
    FStar.IO.print_string "\n";
    z
  );

  (* state33Onreceivetoohigh : (st: state33) -> ML (unit); *)
  state33Onreceivetoohigh = (fun st -> 
    FStar.IO.print_string "Too high\n"
  );

  (* state33Onreceivewin : (st: state33) -> ML (unit); *)
  state33Onreceivewin = (fun st -> 
    FStar.IO.print_string "Got it! ";
    print_int (Mkstate33?.y st);
    FStar.IO.print_string "\n"
  );

  (* state33Onreceivetoolow : (st: state33) -> ML (unit); *)
  state33Onreceivetoolow = (fun st -> 
    FStar.IO.print_string "Too low\n"
  );
}

