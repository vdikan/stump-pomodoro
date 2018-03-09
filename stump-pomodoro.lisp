;;;; stump-pomodoro.lisp

(in-package #:stump-pomodoro)

(defvar *pomodoros-series* 0
  "Counter of finished pomodoros in a series.")

(defun finish-timer ()
  (record-finished)
  (sb-ext:unschedule-timer *pomodoro-timer*)
  (message "+1 (`) Pomodoro Scored!~%~a" (print-status)))

(defparameter *pomodoro-timer*
  (sb-ext:make-timer #'finish-timer :name :pomodoro-timer))

(defun record-finished ()
  "Add one pomodoro to the finished series."
  (setf *pomodoros-series*
        (1+ *pomodoros-series*)))

(defun reset-series ()
  "Reset finished pomodoros series counter to 0."
  (setf *pomodoros-series* 0))

(defun print-series ()
  "Printout current pomodoro series."
  ;; NOTE I do this stupid concatenation because I don't know or really
  ;; wish to know all that cl:FORMAT magic. And I'm too drunk and lazy to
  ;; use loops.
  (concatenate 'string
               (format nil "~v@{~A~:*~}" *pomodoros-series* "(`) ")
               (format nil ": ~S " *pomodoros-series*)))

(defun notify-break ()
  "Say what kind of break you deserve."
  (if (= *pomodoros-series* 0)
      "0_o Work harder!"
      (if (= 0 (mod *pomodoros-series* 4))
          "[_]) Good! Take a large break!"
          "(5)  Go get 5 minutes break.")))

(defun print-status ()
  "Print the status of the timer."
  (if (sb-ext:timer-scheduled-p *pomodoro-timer*)
      "(`) pomodoro in progress..."
      (notify-break)))

(defcommand pomodoro-dash () ()
  "Print StimpWM dashboard message about pomodoros series progress."
  (let ((*message-window-gravity* :top-right))
    (message (concatenate 'string
                          (print-series)
                          (format nil "~%")
                          (print-status)))))

(defcommand pomodoro-reset-series () ()
  "Reset global pomodoros series."
  (reset-series)
  (message "Pomodoros series reset."))

(defcommand pomodoro-status () ()
  (message (print-status)))

(defparameter *pomodoro-duration* 1500
  "Standard duration of one pomodoro = 25 * 60 seconds.")

(defcommand pomodoro-start-timer () ()
  (sb-ext:schedule-timer *pomodoro-timer* *pomodoro-duration*)
  (message "Pomodoro timer set."))

(defcommand pomodoro-cancel-timer () ()
  (sb-ext:unschedule-timer *pomodoro-timer*)
  (message "(7) Pomodoro timer cancelled!"))
