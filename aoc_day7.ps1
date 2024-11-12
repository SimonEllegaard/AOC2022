cd 'C:\Users\sela\OneDrive\Dokumenter'

$inputFile = ".\aoc_day7.txt"

$lines = Get-Content $inputFile

# Part 1
$dirs = @{};
$currentDir = ''

foreach($line in $lines) {
    if($line -match '\$ (\w+) ?([\w\.\/]*)') {
        $command = $Matches[1]
        $arg = $Matches[2]
        if($command -eq 'cd') {
            switch($arg) {
                '/'     { $currentDir = '/' }
                '..'    { $currentDir = $currentDir.Substring(0, $currentDir.Substring(0, $currentDir.Length-1).LastIndexOf('/')+1) }
                default { $currentDir += $arg + '/' }
            }
            if($dirs.$currentDir -eq $null) {
                $dirs.$currentDir = 0
            }
        }
        if($command -eq 'ls') {
        }
    }
    else {
        if ($line -match '(\d+) ([\w\.]+)') {
            $size = $Matches[1]
            $file = $Matches[2]
            
            $dirSubPath = $currentDir.Clone()
            
            while($dirSubPath.Length -gt 0) {
                $dirs.$dirSubPath += $size
                $dirSubPath = $dirSubPath.Substring(0, $dirSubPath.Substring(0, $dirSubPath.Length-1).LastIndexOf('/')+1)
            }
        }
    }
}
write 'Part 1:'
($dirs.GetEnumerator() | where { $_.Value -lt 100000 }).Value | measure -Sum

# Part 2
$totalSpace = 70000000
$requiredSpace = 30000000
$usedSpace = $dirs['/']
$missingSpace = $requiredSpace - ($totalSpace - $usedSpace)

write 'Part 2'
($dirs.GetEnumerator() | where { $_.Value -gt $missingSpace }).Value | measure -Minimum