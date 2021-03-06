#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force

; Change the folder path to match yours, you can let the version as long as you let it in the folder name too
; Don't forget to remove the \ in the end if you have it
folderPath:="C:\Users\Undercov\Desktop\GifRandomizer"

; Here you can change the gif name
gifBlank:="blank" ; This gif is the default gif
gif1:="stickDance"
gif2:="happyDance"
gif3:="beanSpook"
gif4:="imLost"

gifTime:=5000 ; Default GIF visibility duration

varGIF:=gifBlank
randomValue:=0

counterPath=%folderPath%\Gifs\toDisplay\count.txt
cpt:=0
FileReadLine, cpt, %counterPath%, 1

; Continous loop that check if randomValue have been change.
; It will display blank.gif as default and a GIF image when the correct random value is found.
Loop {

  FileCopy, %folderPath%\Gifs\blank_backup.gif, %folderPath%\Gifs\toDisplay\blank.gif, 1 ; Replaces the blank.gif with the original blank_backup.gif

  if (randomValue = 0) { ; Default value don't touch this one
    varGIF := gifBlankA
    gifTime := 1000
  }

  ; From here, you can change as you want
  ; You can had more gif by copy paste the conditionnal and change the randomValue, the varGif (With one you have add)
  ; Don't forget to also change the gifTime (in ms) to match your gif or else, the gif can be cut, or stay too longer
  if (randomValue = 1) {
    varGIF := gif1
    gifTime := 4300
    randomValue := 0
  }

  if (randomValue = 2) {
    varGIF := gif2
    gifTime := 4500
    randomValue := 0
  }

  if (randomValue = 3) {
    varGIF := gif3
    gifTime := 3500
    randomValue := 0
  }

  if (randomValue = 4) {
    varGIF := gif4
    gifTime := 3375
    randomValue := 0
  }

  ; Using varGIF variable from above, the file path to the gif is built and it copies that image file to the image shown in OBS, overwriting it.
  FileCopy, %folderPath%\Gifs\%varGIF%.gif, %folderPath%\Gifs\toDisplay\blank.gif, 1

  Sleep, gifTime ; The image will be show for a specific time set for each image separately
}

; Change this if you want another keyboard shortcut, change also the shortcut in Send, don't touch the $ if you want to have original keyboard shortcut with Send
; Go to the link in the Customizations section in README file to find the combination you whant
$^f::
  Send, ^f
  Random, randomValue, 1 , 4 ; The value max can be change.

  ; Creates txt file if it doesn't exist.
  IfNotExist, %counterPath%
    FileAppend, 0, %counterPath%

  ; Inputs number of input in cpt variable.
  FileReadLine, cpt, %counterPath%, 1
  cpt := ++cpt
  FileDelete, %counterPath%
  FileAppend, %cpt%, %counterPath%
return
