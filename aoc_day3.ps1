cd 'C:\Users\sela\OneDrive\Dokumenter'

$inputFile = ".\aoc_day3.txt"

$lines = Get-Content $inputFile

# Part 1
$itemErrorPrios = @();
foreach($line in $lines) {
    $compartmentCount = $line.Length / 2
    
    $compartment1 = $line.Substring(0, $compartmentCount);
    $compartment2 = $line.Substring($line.Length-$compartmentCount);

    
    # write $line $compartment1 $compartment2
    $itemErrorPrio = 0;
    foreach($item in $compartment1 -split '') {
        if($compartment2.Contains($item)) {
            if($item -cmatch '[a-z]') {
                $itemErrorPrio = ([byte][char]$item - 96);
                continue;
            }
            if($item -cmatch '[A-Z]') {
                $itemErrorPrio = ([byte][char]$item - 38);
                continue;
            }
        }
    }
    
    foreach($item in $compartment2 -split '') {
        if($compartment1.Contains($item)) {
            if($item -cmatch '[a-z]') {
                $itemErrorPrio = ([byte][char]$item - 96);
                continue;
            }
            if($item -cmatch '[A-Z]') {
                $itemErrorPrio= ([byte][char]$item - 38);
                continue;
            }
        }
    }
    $itemErrorPrios += $itemErrorPrio;
}
write $itemErrorPrios | measure -sum

# Part 2
$badgePrios = @();
$batch = $lines | select -First 3
$lines = $lines = $lines | select -Skip 3
while($batch.Count -gt 0) {
    
    $elf0 = $batch[0] -split '';
    $elf1 = $batch[1] -split '';
    $elf2 = $batch[2] -split '';
    
    $badgeItem = ($elf0 | where -FilterScript { $_ -cin $elf1 -and $_ -cin $elf2 -and $_ -ne ''})[0]

    if($badgeItem -cmatch '[a-z]') {
        $badgePrios += ([byte][char]$badgeItem - 96);
    }
    if($badgeItem -cmatch '[A-Z]') {
        $badgePrios += ([byte][char]$badgeItem - 38);
    }

    $batch = $lines | select -First 3
    $lines = $lines = $lines | select -Skip 3
}
write $badgePrios | measure -sum