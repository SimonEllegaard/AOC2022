cd 'C:\Users\sela\OneDrive\Dokumenter'

$inputFile = ".\aoc_day1.txt"

$lines = Get-Content $inputFile

$i = 0;
$cals = @(0);
foreach($line in $lines) {
	if($line -eq '') {
	    $i = $i+1;
        $cals += 0;
	}
    else {
        $cals[$i] += $line;
    }
}
write $cals | measure -Maximum
$top3 = $cals | sort -Descending | select -First 3
write $top3 | measure -Sum