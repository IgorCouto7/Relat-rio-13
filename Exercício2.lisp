;; 1. Estrutura criatura
(define-struct criatura (nome ambiente periculosidade vida-media))

;; 2. Catálogo inicial
(define catalogo
  (list
    (make-criatura "Bladderfish" "Safe Shallows" "Baixa" 5)
    (make-criatura "Reaper Leviathan" "Open Ocean" "Alta" 80)
    (make-criatura "Ghost Leviathan Juvenile" "Deep" "Alta" 90)
    (make-criatura "Crabsquid" "Deep" "Média" 40)))

;; 3. Função filtra-por-perigo
(define (filtra-por-perigo catalogo)
  (filter (lambda (c)
            (not (equal? (criatura-periculosidade c) "Baixa")))
          catalogo))

;; 4. Função relatorio-profundidade
(define (relatorio-profundidade catalogo)
  (map (lambda (c)
         (string-append "[" (criatura-nome c) "]: Vive em "
                        (criatura-ambiente c)))
       (filter (lambda (c)
                 (equal? (criatura-ambiente c) "Deep"))
               catalogo)))

;; Exemplos de teste
(filtra-por-perigo catalogo)
(relatorio-profundidade catalogo)
