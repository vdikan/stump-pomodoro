;;;; package.lisp

(defpackage #:stump-pomodoro
  (:use #:cl :stumpwm)
  (:export *pomodoros-series*
           pomodoro-dash
           pomodoro-status
           pomodoro-reset-series
           pomodoro-start-timer
           pomodoro-cancel-timer))

