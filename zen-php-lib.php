#!/usr/bin/php
<?php

Class ZenTools
{
	# Sanity Check
	public function sanityCheck(&$var)
	{
		# Check that variable isset and that variable is not empty
		if (!isset($var) && !empty($var))
		{
			# Return true 
			return true;
		}
	}
}

?>
