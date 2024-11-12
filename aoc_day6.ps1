cd 'C:\Users\sela\OneDrive\Dokumenter'

$inputFile = ".\aoc_day6.txt"

$content = Get-Content $inputFile

# Part 1
$match = $false
$chars = $content -split ''
$i = 0
while($match -eq $false) {
    $try = $content.Substring($i, 14)
    if($try.ToCharArray() | Group | Select Count | Where -Property Count -ne 1)
    {
        $i += 1
    } 
    else
    {
        $match = $true
    }
}
write ($i + 14)