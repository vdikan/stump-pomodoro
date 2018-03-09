;;;; stump-pomodoro.asd

(asdf:defsystem #:stump-pomodoro
  :description "Pretty basic Pomodoro-tracker for StumpWM."
  :author "Vladimir (Hawthorne) <vladimir.dikan@icn2.cat>"
  :license "GPLv3"
  :depends-on (#:stumpwm)
  :serial t
  :components ((:file "package")
               (:file "stump-pomodoro")))

