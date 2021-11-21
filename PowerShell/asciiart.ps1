# asciiart PowerShell
<#
powershell
Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
./asciiart
#>

For ($y = -12; $y -le 12; $y++) {
	For ($x = -39; $x -le 39; $x++) {
		$ca = $x * 0.0458
		$cb = $y * 0.08333
		$a = $ca
		$b = $cb
		$s = " "
		For ($i = 0; $i -le 15; $i++) {
			$t = $a * $a - $b * $b + $ca
			$b = 2 * $a * $b + $cb
			$a = $t
			If (($a * $a + $b * $b) -gt 4) {
				$s = $i.ToString("X")
				Break
			}
		}
		Write-Host -NoNewline $s
	}
	Write-Host
}
