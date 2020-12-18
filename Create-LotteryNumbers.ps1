<#
	This script is based on the UK National Lottery LOTTO game.
	The game has 59 numbers.
	This script creates 10 lines of 6 numbers and the numbers are unique and never reused.
	The only exception to this is the final line which has to re-use 1 number as due to
	there being 59 numbers, there are 5 unused numbers after 9 lines.
#>

Clear-Host
$usedTotalNumbers = $null
$usedTotalNumbers = @()
$usedTotalNumbers += 0

### CREATE 9 LINES OF 6 UNIQUE NUMBERS ###
do {
	### CREATE A SINGLE LINE OF 6 UNIQUE NUMBERS FROM 1-59 ###
	$usedNumbers = @()
	do {
		$randomNumber = $null
		$randomNumber = Get-Random -Minimum 1 -Maximum 60
		if (($usedNumbers.contains("$randomNumber") -eq $False) -and ($usedTotalNumbers.contains("$randomNumber") -eq $False)) {
			$usedNumbers += $randomNumber
			$usedTotalNumbers += $randomNumber
		}
	}
	while (
		$usedNumbers.count -lt 6
	)
	# SORT THE NUMBERS #
	$lotteryNumbers = $usedNumbers | Sort-Object { [int]$_ }
	# OUTPUT NUMBERS TO HOST #
	Write-Host "Lottery Numbers - $($lotteryNumbers[0]),$($lotteryNumbers[1]),$($lotteryNumbers[2]),$($lotteryNumbers[3]),$($lotteryNumbers[4]),$($lotteryNumbers[5])"
}
while (
	$usedTotalNumbers.count -lt 54
)


### CREATE THE FINAL 10TH LINE USING THE REAMINING 5 NUMBERS PLUS AN ADDITIONAL REUSED NUMBER ###
$allNumbers = 1..59
$lastLine = $allNumbers | Where-Object { ($usedTotalNumbers.contains("$_") -eq $false) }

do {
	$finalRandomNumber = $null
	$finalRandomNumber = Get-Random -Minimum 1 -Maximum 59
	if (($lastLine.contains("$finalRandomNumber") -eq $False)) {
		$lastLine += $finalRandomNumber
	}
}
while (
	$lastLine.count -lt 6
)

# SORT FINAL LINE NUMBERS #
$finalLastLine = $lastLine | Sort-Object { [int]$_ }
#WRITE FINAL LINE TO HOST #
Write-Host "Lottery Numbers - $($finalLastLine[0]),$($finalLastLine[1]),$($finalLastLine[2]),$($finalLastLine[3]),$($finalLastLine[4]),$($finalLastLine[5]) (Last 5 unused numbers plus 1 reused number)"
