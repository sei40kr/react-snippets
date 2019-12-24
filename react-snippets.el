;;; react-snippets.el --- React snippets for yasnippet    -*- lexical-binding: t -*-

;; Copyright (c) 2019 Seong Yong-ju

;; URL: https://github.com/sei40kr/react-snippets
;; Package-Requires: ((emacs "26") (yasnippet "0.13.0") (s "1.12.0"))
;; Version: 0.1.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; React snippets for yasnippet.

;;; Code:

(require 'yasnippet)
(require 's)

(defconst react-snippets-dir
  (expand-file-name
   "snippets"
   (file-name-directory
    (cond
     (load-in-progress load-file-name)
     ((and (boundp 'byte-compile-current-file) byte-compile-current-file)
      byte-compile-current-file)
     (:else (buffer-file-name))))))

(defun react-snippets--initialize ()
  "Load the `react-snippets' snippets directory."
  (add-to-list 'yas-snippet-dirs 'react-snippets-dir t)
  (yas-load-directory react-snippets-dir t))

(defgroup react-snippets nil
  "Options for yasnippet setups.

This is useful for customizing options declared in
“.yas-setup.el” files.  For example, you could declare a
customizable variable used for a snippet expansion.

See Info node `(elisp)Customization Types'."
  :group 'yasnippet)

(defun react-snippets--file-class-name ()
  "Return the base name of current buffer without the extension."
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))

(defun react-snippets--component-css-root ()
  "Return the class name of the component root of current buffer."
  (s-replace "_" "-" (s-snake-case (react-snippets--file-class-name))))

;;;###autoload
(eval-after-load 'yasnippet
  '(react-snippets--initialize))

(provide 'react-snippets)

;;; react-snippets.el ends here
