;; 1. Estrutura ocorrencia
(define-struct ocorrencia (nome ritual nivel-medo agentes-enviados))

;; 2. Função recursiva soma-medo
(define (soma-medo-recursiva lista)
  (if (null? lista)
      0
      (+ (ocorrencia-nivel-medo (car lista))
         (soma-medo-recursiva (cdr lista)))))

;; 3. Função analise-final
(define (analise-final lista-oc)
  (let* ((total (soma-medo-recursiva lista-oc))
         (media (/ total (length lista-oc))))

    (map (lambda (o)
           (ocorrencia-nome o))
         (filter (lambda (o)
                   (and (> (ocorrencia-agentes-enviados o) 3)
                        (> (ocorrencia-nivel-medo o) media)))
                 lista-oc))))

;; Exemplo para testar
(define ocorrs
  (list
    (make-ocorrencia "Cripta Sombria" "Invocação" 60 5)
    (make-ocorrencia "Eco Espectral" "Sussurros" 30 2)
    (make-ocorrencia "Chamado do Abismo" "Portal" 90 4)
    (make-ocorrencia "Ritual Perdido" "Necromancia" 40 6)))

(analise-final ocorrs)
