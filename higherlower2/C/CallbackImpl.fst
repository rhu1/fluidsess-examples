module CallbackImpl

open GeneratedProto1C
open FStar.Mul
open FStar.All
open FStar.Ref

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let upper = alloc 100
let lower = alloc 0

let callbacks : callbacksC = {
  (*state70Onsendguess : (st: state70) -> ML (int);*)
  state70Onsendguess = (fun _ ->
    let y = (!upper + !lower) / 2 in
    FStar.IO.print_string "C: Guessing ";
    print_int y;
    FStar.IO.print_string "\n";
    y
  );

  (*state72Onreceivetoohigh : (st: state72) -> ML (unit);*)
  state72Onreceivetoohigh = (fun st -> 
    FStar.IO.print_string "Too high\n";
    let y = (Mkstate72?.y st) in  (* how to make 0 <= st.y <= 100 ? *)
    upper := y
  );

  (*state72Onreceivewin : (st: state72) -> ML (unit);*)
  state72Onreceivewin = (fun st -> 
    FStar.IO.print_string "Got it! ";
    print_int (Mkstate72?.y st);
    FStar.IO.print_string "\n"
  );

  (*state72Onreceivelose : (st: state72) -> ML (unit);*)
  state72Onreceivelose = (fun st -> 
    FStar.IO.print_string "Lost!\n"
  );

  (*state72Onreceivetoolow : (st: state72) -> ML (unit);*)
  state72Onreceivetoolow = (fun st -> 
    FStar.IO.print_string "Too low\n";
    let y = (Mkstate72?.y st) in
    lower := y
  );
}

