cd 'C:\Users\sela\OneDrive\Dokumenter'

$inputFile = ".\aoc_day5.txt"

$lines = Get-Content $inputFile
$drawing = $lines | select -First 9
$steps = $lines | select -Last ($lines.Count - 10)

# Import input as array of arrays
$stacks = @(@(),@(),@(),@(),@(),@(),@(),@(),@())
foreach ($dline in $drawing) {
    $boxes = select-string '(?:\[\w\]|\ {3}) |(?:\[\w\]|\ {3}$)' -input $dline -AllMatches | % matches | % Value
    $stackindex = 0
    foreach($box in $boxes) {
        if($box -match '\[\w\]') {
            $stacks[$stackindex] += ($box)
        }
        $stackindex += 1
    }
}

$p1Stacks = $stacks.Clone()
# Part 1
foreach($step in $steps) {
    $step -match 'move (\d+) from (\d+) to (\d+)' > $null
    $count = $Matches[1]
    $from = $Matches[2]
    $to = $Matches[3]
    $i = 0
    while ($i -lt $count) {
        $box = $p1Stacks[$from-1] | select -First 1
        $p1Stacks[$from-1] = $p1Stacks[$from-1] | select -Skip 1
        $p1Stacks[$to-1] = ,$box + $p1Stacks[$to-1]
        $i += 1
    }
}
write 'Part 1:'
foreach($stack in $p1Stacks) {
    write $stack[0] ''
}



$p2Stacks = $stacks.Clone()
# Part 2
foreach($step in $steps) {
    $step -match 'move (\d+) from (\d+) to (\d+)' > $null
    $count = $Matches[1]
    $from = $Matches[2]
    $to = $Matches[3]
    
    $boxes = $p2Stacks[$from-1] | select -First $count
    if($boxes.Count -eq 1) {
        $boxes = @($boxes)
    }
    $p2Stacks[$from-1] = @($p2Stacks[$from-1] | select -Skip $count)
    $p2Stacks[$to-1] = @($boxes + $p2Stacks[$to-1])
}
write 'Part 2:'
foreach($stack in $p2Stacks) {
    write $stack[0] ''
}