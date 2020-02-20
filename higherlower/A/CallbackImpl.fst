module CallbackImpl

open GeneratedMergeableA
open FStar.Mul
open FStar.All

val random : unit -> ML int
let random () = Random.int (100l) |> FStar.Int32.v

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let empty = fun _ -> ()

let callbacks : callbacksA = {
  (* state5Onsendnum : (st: state5) -> ML (int); *)
  state5Onsendnum = (fun _ ->
    let x = random() in
    FStar.IO.print_string "A: Random ";
    print_int x;
    FStar.IO.print_string "\n";
    x
  );

  (* state7Onreceiveconthigh : (st: state7) -> ML (unit); *)
  state7Onreceiveconthigh = empty;

  (* state7Onreceivecontlow : (st: state7) -> ML (unit); *)

  state7Onreceivecontlow = empty;

  (* state7Onreceiveover : (st: state7) -> ML (unit); *)
  state7Onreceiveover = empty;
}

