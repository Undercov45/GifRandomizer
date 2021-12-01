# GifRandomizer

GifRandomizer is a AutoHotkey code that allows a streamer to randomly display a gif, in a list of gifs, after pressing a keyboard shortcuts.

## Installation

- First of all, download AutoHotkey in the AutoHotkey's site : https://www.autohotkey.com/

- After that, open the GifRandomizer.ahk with any text software and change the folderPath to match yours

## Usage

- First, on OBS, create a media source with the blank.gif in the folder Gifs/toDisplay

- Second, on OBS too, create a Text source that read the count.txt in toDisplay

- Double clik on the .ahk program

- The program run, by default use ctrl f to active it the program should display a gif and increase the number

- if you want to reset the number, you can either delete count.txt (it will be recreate) or, change the value in this same file to write a 0

## Customizations

You can change the gifs if you want, for that :

- Either you change the name of your gif with the same of the folder and replace it

- Either you change the code in GifRandomizer.ahk to match your gifs name

!!!! Remember to also change gifTime so that it is not too short or too long compared to the chosen gif !!!!

You can also change the keyboard shortcuts in the last line of the code, for that, refer to AutoHotkey :

- https://www.autohotkey.com/docs/KeyList.htm (for the list of keys available)
- https://www.autohotkey.com/docs/Hotkeys.htm (for some example)

Disclamer : If your antivirus have a problem with the program, just add an exception for the program, i'm working on this problem
