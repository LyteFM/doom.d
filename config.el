;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Fynn Leitow"
      user-mail-address "fynn@leitow.eu")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Nextcloud/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; projectile will search for directories in these folders:
;;(setq projectile-project-search-path '("~/Desktop/Pf"))


;; AUCTeX config
(add-hook 'LaTeX-mode-hook
          (lambda()
	    (add-to-list 'TeX-command-list '("XeLaTeX" "xelatex --synctex=1 -interaction=nonstopmode %s" TeX-run-command t t :help "Run xelatex") t)
	    (setq TeX-command-default "XeLaTeX")
	   ;; (setq TeX-save-query nil)
            (setq TeX-PDF-mode t)
	    'turn-on-reftex
	    (setq reftex-plug-into-AUCTeX t)
	   ;; (setq TeX-show-compilation t)
	    (setq TeX-parse-self t) ; Enable parse on load.
	    (setq TeX-auto-save t) ; Enable parse on save.
	  )
          )
(setq bibtex-completion-cite-prompt-for-optional-arguments nil)

;; Ivy config, see https://github.com/tmalsburg/helm-bibtex
;;(setq ivy-re-builders-alist
;;      '((ivy-bibtex . ivy--regex-ignore-order)
;;        (t . ivy--regex-plus)))

;; Config opttions for bibtext completion via helm/ivy
(setq bibtex-completion-bibliography
      '("/home/fynn/Desktop/Master/Bayesian_Glucose/LaTeX/bibliography/literature.bib"))
(setq bibtex-completion-library-path '("/home/fynn/Nextcloud/Docs/papers"))
(setq bibtex-completion-notes-path "/home/fynn/Nextcloud/org/papers")
(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (call-process "evince" nil 0 nil fpath)))

;; lsp-server
;;(setq read-process-output-max (* 1024 1024)) ;; 1mb
;;(setq lsp-completion-provider :capf)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
