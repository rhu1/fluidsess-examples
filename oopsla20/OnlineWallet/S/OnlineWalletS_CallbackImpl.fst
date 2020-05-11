module OnlineWalletS_CallbackImpl

open GeneratedOnlineWalletS
open FStar.Mul
open FStar.All

(*val random : unit -> ML int
let random () = Random.int (100l) |> FStar.Int32.v*)  (* 0..100 inclusive *)

let print_int (i:int) =
  let i = string_of_int i in
  FStar.IO.print_string i

let balance : ref int = alloc 100

let callbacks : callbacksC = {

  (*state47OnreceiveLogin_ok : (st: state47) -> (_dummy: unit) -> ML (unit);*)
  state47OnreceiveLogin_ok = (fun _ _ -> ());

  (*state47OnreceiveLogin_fail : (st: state47) -> (_dummy: unit) -> ML (unit);*)
  state47OnreceiveLogin_fail = (fun _ _ -> ());

  (*state49OnsendAccount : (st: state49) -> ML (balance:int{((balance) >= (0))});*)
  state49OnsendAccount = (fun _ -> 100);  // FIXME

  (*state50OnsendOv : (st: state50) -> ML (overdraft:int{((overdraft) >= (0))});*)
  state49OnsendAccount = (fun _ -> 50);

  (*state51OnreceivePay : (st: state51) -> (amount: int{((amount) <= reveal ((Mkstate51?.allowance st)))}) -> ML (unit);*)
  state47OnreceiveLogin_fail = (fun _ amount -> balance := !balance - amount);

  (*state51OnreceiveQuit : (st: state51) -> (_dummy: unit) -> ML (unit);*)
  state51OnreceiveQuit = (fun _ _ -> ());

  (*state52OnreceivePayee : (st: state52) -> (payee: string) -> ML (unit);*)  (*FIXME: string in gen api*)
  state52OnreceivePayee = (fun _ _ -> ());

  (*state53OnsendAccount : (st: state53) -> ML (newbalance:int{((newbalance) >= (0))});*)
  state53OnsendAccount = (fun _ -> 90);  // FIXME

  (*state54OnsendAccount : (st: state54) -> ML (newoverdraft:int{((newoverdraft) >= (0))});*)
  state54OnsendAccount = (fun _ -> 50)
}

