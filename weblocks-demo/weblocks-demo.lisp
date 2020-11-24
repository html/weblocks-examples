
(in-package :weblocks-demo)

(export '(start-weblocks-demo stop-weblocks-demo))

(defun start-weblocks-demo (&rest args)
  "Starts the application by calling 'start-weblocks' with appropriate
  arguments."
  (let ((app-args (when (getf args :prefix) 
                     (prog1 
                       (list :prefix (getf args :prefix)) 
                       (remf args :prefix)))))
    (apply #'start-weblocks args)
    (apply #'start-webapp (list* 'weblocks-demo app-args))))

(defun stop-weblocks-demo ()
  "Stops the application by calling 'stop-weblocks'."
  (stop-webapp 'weblocks-demo)
  (stop-weblocks))

;;; A sandbox store macro
(defmacro sandbox-store ()
  "Access to a sandbox store in the session."
  `(hunchentoot:session-value 'sandbox-store))

;; Define our application
(defwebapp weblocks-demo :prefix "/"
           :js-backend :prototype
           :autostart nil 
           :public-files-cache-time 100000
           :description "A web application based on Weblocks"
           :dependencies '((:stylesheet "suggest")))

