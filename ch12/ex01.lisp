;; 12. They Called It LISP for a Reason: List Processing

; "There Is No List"

(cons 1 2)
(car (cons 1 2))
(cdr (cons 1 2))

(defparameter *cons* (cons 1 2))
(setf (car *cons*) 10)
(setf (cdr *cons*) 20)

(cons 1 nil)
(cons 1 (cons 2 nil))
(cons 1 (cons 2 (cons 3 nil)))

(list 1)
(list 1 2)
(list 1 2 3)

(defparameter *list* (list 1 2 3 4))
(first *list*)
(rest *list*)
(first (rest *list*))

(list "foo" (list 1 2) 10)


; Functional Programming and Lists

(append (list 1 2) (list 3 4))


; "Destructive" Operations

(defparameter *list-1* (list 1 2))
(defparameter *list-2* (list 3 4))
(defparameter *list-3* (append *list-1* *list-2*))

(setf (first *list-2*) 0)

(setf *list* (reverse *list*))

(defparameter *x* (list 1 2 3))
(nconc *x* (list 4 5 6))



;; Combining Recycling with Shared Structure

(defun upto (max)
  (let ((result nil))
    (dotimes (i max)
      (push i result))
    (nreverse result)))

(upto 10)

(setf *list-3* (delete 4 *list-3*))

(defparameter *list* (list 4 3 2 1))
;(sort *list* #'<)


; List-Manipulation Functions


; Mapping

(mapcar #'(lambda (x) (* 2 x)) (list 1 2 3))
(mapcar #'+ (list 1 2 3) (list 10 20 30))

;(mapcan #'(lambda (x) (if (= x 10) nil (list x))) list)
