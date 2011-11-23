;; This file contains functions we find useful when working
;; with local and remote repositories.

;; We need magit mode
(require 'magit)

(defun fast-add-staged ()
  (magit-run-git "add" "-u")
)

(defun fast-add-all ()
  (magit-run-git "add" "-A")
)

(defun fast-commit (cmsg)
  (magit-run-git "commit" "-m" cmsg)
)

(defun fast-push ()
  (magit-run-git "push")
)

;; Fast scp (stage, commit, and push): Stages all changes to tracked
;; files, commits changes with the user-provided commit message and
;; pushes changes to the remote repository
(defun fast-scp (cmsg)
  "performs a fast commit and push of all staged files with the given message"
  (fast-add-staged)
  (interactive "sCommit Message:")
  (fast-commit cmsg)
  (message "commit and pushing tracked files with message %s" cmsg)
  (fast-push)
)
;; Fast sacp (stage all, commit, and push): Stages all changes to tracked
;; *and new* files, commits changes with the user-provided commit message and
;; pushes changes to the remote repository
(defun fast-sacp (cmsg)
  "performs a fast commit and push of all staged files with the given message"
  (fast-add-all)
  (interactive "sCommit Message:")
  (fast-commit cmsg)
  (message "commit and pushing tracked files with message %s" cmsg)
  (fast-push)
)
