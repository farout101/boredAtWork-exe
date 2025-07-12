Set wshShell = WScript.CreateObject("WScript.Shell")

Dim arrPhrases(4)
arrPhrases(0) = "gay"
arrPhrases(1) = "porn"
arrPhrases(2) = "you've been hunted down"
arrPhrases(3) = "hello pretty"
arrPhrases(4) = "why are u so fat as fuck"

Randomize
intRandom = Int((UBound(arrPhrases) + 1) * Rnd)

strPhrase = arrPhrases(intRandom)

wshShell.SendKeys strPhrase
