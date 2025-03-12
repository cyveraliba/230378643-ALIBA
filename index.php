<?php

echo "<h2>Exercise 1: Variables and Operators</h2>";
$a = 15;
$b = 7;

echo "Sum: " . ($a + $b) . "<br>";
echo "Difference: " . ($a - $b) . "<br>";
echo "Product: " . ($a * $b) . "<br>";
echo "Quotient: " . ($a / $b) . "<br>";

echo "<h2>Exercise 2: Conditional Statements</h2>";

$number = 10;

if ($number % 2 == 0) {
    echo "$number is Even<br>";
} else {
    echo "$number is Odd<br>";
}

if ($number > 0) {
    echo "$number is Positive<br>";
} elseif ($number < 0) {
    echo "$number is Negative<br>";
} else {
    echo "$number is Zero<br>";
}

echo "<h2>Exercise 3: Loops</h2>";

echo "<strong>FizzBuzz:</strong><br>";
for ($i = 1; $i <= 100; $i++) {
    if ($i % 3 == 0 && $i % 5 == 0) {
        echo "FizzBuzz<br>";
    } elseif ($i % 3 == 0) {
        echo "Fizz<br>";
    } elseif ($i % 5 == 0) {
        echo "Buzz<br>";
    } else {
        echo "$i<br>";
    }
}

echo "<br><strong>Even Fibonacci Sequence (First 10 numbers):</strong><br>";
$fib1 = 0;
$fib2 = 1;
for ($i = 0; $i < 10; $i++) {
    $fib = $fib1 + $fib2;
    if ($fib % 2 == 0) {
        echo "$fib<br>";
    }
    $fib1 = $fib2;
    $fib2 = $fib;
}

echo "<h2>Exercise 4: Functions</h2>";

function greet($name) {
    return "Hello, $name! Welcome!<br>";
}
echo greet("John");

function square($num) {
    return $num * $num;
}
echo "Square of 5: " . square(5) . "<br>";

echo "<h2>Exercise 5: Form Handling</h2>";
?>

<form method="post">
    <input type="text" name="user_input" placeholder="Enter something">
    <button type="submit">Submit</button>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $input = htmlspecialchars($_POST["user_input"]);
    echo "<p>You entered: $input</p>";
}
?>
