(asdf:defsystem #:weblocks-examples-tests
   :description "Tests for weblocks-examples"
   :author "Olexiy Zamkoviy <olexiy.z@gmail.com>"
   :license "LLGPL"
   :version "0.1.0"
   :depends-on (#:weblocks #:simple-blog #:weblocks-clsql-demo #:weblocks-demo #:weblocks-elephant-demo #:weblocks-selenium-tests)
   :components 
   ((:module tests 
     :components
     ((:file "package")
      (:file "tests" :depends-on ("package"))
      (:file "tests-app-updates" :depends-on ("package"))))))

