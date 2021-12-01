#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force

; GIF files variables initialization

folderPath:="C:\Users\Undercov\Desktop" ; Change it to match yours

gifBlank:="blank" ; This gif is the default gif
gif1:="stickDance"
gif2:="happyDance"
gif3:="beanSpook"
gif4:="imLost"

gifTime:=5000 ; Default GIF visibility duration

varGIF:=gifBlank
randomValue:=0

counterPath=%folderPath%\GifRandomizer\Gifs\toDisplay\count.txt
cpt:=0
FileReadLine, cpt, %counterPath%, 1

; Continous loop that check if randomValue have been change.
; It will display blank.gif as default and a GIF image when the correct random value is found.
Loop {

  FileCopy, %folderPath%\GifRandomizer\Gifs\blank_backup.gif, %folderPath%\GifRandomizer\Gifs\toDisplay\blank.gif, 1 ; Replaces the blank.gif with the original blank_backup.gif

  if (randomValue = 0) { ; Default value
    varGIF := gifBlankA
    gifTime:=1000
  }
  if (randomValue = 1) { ; If you had more gif copy paste this conditionnal and make all the change needed
    varGIF := gif1 ; This is the gif that will be display
    gifTime:=4300 ; And this is it's time in ms, unique for each gif
    randomValue:=0
  }
  if (randomValue = 2) {
    varGIF := gif2
    gifTime:=4500
    randomValue:=0
  }
  if (randomValue = 3) {
    varGIF := gif3
    gifTime:=3500
    randomValue:=0
  }
  if (randomValue = 4) {
    varGIF := gif4
    gifTime:=3375
    randomValue:=0
  }

  ; Using varGIF variable from above, the file path to the gif is built and it copies that image file to the image shown in OBS or Streamlabs, overwriting it.
  FileCopy, %folderPath%\GifRandomizer\Gifs\%varGIF%.gif, %folderPath%\GifRandomizer\Gifs\toDisplay\blank.gif, 1

  Sleep, gifTime ; The image will be show for a specific time set for each image separately
}

; Change this if you want another keyboard shortcut, change also the shortcut in Send, don't touch the $ if you want to have original keyboard shortcut with Send
$^f::
  Send, ^f
  Random, randomValue, 1 , 4 ; The value min and max can be change. If you want to change the shortcuts go to the README file to find the combination you whant

  ;Creates txt file if it doesn't exist.
  IfNotExist, %counterPath%
    FileAppend,0, %counterPath%

  ;Inputs number of input in cpt variable.
  FileReadLine, cpt, %counterPath%, 1
  cpt := ++cpt
  FileDelete, %counterPath%
  FileAppend,%cpt%, %counterPath%
return
