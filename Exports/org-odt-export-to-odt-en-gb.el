;;; org-odt-export-to-odt-en-gb.el --- Org Novelist example export template to ODT -*- lexical-binding: t; -*-

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
    (org-export-with-date-orig nil)
    (org-odt-styles-file-orig nil))
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
    (when (boundp 'org-odt-styles-file)
      (setq org-odt-styles-file-orig org-odt-styles-file))
    (setq org-export-with-toc t)
    (setq org-export-with-title t)
    (setq org-export-with-author t)
    (setq org-export-with-email t)
    (setq org-export-with-date t)
    (setq org-odt-styles-file nil)
    (find-file org-input-file)
    (org-odt-export-to-odt)
    (setq org-odt-styles-file org-odt-styles-file-orig)
    (setq org-export-with-toc org-export-with-toc-orig)
    (setq org-export-with-title org-export-with-title-orig)
    (setq org-export-with-author org-export-with-author-orig)
    (setq org-export-with-email org-export-with-email-orig)
    (setq org-export-with-date org-export-with-date-orig)
    (make-directory (file-name-directory output-file) t)
    (rename-file (concat (file-name-sans-extension org-input-file) ".odt") output-file t)))

(provide 'org-odt-export-to-odt-en-gb)
;;; org-odt-export-to-odt-en-gb.el ends here
