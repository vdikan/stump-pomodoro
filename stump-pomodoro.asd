;;;; stump-pomodoro.asd

(asdf:defsystem #:stump-pomodoro
  :description "Pretty basic Pomodoro-tracker for StumpWM."
  :author "Vladimir (Hawthorne) <vdikan@vivaldi.net>"
  :license "GPLv3"
  :depends-on (#:stumpwm)
  :serial t
  :components ((:file "package")
               (:file "stump-pomodoro")))
