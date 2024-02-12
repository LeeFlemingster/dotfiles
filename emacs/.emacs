;;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))

;;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;;; aspell
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-list-command "--list")
(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))

;;; Package manager
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;;; Start emacs server
(server-start)

;;; Evil-mode
(require 'evil)
(add-to-list 'load-path "~/.emacs.d/evil")
(setq evil-move-cursor-back nil)
(evil-mode 1)

;;; Evil key bindings
(define-key evil-motion-state-map (kbd "gc") 'evil-avy-goto-char)
(define-key evil-motion-state-map (kbd "gr") 'evil-avy-goto-word-0)
(define-key evil-motion-state-map (kbd "gl") 'evil-avy-goto-line)
(define-key evil-motion-state-map (kbd "zu") 'undo-tree-visualize)

;;; Relative line numbers
(require 'nlinum-relative)
(nlinum-relative-setup-evil)                    ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)      ;; delay
(setq nlinum-relative-current-symbol "")      ;; or "" for display current line number
(setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...

;;; Smooth scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;;; Generic settings
; inhibit startup message
(setq inhibit-startup-message t)
; type "y"/"n" instead of "yes"/"no"
(fset 'yes-or-no-p 'y-or-n-p)
; truncate lines if they are too long
(setq-default truncate-lines t)

;;; Swap search and regexp-search keys
(global-set-key (kbd "\C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-S") 'isearch-forward)
(global-set-key (kbd "C-M-S") 'isearch-backward)
(global-set-key (kbd "C-M-5") 'replace-regexp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-all-windows t)
 '(avy-keys (quote (97 111 101 117 105 100 104 116 110 115)))
 '(fill-column 79)
 '(todotxt-file "/Users/Lee/Dropbox/todo/todo.txt" nil (todotxt))
 '(tool-bar-mode nil))



;;;; Remove ^M
;(defun strip-^m ()
;  (interactive)
;  (goto-char (point-min))
;  (while (search-forward "\r" nil nil)
;    (replace-match "")))
;;;(define-key esc-map "o" 'strip-^m)

;;;; smerge for git
;(defun sm-try-smerge ()
;   (save-excursion
;      (goto-char (point-min))
;      (when (re-search-forward "^<<<<<<< " nil t)
;         (smerge-mode 1))))
;
;(add-hook 'find-file-hook 'sm-try-smerge t)

;;;; Undo tree
;(require 'undo-tree)
;(global-undo-tree-mode)

;;;; Uniquify
;(defun uniquify-all-lines-region (start end)
;  "Find duplicate lines in region START to END keeping first occurrence."
;  (interactive "*r")
;  (save-excursion
;    (let ((end (copy-marker end)))
;      (while
;          (progn
;            (goto-char start)
;            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
;        (replace-match "\\1\n\\2")))))
;
;(defun uniquify-all-lines-buffer ()
;  "Delete duplicate lines in buffer and keep first occurrence."
;  (interactive "*")
;  (uniquify-all-lines-region (point-min) (point-max)))

;;;; utf-8
;(define-abbrev-table 'global-abbrev-table '(
;    ("alpha" "α" nil 0)
;    ("beta" "β" nil 0)
;    ("gamma" "γ" nil 0)
;    ("theta" "θ" nil 0)
;    ("Infinity" "∞" nil 0)
;    ("..." "…" nil 0)
;
;    ("ar1" "→" nil 0)
;    ("ar2" "⇒" nil 0)
;    ))
;
;(abbrev-mode 1) ; turn on abbrev mode

;;;; Matlab mode
;(autoload 'matlab-mode "d:/emacs-23.1/site-lisp/matlab.el" "Enter Matlab mode." t) 
;(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist)) 
;(autoload 'matlab-shell "d:/emacs-23.1/site-lisp/matlab.el" "Interactive Matlab mode." t) 

;;;; Git
;;(setq exec-path '("D:/git/bin" "D:/git/libexec/git-core" "D:/emacs-23.1/bin" "D:/git/cmd"))
;(setq exec-path '("H:/git/PortableGit/bin" "H:/git/PortableGit/libexec/git-core" "H:/emacs/bin" "H:/git/PortableGit/cmd" "H:/git/PortableGit/usr/bin"))
;;(setenv "PATH" (concat (getenv "PATH") ";D:\\git\\bin;D:\\git\\libexec\\git-core;D:\\git\\cmd;D:\\gnuwin32\\bin"))
;;(setenv "PATH" "D:\\git\\bin;D:\\git\\libexec\\git-core")
;(setenv "PATH" "H:\\git\\PortableGit\\bin;H:\\git\\PortableGit\\libexec\\git-core")
;;(add-to-list 'load-path "D:/emacs-23.1/site-lisp")
;
;(require 'git-emacs)
;(require 'git-mswin)
;(require 'egg)
;(setq git-state-modeline-decoration 'git-state-decoration-small-dot)

;;;;; Aspell/Flyspell
;;;(setq exec-path '("C:/Program Files/Aspell/bin"))
;;(setq exec-path
;;      (append (list nil "C:/Program Files/Aspell/bin")
;;              exec-path))
;;
;;(setq-default ispell-program-name "aspell") 
;;;(setq-default ispell-extra-args '("--reverse")) 
;;;(setq-default ispell-extra-args '("--sug-mode=bad-spellers")) 
;;(autoload 'ispell-word "ispell"
;;"Check the spelling of word in buffer." t)
;;(setq-default ispell-dictionary "british")
;;(global-set-key "\e$" 'ispell-word)
;;(autoload 'ispell-region "ispell"
;;"Check the spelling of region." t)
;;(autoload 'ispell-buffer "ispell"
;;"Check the spelling of buffer." t)
;;(autoload 'ispell-complete-word "ispell"
;;"Look up current word in dictionary and try to complete it." t)
;;(autoload 'ispell-change-dictionary "ispell"
;;"Change ispell dictionary." t)
;;;still necessary
;;(setenv "TEMP" "c:/windows/temp")
;;(setenv "TMP" "c:/windows/temp")
;;; helpful
;;(setq text-mode-hook '(lambda ()
;;(local-set-key "\M-\t" 'ispell-complete-word)))
;;(setq tex-mode-hook '(lambda ()
;;(local-set-key "\M-\t" 'ispell-complete-word)))
;;(setq latex-mode-hook '(lambda ()
;;(local-set-key "\M-\t" 'ispell-complete-word)))
;;; enable tex parser, also very helpful
;;(setq ispell-enable-tex-parser t)
;;;flyspell
;;(require 'flyspell)
;;(add-hook 'text-mode-hook 'flyspell-mode)
;;(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checking" t)
;;(autoload 'global-flyspell-mode "flyspell" "On-the-fly spelling" t)
;
;;
;; Already done above
;;
;;;;; gnu tools (diff)
;;;(setq exec-path '("D:/gnuwin32/bin"))
;;(setq exec-path
;;      (append (list nil "D:/gnuwin32/bin")
;;              exec-path))

;;;; org-mode
;(setq org-cycle-include-plain-lists t)
;(setq org-hide-leading-stars t)
;(setq org-log-state-notes-into-drawer "LOGBOOK")
;
;;; Agenda - The following lines are always needed.
;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-ca" 'org-agenda)
;(add-hook 'org-mode-hook 'turn-on-font-lock)  ; org-mode buffers only
;(setq org-agenda-files (list "H:/notes/notes.txt"))
;
;;; Remember
;;(require 'org-remember)
;(require 'org-capture)
;
;;(org-remember-insinuate)
;;(define-key global-map "\C-cr" 'org-remember)
;(define-key global-map "\C-cr" 'org-capture)
;(setq org-log-into-drawer 't)
;
;;(setq org-remember-templates
;; '(
;;   ("Todo" ?t "* TODO %^{Brief Description} %^g\n  - Added: %U\n    %?" "H:/notes/notes.txt" "Tasks")
;;   ("Note" ?n "* %^{Brief Description} \n  Added: %U\n  %?\n" "H:/notes/notes.txt" "Notes")
;;   ("PR Notes" ?p "* PR_%^{PR Number} - %^{PR Description} \n  - Notes\n    %?\n  - Regression tags" "H:/notes/notes.txt" "PR Notes")
;;  )
;;)
;
;(setq org-capture-templates
; '(
;   ("t" "Todo" entry (file+headline "H:/notes/notes.txt" "Tasks") "* TODO %^{Brief Description} %^g\n:LOGBOOK:\n- State \"TODO\". Added  %U\n:END:\n%?")
;   ("d" "Draft" entry (file+headline "H:/notes/notes.txt" "Tasks") "* Draft %^{Brief Description} \n:LOGBOOK:\n- State \"Draft\" %U\n:END:\n%?")
;   ("n" "Note" entry (file+headline "H:/notes/notes.txt" "Notes") "* %^{Brief Description} \nAdded: %U\n%?\n")
;   ("p" "PR Notes" entry (file+headline "H:/notes/notes.txt" "PR Notes") "* <<PR_%^{PR Number}>> - %^{PR Description} \n- Notes\n    %?\n- Regression tags")
;  )
; )
;
;(setq org-todo-keyword-faces
;      '(
;        ("WORKING" . (:foreground "darkgoldenrod2" :weight bold))
;        ("Run" . (:foreground "darkgoldenrod2" :weight bold))
;        ("WAITING" . (:foreground "wheat4" :weight bold))
;        ("Under-Review" . (:foreground "wheat4" :weight bold))
;        ("Rework-Complete" . (:foreground "wheat4" :weight bold))
;        ))
;
;;; Re-file
;'(org-refile-targets (quote ( ("H:/notes/notes.txt" :level . 2)  )))
;(setq org-use-fast-todo-selection t)

;;;; Fix mouse copy paste
;(setq select-active-regions nil)
;(setq mouse-drag-copy-region t)
;(global-set-key [mouse-2] 'mouse-yank-at-click)

;;;; gnuplot
;;; Lines enabling gnuplot-mode
;(setq exec-path
;      (append (list nil "D:/gnuplot/")
;              exec-path))
;
;;; move the files gnuplot.el to someplace in your lisp load-path or
;;; use a line like
;;;  (setq load-path (append (list "/path/to/gnuplot") load-path))
;
;;; these lines enable the use of gnuplot mode
;  (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
;  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
;
;;; this line automatically causes all files with the .gp extension to
;;; be loaded into gnuplot mode
;  (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
;
;;; This line binds the function-9 key so that it opens a buffer into
;;; gnuplot mode 
;  (global-set-key [(f9)] 'gnuplot-make-buffer)
;
;;; end of line for gnuplot-mode

;;;; Other settings
;; Save files in DOS mode
;(setq-default buffer-file-coding-system 'raw-text-dos)
;
;; dont use tabs for indenting
;(setq-default indent-tabs-mode nil)
;(setq-default tab-width 3)
;
;; highlight incremental search
;(setq search-highlight t)

;;;; syntax highlighting (Font locking)
;;generics
;;Clear\\|SetInteractive\\|Plot\\|SimPlotAxis\\|Log1\\|Log2\\|Log3\\|Log4\\|Set\\|Wave\\|WaitTime\\|WaitWhile\\|WaitUntil\\|Ramp\\|RampTo\\|StopRamp\\|TestAuthor\\|TestVersion\\|TestTitle\\|AllFileDir\\|TestFileDir\\|PlotFileDir\\|LogFileDir\\|DataFileDir\\|SetModel\\|SetAS\\|Tests\\|ReadTestInfo\\|RunTime\\|Rig\\|TimeDeterministic\\|LogFile\\|Add\\|Comment\\|Requirement\\|ShowValue\\|CatchUp\\|ScopeSetARINC\\|ScopeSetModel\\|ScopeSetEEC\\|StartTest\\|EchoOn\\|EchoOff\\|PlotOff\\|LogAllLines\\|SetProbeTime\\|OpenPlotFile\\|ClosePlotFile\\|LogRate\\|UpdateSetup\\|Hex2Char\\|ConvertToASCII\\|LogOn\\|LogOff\\|Error\\|Compare\\|CompareValue\\|Run\\|GetStartEndItem\\|GetValue\\|ReplyMode\\|Reply\\|ReadData\\|FindDataTable\\|ReadVarNames\\|ReadVarData\\|StoreData\\|RemoveTempData\\|DebugFileWrite\\|in_list\\|in_range\\|InteractiveCheck\\|AssignGlobalArray\\|ReadArray\\|LeftOfString\\|RightOfString\\|MiddleOfString\\|LengthOfString\\|FindPosInString
;;PRJ macros
;;PRJ_MasterLever\\|PRJ_MACRO_LIB\\|PRJ_Vars\\|PRJ_SendEMSCommands\\|PRJ_InitEMS\\|PRJ_InitSetup\\|PRJ_EndTest\\|PRJ_IncludeTestMacros\\|PRJ_RigConfig\\|PRJ_STFConfig\\|PRJ_SelectEngineLocation\\|PRJ_SetReprog\\|PRJ_ClrReprog\\|PRJ_CaptureEDP\\|PRJ_ReconnectEMS\\|PRJ_NewOMSSession\\|PRJ_ReadOMSFile\\|PRJ_ReadSysIDFile\\|PRJ_SoftTrim\\|PRJ_Comment\\|PRJ_A380Comment\\|PRJ_A350Comment\\|PRJ_Power\\|PRJ_PowerInterrupt\\|PRJ_ForceChannel\\|PRJ_ResetChannel\\|PRJ_StartEngine\\|PRJ_RestartEngine\\|PRJ_QuickRelightEngine\\|PRJ_ShutdownEngine\\|PRJ_Takeoff\\|PRJ_Environment\\|PRJ_FlightEnvelope\\|PRJ_Land\\|PRJ_Accel\\|PRJ_Decel\\|PRJ_EIFOffset\\|PRJ_RotarySelector\\|PRJ_MasterLever\\|PRJ_ManStartPB\\|PRJ_NLModePB\\|PRJ_FlightSw\\|PRJ_LandingGear\\|PRJ_Slats\\|PRJ_Spoilers\\|PRJ_FireHandle\\|PRJ_SelectBleed\\|PRJ_CheckFuelIndex\\|PRJ_CheckFM\\|PRJ_CheckFMTimer\\|PRJ_CheckSL\\|PRJ_CheckDL\\|PRJ_CheckDLPackedBits\\|PRJ_CheckARINC\\|PRJ_A380CheckARINC\\|PRJ_A350CheckARINC\\|PRJ_CheckARINCFS\\|PRJ_A380CheckARINCFS\\|PRJ_A350CheckARINCFS\\|PRJ_CheckNoLOTC\\|PRJ_CheckSteadyState\\|PRJ_CheckHealth
;(setq script-macros '( 
;;;; Project Data dictionary
;    ("" . font-lock-constant-face)
;;;; Project macros (font-lock-function-name-face)
;    ("Clear\\|SetInteractive\\|Plot\\|SimPlotAxis\\|Log1\\|Log2\\|Log3\\|Log4\\|Set\\|Wave\\|WaitTime\\|WaitWhile\\|WaitUntil\\|Ramp\\|RampTo\\|StopRamp\\|TestAuthor\\|TestVersion\\|TestTitle\\|AllFileDir\\|TestFileDir\\|PlotFileDir\\|LogFileDir\\|DataFileDir\\|SetModel\\|SetAS\\|Tests\\|ReadTestInfo\\|RunTime\\|Rig\\|TimeDeterministic\\|LogFile\\|Add\\|Comment\\|Requirement\\|ShowValue\\|CatchUp\\|ScopeSetARINC\\|ScopeSetModel\\|ScopeSetEEC\\|StartTest\\|EchoOn\\|EchoOff\\|PlotOff\\|LogAllLines\\|SetProbeTime\\|OpenPlotFile\\|ClosePlotFile\\|LogRate\\|UpdateSetup\\|Hex2Char\\|ConvertToASCII\\|LogOn\\|LogOff\\|Error\\|Compare\\|CompareValue\\|Run\\|GetStartEndItem\\|GetValue\\|ReplyMode\\|Reply\\|ReadData\\|FindDataTable\\|ReadVarNames\\|ReadVarData\\|StoreData\\|RemoveTempData\\|DebugFileWrite\\|in_list\\|in_range\\|InteractiveCheck\\|AssignGlobalArray\\|ReadArray\\|LeftOfString\\|RightOfString\\|MiddleOfString\\|LengthOfString\\|FindPosInString\\|PRJ_MasterLever\\|PRJ_MACRO_LIB\\|PRJ_Vars\\|PRJ_SendEMSCommands\\|PRJ_InitEMS\\|PRJ_InitSetup\\|PRJ_EndTest\\|PRJ_IncludeTestMacros\\|PRJ_RigConfig\\|PRJ_STFConfig\\|PRJ_SelectEngineLocation\\|PRJ_SetReprog\\|PRJ_ClrReprog\\|PRJ_CaptureEDP\\|PRJ_ReconnectEMS\\|PRJ_NewOMSSession\\|PRJ_ReadOMSFile\\|PRJ_ReadSysIDFile\\|PRJ_SoftTrim\\|PRJ_Comment\\|PRJ_A380Comment\\|PRJ_A350Comment\\|PRJ_Power\\|PRJ_PowerInterrupt\\|PRJ_ForceChannel\\|PRJ_ResetChannel\\|PRJ_StartEngine\\|PRJ_RestartEngine\\|PRJ_QuickRelightEngine\\|PRJ_ShutdownEngine\\|PRJ_Takeoff\\|PRJ_Environment\\|PRJ_FlightEnvelope\\|PRJ_Land\\|PRJ_Accel\\|PRJ_Decel\\|PRJ_EIFOffset\\|PRJ_RotarySelector\\|PRJ_MasterLever\\|PRJ_ManStartPB\\|PRJ_NLModePB\\|PRJ_FlightSw\\|PRJ_LandingGear\\|PRJ_Slats\\|PRJ_Spoilers\\|PRJ_FireHandle\\|PRJ_SelectBleed\\|PRJ_CheckFuelIndex\\|PRJ_CheckFM\\|PRJ_CheckFMTimer\\|PRJ_CheckSL\\|PRJ_CheckDL\\|PRJ_CheckDLPackedBits\\|PRJ_CheckARINC\\|PRJ_A380CheckARINC\\|PRJ_A350CheckARINC\\|PRJ_CheckARINCFS\\|PRJ_A380CheckARINCFS\\|PRJ_A350CheckARINCFS\\|PRJ_CheckNoLOTC\\|PRJ_CheckSteadyState\\|PRJ_CheckHealth" . font-lock-function-name-face)
;;;; ADI Interact Commands (font-lock-builtin-face)
;    ("abs\\|acos\\|advance\\|asin\\|atan\\|atan2\\|concat\\|cos\\|cosh\\|defined\\|eqv\\|exp\\|fclose\\|fflush\\|fgets\\|file_exists\\|fopen\\|fprintf\\|fputs\\|frac\\|fscanf\\|getenv\\|int\\|log10\\|log2\\|logical\\|mod\\|nand\\|neqv\\|nint\\|nor\\|pclose\\|popen\\|pow\\|random\\|regexp\\|sin\\|sinh\\|sprintf\\|sqrt\\|sscanf\\|string\\|strtok\\|tan\\|tanh\\|to_string\\|variable_exists" . font-lock-builtin-face)
;;;; ADI Intrinsic Functions (font-lock-builtin-face)
;    ("alert\\|alias\\|alias_define\\|alias_delete\\|attach\\|audit_purge\\|audit_save\\|break_if\\|breakpoint_clear\\|breakpoint_clear_all\\|breakpoint_set_address\\|breakpoint_set_function\\|breakpoint_set_label\\|breakpoint_set_line\\|breakpoint_set_statement\\|breakpoint\\|capture_add\\|capture_comment_add\\|capture_comment_clear\\|capture_comment_reset\\|capture_comment\\|capture_count\\|capture_delete\\|capture_delete_all\\|capture_flush_rate\\|capture_log_file\\|capture_log_off\\|capture_log_on\\|capture_log\\|capture_pretrigger_framecount\\|capture_time_reference\\|capture_trigger_clear\\|capture_trigger_set\\|capture\\|continue\\|date_time\\|define\\|detach\\|device_status\\|dimension\\|directory_set\\|dynamic_capture_add\\|dynamic_schedule_item_add\\|dynamic_schedule_item_count\\|dynamic_schedule_item_delete\\|dynamic_schedule_item_delete_all\\|endrun_capture_add\\|endrun_capture_close\\|endrun_capture_count\\|endrun_capture_delete\\|endrun_capture_file\\|endrun_capture_flush\\|endrun_capture_reset\\|endrun_delete_frame\\|endrun_capture\\|eval\\|executive_install\\|file_alias_load\\|file_alias\\|file_execute\\|file_exit\\|end_for\\|for\\|freeze_clear\\|freeze_set\\|get_algebraic\\|get_derivative\\|get_initial_condition\\|get_logical\\|get_next_state\\|get_state\\|get_string\\|get_system\\|get\\|go\\|halt\\|help\\|history_save\\|history_size\\|history\\|if\\|else_if\\|end_if\\|journal_pause\\|journal_resume\\|journal_save\\|journal_start\\|journal_stop\\|list\\|local\\|loop\\|macro_define\\|end_macro\\|macro_delete\\|macro_list\\|macro\\|memory_display\\|memory_set_byte\\|memory_set_longword\\|memory_set_word\\|method_list\\|method_set\\|next\\|output\\|override\\|override_activate\\|override_add_active\\|override_add_inactive\\|override_deactivate\\|override_delete\\|override_delete_all\\|override_replace\\|parameter_set\\|process_priority\\|process_spawn\\|program_reset\\|project_reset\\|prompt_filename\\|prompt_integer\\|prompt_real\\|prompt_text\\|prompt_yes_no\\|put\\|put_logical\\|put_string\\|redo\\|register_display\\|register_set\\|reset\\|[[:space:]]+return\\|schedule\\|schedule_add\\|schedule_delete\\|schedule_item_add\\|schedule_item_count\\|schedule_item_delete\\|schedule_item_delete_all\\|schedule_trigger_clear\\|schedule_trigger_set\\|scope_list\\|scope_pop\\|scope_push\\|scope_set\\|sequence\\|sequence_add\\|sequence_delete\\|sequence_item_add\\|sequence_item_count\\|sequence_item_delete\\|sequence_item_delete_all\\|sequence_trigger_clear\\|sequence_trigger_set\\|session_variables\\|setup_file_load\\|setup_file_save\\|setup_script_save\\|source\\|step\\|stepi\\|system\\|thread_set\\|traceback\\|trigger\\|trigger_define\\|trigger_define_latched\\|trigger_delete\\|undefine\\|update_setup\\|variable_type\\|verify_load\\|version_display\\|wait\\|when\\|end_while\\|while\\|log" . font-lock-builtin-face)))

;;;(define-derived-mode test-script-mode fundamental-mode 
;;(define-derived-mode test-script-mode text-mode "Test Script"
;;    ;(set-syntax-table script-syntax-table)
;;    (modify-syntax-entry ?; "<") 
;;    (modify-syntax-entry ?\n ">")
;;    (modify-syntax-entry ?" "\"")
;;    (modify-syntax-entry ?( "(") 
;;    (modify-syntax-entry ?) ")")
;;    (setq font-lock-defaults '(script-macros)))
;
;(setq auto-mode-alist 
;    (append
;        '(("\\.tst\\'" . test-script-mode))
;    auto-mode-alist))
;
;(put 'downcase-region 'disabled nil)
;
;(put 'upcase-region 'disabled nil)
; 
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
