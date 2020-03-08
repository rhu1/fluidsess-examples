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
  (*state37Onsendguess : (st: state37) -> ML (int);*)
  state37Onsendguess = (fun _ ->
    let y = (!upper + !lower) / 2 in
    FStar.IO.print_string "C: Guessing ";
    print_int y;
    FStar.IO.print_string "\n";
    y
  );

  (*state39Onreceivewin : (st: state39) -> ML (unit);*)
  state39Onreceivewin = (fun st -> 
    FStar.IO.print_string "Got it! ";
    print_int (Mkstate39?.x st);
    FStar.IO.print_string "\n"
  );

  (*state39Onreceivelose : (st: state39) -> ML (unit);*)
  state39Onreceivelose = (fun st -> 
    FStar.IO.print_string "Lost!\n"
  );


  (*state39Onreceivehigher : (st: state39) -> ML (unit);*)
  state39Onreceivehigher = (fun st -> 
    FStar.IO.print_string "Go higher\n";
    lower :=(Mkstate39?.x st)
  );

  (*state39Onreceivelower : (st: state39) -> ML (unit);*)
  state39Onreceivelower = (fun st -> 
    FStar.IO.print_string "Go lower\n";
    let x = (Mkstate39?.x st) in
    upper := x
  );
}

