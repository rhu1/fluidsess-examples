module CallbackImpl

open GeneratedProto1A
open FStar.Mul
open FStar.All

val random : unit -> ML int
let random () = Random.int (100l) |> FStar.Int32.v

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let empty1 = fun _ -> ()

let callbacks : callbacksA = {
  (*state39Onsendnum : (st: state39) -> ML (int);*)
  state39Onsendnum = (fun _ ->
    let x = random() in
    FStar.IO.print_string "A: Random ";
    print_int x;
    FStar.IO.print_string "\n";
    x
  );

  (*state41Onsendlimit : (st: state41) -> ML (int);*)
  state41Onsendlimit = (fun _ -> 5);

  (*state42Onreceiveconthigh : (st: state42) -> ML (unit);*)
  state42Onreceiveconthigh = empty1;

  (*state42Onreceivecontlow : (st: state42) -> ML (unit);*)
  state42Onreceivecontlow = empty1;

  (*state42Onreceivelose : (st: state42) -> ML (unit);*)
  state42Onreceivelose = (fun _ ->
    FStar.IO.print_string "Lost!\n");

  (*state42Onreceivewin : (st: state42) -> ML (unit);*)
  state42Onreceivewin = (fun _ ->
    FStar.IO.print_string "Won!\n");
}

