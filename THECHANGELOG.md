1.34.0;

Added support for animated song headers (animation MUST be named 'idle' for it to work properly)
The Secret Debug Options menu got a new option!
A new startup animation has been added!
If you have an unsaved change, pressing BACKSPACE will automatically warn you that there are changes that haven't been saved yet!
The TitleState texts were changed a bit!
Updated the way Camera Twist looks - it looks more smoother and should break a LOT less often now. additionally it cleaned up some code
Removed "Hide scoreTxt" - can be recreated in a SINGULAR line
Fixed normal notes not being killed when being hit by the player in EditorPlayState
Fixed some note splash stuff.
Fixed an issue where if you made the game fast enough, the game wouldn't set Hurt Notes' hit properties to false, which means you would end up hitting the notes when you weren't supposed to
Fixed a crash that could occur if you use Char-Based Note Colors and try placing a note BEFORE ever entering PlayState
Fixed sustain notes using the wrong character-based colors if you had the play as opponent option turned on