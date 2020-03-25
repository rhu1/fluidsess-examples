module CallbackImpl

open GeneratedProto1C
open FStar.Mul
open FStar.All
open FStar.Ref

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let next : (ref (x:int{0 <= x && x < 100})) = 50

let callbacks : callbacksC = {
  (*state37Onsendguess : (st: state37) -> ML (x:int{((0) <= (x)) && ((x) < (100))});*)
  state37Onsendguess = (fun st ->
    (*let y = (Mkstate37?.x st) in  (*message from prev it not recorded*)*)
    let y = !next in
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
    next := (Mkstate39?.x st) + 1   (* (exists n . 0 <= n < 100 /\ n > x)   =>   x < 99*)
  );

  (*state39Onreceivelower : (st: state39) -> ML (unit);*)
  state39Onreceivelower = (fun st -> 
    FStar.IO.print_string "Go lower\n";
    next := (Mkstate39?.x st) - 1
  );
}

