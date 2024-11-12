cd 'C:\Users\sela\OneDrive\Dokumenter'

$inputFile = ".\aoc_day4.txt"

$lines = Get-Content $inputFile

# Part 1
$res = 0;
foreach($line in $lines) {
    $line -match '(\d+)\-(\d+),(\d+)-(\d+)' > $null
    $elf1sec1 = [int]$Matches[1]
    $elf1sec2 = [int]$Matches[2]
    $elf2sec1 = [int]$Matches[3]
    $elf2sec2 = [int]$Matches[4]
    if(($elf1sec1 -ge $elf2sec1) -and ($elf1sec2 -le $elf2sec2)) {
        $res += 1
    }
    else {
        if(($elf1sec1 -le $elf2sec1) -and ($elf1sec2 -ge $elf2sec2)) {
            $res += 1
        }
    }    
}
write 'Part 1:'
write $res

# Part 2
$res = 0;
foreach($line in $lines) {
    $line -match '(\d+)\-(\d+),(\d+)-(\d+)' > $null
    $elf1sec1 = [int]$Matches[1]
    $elf1sec2 = [int]$Matches[2]
    $elf2sec1 = [int]$Matches[3]
    $elf2sec2 = [int]$Matches[4]
    if(($elf1sec1 -ge $elf2sec1) -and ($elf1sec1 -le $elf2sec2)) {
        $res += 1
    }
    else {
        if(($elf1sec2 -ge $elf2sec1) -and ($elf1sec2 -le $elf2sec2)) { # elf1 sections ends in elf2 sections
            $res += 1
        }
        elseif(($elf1sec2 -ge $elf2sec1) -and ($elf1sec2 -le $elf2sec2)) { # elf1 sections starts in elf2 sections
            $res += 1
        }
        elseif(($elf1sec1 -le $elf2sec1) -and ($elf1sec2 -ge $elf2sec2)) { # elf1 sections contain elf2 sections
            $res += 1
        }
        elseif(($elf1sec1 -ge $elf2sec1) -and ($elf1sec2 -le $elf2sec2)) { # elf2 sections contain elf1 sections
            $res += 1
        }
    }
}
write 'Part 2:'
write $res