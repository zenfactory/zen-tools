<?php

# Requires
#require_once("/home/hshirani/repo/zen-tools/zen-php-lib.php");

# Pull in standerd input arguments
$input = $_SERVER['argv']; 

# Instantiate output object / variable
$output = "";

# Remove the first element from the array
foreach ($input as $parameter => $argument)
{ 
	if ($parameter != 1)
	{
		$output .= $argument;
	}
}

print_r(urlencode($output));

# Instantiate helper class
#$zenTools = new ZenTools();

# Run sanity check on input
#if ($zenTools->sanityCheck($input))
#{
	#print_r(urlencode($input));
#}

?>
