Set wshShell = WScript.CreateObject("WScript.Shell")

' All possible characters to be typed
strCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{};':,./<>? "

' Generate a random number
Randomize
intRandom = Int((Len(strCharacters) * Rnd) + 1)

' Get the random character
strKey = Mid(strCharacters, intRandom, 1)

' Handle special characters for SendKeys
Select Case strKey
    Case "+", "^", "%", "~", "(", ")", "[", "]", "{", "}"
        strKey = "{" & strKey & "}"
End Select

' Send the random keystroke
wshShell.SendKeys strKey
