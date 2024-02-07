(define-constant owner tx-sender)
(define-constant only-owner (err u100))
(define-constant already-voted (err u101))
(define-constant voter-not-present (err u102))
(define-map voters principal bool)
(define-map candidate (string-ascii 20) uint)
(map-set candidate "kp" u0)
(map-set candidate "sher" u0)

(define-public (vote (name (string-ascii 15))) (begin 
    (asserts! (is-none (map-get? voters tx-sender)) already-voted)
    (asserts! (is-some (map-get? candidate name)) voter-not-present)
    (map-set candidate name (+ (unwrap-panic (map-get? candidate name)) u1))
    (ok (map-set voters tx-sender true))
))
(define-read-only (result) 
   (concat (concat "kp " (int-to-ascii (unwrap-panic (map-get? candidate "kp")))) (concat " sher " (int-to-ascii (unwrap-panic (map-get? candidate "sher")))) )
 
)
