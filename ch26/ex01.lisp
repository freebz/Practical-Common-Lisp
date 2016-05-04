;; 26. Practical: Web Programming with AllegroServer

; A 30-Second Intro to Server-Side Web Programming

; AllegroServer

(defpackage :com.gigamonkeys.web
  (:use :cl :net.aserve :com.gigamonkeys.html))

(in-package :com.gigamonkeys.web)
