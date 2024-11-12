cd 'C:\Users\sela\OneDrive\Dokumenter'

$inputFile = ".\aoc_day8.txt"

$lines = Get-Content $inputFile

# Import input as array of arrays
$treeSquare = @()
foreach ($line in $lines) {
    $treeRowArray = @()

    foreach($tree in $line.GetEnumerator()) {
        $treeRowArray += $tree
    }
    $treeSquare += ,$treeRowArray
}


# Part 1
$res = 0;
for($r = 0; $r -lt $treeSquare.Length; $r++) {
    $row = $treeSquare[$r]

    for($i = 0; $i -lt $row.Length; $i++) {
        $tree = $row[$i]
        
        $leftTrees = $row | select -First $i
        if(($leftTrees | where { $_ -ge $tree }).Count -eq 0) {
            $res += 1
            continue
        }

        $rightTrees = $row | select -Last ($row.Length-($i+1))
        if(($rightTrees | where { $_ -ge $tree }).Count -eq 0) {
            $res += 1
            continue
        }

        $upTrees = $treeSquare | foreach { $_[$i] } | select -First $r
        if(($upTrees | where { $_ -ge $tree }).Count -eq 0) {
            $res += 1
            continue
        }

        $downTrees = $treeSquare | foreach { $_[$i] } | select -Last ($treeSquare.Length - ($r+1))
        if(($downTrees | where { $_ -ge $tree }).Count -eq 0) {
            $res += 1
            continue
        }
    }
}

for($r = 0; $r -lt $treeSquare.Length; $r++) {
    $row = $treeSquare[$r]

    for($i = 0; $i -lt $row.Length; $i++) {
        $tree = $row[$i]
        
        $leftTrees = $row | select -First $i
        if(($leftTrees | where { $_ -ge $tree }).Count -eq 0) {
            $res += 1
            continue
        }

        $rightTrees = $row | select -Last ($row.Length-($i+1))
        if(($rightTrees | where { $_ -ge $tree }).Count -eq 0) {
            $res += 1
            continue
        }

        $upTrees = $treeSquare | foreach { $_[$i] } | select -First $r
        if(($upTrees | where { $_ -ge $tree }).Count -eq 0) {
            $res += 1
            continue
        }

        $downTrees = $treeSquare | foreach { $_[$i] } | select -Last ($treeSquare.Length - ($r+1))
        if(($downTrees | where { $_ -ge $tree }).Count -eq 0) {
            $res += 1
            continue
        }
    }
}
write $res