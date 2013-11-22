(when (memq window-system '(mac ns))
  (require 'pbcopy)
  (turn-on-pbcopy)
  )
