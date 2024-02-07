(define-constant data-already-set (err 100))
(define-constant data-not-available (err 101))
(define-constant insufficient-input (err 102))

(define-map data principal {id:principal, title:(string-ascii 500), description :(string-ascii 500) })

(define-public (add-data (t (string-ascii 500)) (desc (string-ascii 500))) 
    (begin  
        (asserts! (is-none (map-get? data tx-sender)) data-already-set)
        (map-set data tx-sender {id:tx-sender,title:t,description:desc})
        (ok true)
    )
)

(define-public (delete-data) 
(ok (asserts! (map-delete data tx-sender) data-not-available))
)

(define-public (edit (t (optional (string-ascii 500) ) ) (desc (optional (string-ascii 500)))) 
(begin  

(asserts! (is-some (map-get? data tx-sender)) data-not-available)
(asserts! ( or (is-some t) (is-some desc) ) insufficient-input)
(ok (map-set data tx-sender {id:tx-sender, title:(unwrap-panic (if (is-some t) t (get title  (map-get? data tx-sender)))), description:(unwrap-panic (if (is-some desc)  desc (get description (map-get? data tx-sender))))})
)
)
)

(define-read-only (getData)  
(map-get? data tx-sender)
)

