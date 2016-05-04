;; 14. Files and File I/O

; Reading File Data

(let ((in (open "c:/work/Practical Common Lisp/ch14/name.txt")))
  (format t "~a~%" (read-line in))
  (close in))



(let ((in (open "c:/work/Practical Common Lisp/ch14/name.txt"
		:if-does-not-exist nil)))
  (when in
    (format t "~a~%" (read-line in))
    (close in)))



(let ((in (open "c:/work/Practical Common Lisp/ch14/name.txt"
		:if-does-not-exist nil)))
  (when in
    (loop for line = (read-line in nil)
	 while line do (format t "~a~%" line))
    (close in)))


(defparameter *s* (open "c:/work/Practical Common Lisp/ch14/name.txt"))
(read *s*)
(read *s*)
(read *s*)
(read *s*)
(close *s*)


(with-open-file (stream "c:/work/Practical Common Lisp/ch14/name.txt")
  (format t "~a~%" (read-line stream)))


;; (with-open-file (stream "c:/work/Practical Common Lisp/ch14/name2.txt"
;; 			:direction :output)
;;   (format stream "Some text."))



; How Pathnames Represent Filenames

(pathname-directory (pathname "/foo/bar/baz.txt"))
(pathname-name (pathname "/foo/bar/baz.txt"))
(pathname-type (pathname "/foo/bar/baz.txt"))
(pathname "/foo/bar/baz.txt")

(namestring #p"/foo/bar/baz.txt")
(directory-namestring #p"/foo/bar/baz.txt")
(file-namestring #p"/foo/bar/baz.txt")


; Constructing New Pathnames


(make-pathname
 :directory '(:absolute "foo" "bar")
 :name "baz"
 :type "txt")

(make-pathname :device "c" :directory '(:absolute "foo" "bar") :name "baz")

(merge-pathnames #p"foo/bar.html" #p"/www/html/")
(merge-pathnames #p"foo/bar.html" #p"html/")

(enough-namestring #p"/www/html/foo/bar.html" #p"/www/")

(merge-pathnames
 (enough-namestring #p"/www/html/foo/bar/baz.html" #p"/www/")
 #p"/www-backups/")

(make-pathname :name "foo" :type "txt")



; Other Kinds of I/O

(let ((s (make-string-input-stream "1.23")))
  (unwind-protect (read s)
    (close s)))

(with-input-from-string (s "1.23")
  (read s))

(with-output-to-string (out)
  (format out "hello, world ")
  (format out "~s" (list 1 2 3)))

