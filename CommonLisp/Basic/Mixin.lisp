;;; An example for the memchanism using the CommonLispObjectSystem
;;; http://wiki.c2.com/?MixIn

(defclass window ()
  ((width
    :accessor window-width
    :initarg :width
    :type integer
    :initform 200)))

(defclass border-mixin ()
  ((border-width
    :type integer
    :initarg :border-width
    :initform 1)))

(defmethod window-width :around ((window border-mixin))
  (+ (call-next-method)
     (* 2 (slot-value window 'border-width))))

(defclass my-window-with-border (border-mixin window)
  ())

(defvar *my-window* (make-instance 'my-window-with-border
				   :width 400
				   :border-width 10))

(window-width *my-window*) ;; 420
