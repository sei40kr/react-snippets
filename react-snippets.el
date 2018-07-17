;;; react-snippets.el --- React snippets for yasnippet

(require 'yasnippet)

(defconst react-snippets-dir
  (expand-file-name
   "snippets"
   (file-name-directory
    (cond
     (load-in-progress load-file-name)
     ((and (boundp 'byte-compile-current-file) byte-compile-current-file)
      byte-compile-current-file)
     (:else (buffer-file-name))))))

(defun react-snippets-initialize ()
  (add-to-list 'yas-snippet-dirs 'react-snippets-dir t)
  (yas-load-directory react-snippets-dir t))

(eval-after-load 'yasnippet
  '(react-snippets-initialize))

(provide 'react-snippets)

;;; react-snippets ends here
