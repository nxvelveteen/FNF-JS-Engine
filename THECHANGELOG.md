1.36.0;

Made it more clear what "Health Bar Transparency" means
The cameraFade LUA function now has a fadeOut option (the one that was added in PE 1.0!)
3 new Startup Animations
All options related to customization in the Visuals & UI Options have been moved to be less annoying to get to
The Simple rating popups have been separated into their own option
Rating Sprites have been organized into folders! Check the shared/images/ratings folder for more info.
You can also now add your own sets of rating images, along with hitStrings, fcStrings and judgeCountStrings text files! Check images/ratings for more info or check the modTemplate zip file!
Gold Ratings have been removed completely
The NMCW rating sprites have been remade!
Satin Panties Erect now has its own events
added a secret helping function for the "Copy to the next.." and "Copy from the last to the next.." buttons: pressing CTRL will Swap Sectionify all notes
Added blockHit for unspawnNotes
Fixed a StartupState crash
Fixed "Copy to the next..." crashing if you put a number higher than the amount of sections the song currently has
exiting the week editor in any way now plays the correct menu music
Fixed sustain notes having weird angles in modcharts where a strum's angle is changed (hopefully)
Fixed notes on the same note data only playing 1 note on 1 side if "Play Both Sides" is enabled
Fixed a crash that would occur if playerChar was null
Fixed some crashes that could occur if vocals and/or opponentVocals are null
Fixed a crash that could occur for some reason if you left the Pause Menu
Fixed addWiggleEffect not working