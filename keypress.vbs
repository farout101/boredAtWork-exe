Set WshShell = WScript.CreateObject("WScript.Shell")

' The string of characters to type
Dim charsToType
If WScript.Arguments.Count > 0 Then
    charsToType = WScript.Arguments(0)
Else
    charsToType = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
End If

' Check if it's a special key like {ENTER}
If Left(charsToType, 1) = "{" And Right(charsToType, 1) = "}" Then
    WshShell.SendKeys charsToType
Else
    ' Type each character with a small delay
    For i = 1 To Len(charsToType)
        WshShell.SendKeys Mid(charsToType, i, 1)
        WScript.Sleep 100 ' Delay in milliseconds
    Next
End If