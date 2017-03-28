;;; become.el --- Tools for switching buffer encoding type.
;; Copyright 2017 by Dave Pearson <davep@davep.org>

;; Author: Dave Pearson <davep@davep.org>
;; Version: 1.0
;; Keywords: convenience
;; URL: https://github.com/davep/become.el

;;; Commentary:
;;
;; become.el provides a set of interactive functions that allow easy
;; switching between the text file encoding systems used on the operating
;; systems I use most.

;;; Code:

;;;###autoload
(defun become-dos-buffer ()
  "Turn the current buffer into a DOS buffer."
  (interactive)
  (set-buffer-file-coding-system 'dos))

;;;###autoload
(defun become-unix-buffer ()
  "Turn the current buffer into a Unix buffer."
  (interactive)
  (set-buffer-file-coding-system 'unix))

;;;###autoload
(defun become-mac-buffer ()
  "Turn the current buffer into a Mac buffer."
  (interactive)
  (set-buffer-file-coding-system 'mac))

;;;###autoload
(defun become-undosly ()
  "Strip current buffer of DOS end-of-line markers."
  (interactive)
  (save-excursion
    (setf (point) (point-min))
    (replace-string "\015" "")
    (replace-string "\032" "")
    (when (interactive-p)
      (message "Buffer is now sane"))))

;;;###autoload
(defun become-freshly-indented ()
  "Apply indentation to whole buffer."
  (interactive)
  (indent-region (point-min) (point-max) nil))

;;;###autoload
(defun become-freshly-indented-no-tabs ()
  "Apply indentation to whole buffer and then untabify."
  (interactive)
  (indent-buffer)
  (untabify (point-min) (point-max)))

(provide 'become)

;;; become.el ends here
