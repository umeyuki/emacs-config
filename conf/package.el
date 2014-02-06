(dolist (pkg '(dayone redo+ expand-region))
  (unless (require pkg nil 'noerror)
    (package-install pkg)  
    )
  )

