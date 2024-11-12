cd 'C:\Users\sela\OneDrive\Dokumenter'

$inputFile = ".\aoc_day2.txt"

$lines = Get-Content $inputFile

# Part 1
$score1 = 0;

foreach($line in $lines) {
    $opp = $line.Substring(0, 1);
    $me = $line.Substring($line.Length-1);
    $result = '';
    if($opp -eq 'A') { # Rock
        switch($me) {
            'X' {$result = 'tie'} # Rock
            'Y' {$result = 'win'} # Paper
            'Z' {$result = 'loss'} # Scissors
        }
            
    }

    if($opp -eq 'B') { # Paper
        switch($me) {
            'X' {$result = 'loss'} # Rock
            'Y' {$result = 'tie'} # Paper
            'Z' {$result = 'win'} # Scissors
        }
    }

    if($opp -eq 'C') { # Scissors
        switch($me) {
            'X' {$result = 'win'} # Rock
            'Y' {$result = 'loss'} # Paper
            'Z' {$result = 'tie'} # Scissors
        }
    }
    
    switch($result) {
        'win'  {$score1 += 6}
        'tie'  {$score1 += 3}
        'loss' {$score1 += 0}
    }

    switch($me) {
        'X' {$score1 += 1} # Rock
        'Y' {$score1 += 2} # Paper
        'Z' {$score1 += 3} # Scissors
    }
}

write $score1;

# Part 2
$score2 = 0;

foreach($line in $lines) {
    $opp = $line.Substring(0, 1);
    $result = $line.Substring($line.Length-1);
    $me = '';
    if($opp -eq 'A') { # Rock
        switch($result) {
            'X' {$me = 'scissors'} # Loss
            'Y' {$me = 'rock'} # Draw
            'Z' {$me = 'paper'} # Win
        }
            
    }

    if($opp -eq 'B') { # Paper
        switch($result) {
            'X' {$me = 'rock'} # Loss
            'Y' {$me = 'paper'} # Draw
            'Z' {$me = 'scissors'} # Win
        }
    }

    if($opp -eq 'C') { # Scissors
        switch($result) {
            'X' {$me = 'paper'} # Loss
            'Y' {$me = 'scissors'} # Draw
            'Z' {$me = 'rock'} # Win
        }
    }
    
    switch($result) {
        'Z'  {$score2 += 6} # Win
        'Y'  {$score2 += 3} # Draw
        'X' {$score2 += 0} # Loss
    }

    switch($me) {
        'rock' {$score2 += 1} # Rock
        'paper' {$score2 += 2} # Paper
        'scissors' {$score2 += 3} # Scissors
    }
}
    
write $score2;