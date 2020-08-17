(defun unique-letters (name)
    (concatenate 'string
                 "hello"
                  (coerce (remove-duplicates name) 'string)))

(defun ask-and-respond ()
    (princ "What is your name?")
    (princ (unique-letters (read-line))))

(ask-and-respond)