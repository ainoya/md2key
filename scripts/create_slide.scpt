on run argv
  set slideTitle    to item 1 of argv
  set slideBody     to item 2 of argv
  set templateIndex to item 3 of argv as number

  tell application "Keynote"
    tell the front document
      -- Workaround to select correct master slide. In spite of master slide can be selected by name,
      -- name property is not limited to be unique.
      -- So move the focus to second slide and force "make new slide" to use the exact master slide.
      move slide templateIndex to before slide templateIndex

      set newSlide to make new slide
      tell newSlide
        set object text of default title item to slideTitle
        set object text of default body item to slideBody
      end tell
    end tell
  end tell
end run
