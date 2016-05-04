;; 11. Collections

; Vectors

(vector)
(vector 1)
(vector 1 2)

(make-array 5 :initial-element nil)
(make-array 5 :fill-pointer 0)

(defparameter *x* (make-array 5 :fill-pointer 0))

(vector-push 'a *x*)
(vector-push 'b *x*)
(vector-push 'c *x*)
*x*
(vector-pop *x*)
(vector-pop *x*)
(vector-pop *x*)
*x*


; Subtypes of Vector

(make-array 5 :fill-pointer 0 :adjustable t :element-type 'character)


; Vectors As Sequences

(defparameter *x* (vector 1 2 3))

(length *x*)
(elt *x* 0)
(elt *x* 1)
(elt *x* 2)

(setf (elt *x* 0) 10)


; Sequence Iterating Functions

(count 1 #(1 2 1 2 3 1 2 3 4))

; Higher-Order Function Variants

(count-if #'evenp #(1 2 3 4 5))


; Sequence Mapping Functions

(map 'vector #'* #(1 2 3 4 5) #(10 9 8 7 6))


;; Tash Tables

(defparameter *h* (make-hash-table))

(gethash 'foo *h*)
(setf (gethash 'foo *h*) 'quux)
(gethash 'foo *h*)

(defun show-value (key hash-table)
  (multiple-value-bind (value present) (gethash key hash-table)
    (if present
	(format nil "Value ~a actually present." value)
	(format nil "Value ~a because key not found." value))))

(setf (gethash 'bar *h*) nil)

(maphash #'(lambda (k v) (format t "~a => ~a~%" k v)) *h*)
