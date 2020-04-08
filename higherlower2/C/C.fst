(*
$ make
$ make main.ocaml.exe
*)


module C

open GeneratedProto1C
open Payload
open Network

open FStar.Tcp
open FStar.Error

let ip_addr_B = "127.0.0.1"
let port_B = 5000

(*
type label =
| Guess
| Higher
| Lose
| Lower
| Win
*)

let encode_label = function
  | Guess -> 0
  | Higher -> 1
  | Lose -> 2
  | Lower -> 3
  | Win -> 4

let decode_label = function
  | 0 -> Guess
  | 1 -> Higher
  | 2 -> Lose
  | 3 -> Lower
  | 4 -> Win
  | _ -> unexpected "Unexpected Label"

let mk_comms stream : connection = {
  send_int = (fun _role p ->
    let p = payload_of_int p in
    send_payload stream p);
  send_string = (fun _role p ->
    let p = payload_of_str p in
    send_payload stream p);
  send_unit = (fun _role p ->
    let p = payload_of_unit p in
    send_payload stream p);
  send_label = (fun _role l ->
    let l = encode_label l in
    send_payload stream (Int l));
  recv_int = (fun _role _ ->
    let p = recv_payload stream in
    int_of_payload p);
  recv_string = (fun _role _ ->
    let p = recv_payload stream in
    str_of_payload p);
  recv_unit = (fun _role _ ->
    let p = recv_payload stream in
    unit_of_payload p);
  recv_label = (fun _role _ ->
    let p = recv_payload stream in
    decode_label (int_of_payload p));
}

let main () =
    let server_B = connect ip_addr_B port_B in
    let comms = mk_comms server_B in
    let () = run CallbackImpl.callbacks comms in
    close server_B

let main_alt () =
    let server_B = connect ip_addr_B port_B in
    let comms = mk_comms server_B in
    let () = run CallbackImplAlt.callbacks comms in
    close server_B
