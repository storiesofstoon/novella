;;; org-latex-export-to-pdf-en-gb.el --- Org Novelist example export template to PDF -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'org)


;;;; Required Entry Point Function for Org Novelist Export

(defun org-novelist--export-template (org-input-file output-file)
  "Given an ORG-INPUT-FILE from Org Novelist, export to OUTPUT-FILE."
  (let ((org-export-with-toc-orig nil)
    (org-export-with-title-orig nil)
    (org-export-with-author-orig nil)
    (org-export-with-email-orig nil)
    (org-export-with-date-orig nil))
    (when (boundp 'org-export-with-toc)
      (setq org-export-with-toc-orig org-export-with-toc))
    (when (boundp 'org-export-with-title)
      (setq org-export-with-title-orig org-export-with-title))
    (when (boundp 'org-export-with-author)
      (setq org-export-with-author-orig org-export-with-author))
    (when (boundp 'org-export-with-email)
      (setq org-export-with-email-orig org-export-with-email))
    (when (boundp 'org-export-with-date)
      (setq org-export-with-date-orig org-export-with-date))
    (setq org-export-with-toc t)
    (setq org-export-with-title t)
    (setq org-export-with-author t)
    (setq org-export-with-email t)
    (setq org-export-with-date t)
    (find-file org-input-file)
    (org-latex-export-to-pdf)
    (setq org-export-with-toc org-export-with-toc-orig)
    (setq org-export-with-title org-export-with-title-orig)
    (setq org-export-with-author org-export-with-author-orig)
    (setq org-export-with-email org-export-with-email-orig)
    (setq org-export-with-date org-export-with-date-orig)
    (make-directory (file-name-directory output-file) t)
    (rename-file (concat (file-name-sans-extension org-input-file) ".pdf") output-file t)
    (rename-file (concat (file-name-sans-extension org-input-file) ".tex") (concat (file-name-sans-extension output-file) ".tex") t)))

(provide 'org-latex-export-to-pdf-en-gb)
;;; org-latex-export-to-pdf-en-gb.el ends here
