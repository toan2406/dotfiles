(use-package general)

(general-evil-setup)
(general-imap "j"
  (general-key-dispatch 'self-insert-command
    "j" 'evil-normal-state))
