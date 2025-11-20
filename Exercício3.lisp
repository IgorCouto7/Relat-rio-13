
;; 1. Estrutura item e catálogo
(define-struct item (nome tipo preco forca-magica))

(define itens
  (list
    (make-item "Espada Sangrenta" "Arma" 100 120)
    (make-item "Poção Sombria" "Pocao" 40 30)
    (make-item "Amuleto do Caos" "Artefato" 250 200)
    (make-item "Machado Rúnico" "Arma" 180 70)))

;; 2. Funções puras
(define (adiciona-imposto preco)
  (* preco 1.15))

(define (bonus-maldicao forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

;; 3. Função processa-venda
(define (processa-venda catalogo)
  (let* (
        ;; (a) filtra armas
        (armas (filter (lambda (i)
                         (equal? (item-tipo i) "Arma"))
                       catalogo))

        ;; (b) aumenta o preço de cada arma
        (armas-com-imposto
         (map (lambda (i)
                (make-item
                 (item-nome i)
                 (item-tipo i)
                 (adiciona-imposto (item-preco i))
                 (item-forca-magica i)))
              armas))

        ;; (c) retorna nome + nova força mágica
        (resultado
         (map (lambda (i)
                (list (item-nome i)
                      (bonus-maldicao (item-forca-magica i))))
              armas-com-imposto)))

    resultado))

;; Teste
(processa-venda itens)
