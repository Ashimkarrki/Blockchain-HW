(impl-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))

;; No maximum supply!
(define-fungible-token clarity-coin)
    ;; (transfer (uint principal principal (optional (buff 34))) (response bool uint))
(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
    (begin
        (asserts! (is-eq tx-sender sender) err-not-token-owner)
        (try! (ft-transfer? clarity-coin amount sender recipient))
        (match memo to-print (print to-print) 0x)
        (ok true)
    )
)

(define-read-only (get-name) (ok "clarity coin" ))
(define-read-only (get-decimals) (ok u6))
(define-read-only (get-symbol) (ok "CC"))
(define-read-only (get-balance (acc principal))  (ok (ft-get-balance clarity-coin acc)) )
(define-read-only (get-total-supply) (ok (ft-get-supply clarity-coin)))
(define-read-only (get-token-uri) (ok none))
(define-public (mint (amt uint) (reciver principal) ) 
(begin  
(asserts! (is-eq tx-sender contract-owner) err-owner-only)
(ft-mint? clarity-coin amt reciver)
)
)
