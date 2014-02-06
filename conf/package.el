(dolist (pkg '(dayone redo+ expand-region historyf))
  (unless (require pkg nil 'noerror)
    (package-install pkg)  
    )
  )

