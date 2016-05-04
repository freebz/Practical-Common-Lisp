;; 13. Beyond Lists: Other Uses for Cons Cells

; Trees

(copy-list '((1 2) (3 4) (5 6)))
(copy-tree '((1 2) (3 4) (5 6)))


; Sets

(defparameter *set* ())
(adjoin 1 *set*)
(setf *set* (adjoin 1 *set*))
(setf *set* (adjoin 1 *set*))
(pushnew 2 *set*)
(pushnew 2 *set*)


; Lookup Tables: Alists and Plists

(assoc 'a '((a . 1) (b . 2) (c . 3)))
(assoc "a" '(("a" . 1) ("b" . 2) ("c" . 3)))
(assoc "a" '(("a" . 1) ("b" . 2) ("c" . 3)) :test #'string=)

; (cons (cons 'new-key 'new-value) alist)
; (acons 'new-key 'new-value alist)

; (setf alist (acons 'new-key 'new-value alist))
; (push (cons 'new-key 'new-value) alist)

(pairlis '(a b c) '(1 2 3))


(defparameter *plist* ())
(setf (getf *plist* :a) 1)
(setf (getf *plist* :a) 2)
(remf *plist* :a)

(destructuring-bind (x y z) (list 1 2 3)
  (list :x x :y y :z z))
