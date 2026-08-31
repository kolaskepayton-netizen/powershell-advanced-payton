# LM2 Lab

# Task 1
## Original Command
Get-Process -Name explore

## Error message
Cannot find a process with the name "explore"

## Cause of error
Process name was incorrect, PS could not find a process name "explore"

## Correct command
Get-Process -Name -explorer

# Task 2
## Example of Verbose output
Created resource group 'TestRG' in location 'centralus'

## Example of debug output
[ConfigManager] Got nothing from [DisplaySecretWarning], Module = [], Cmdlet = [], Returning default value [True].

## Observed differences
Verbose: shows waht the script is currently doing
Debug: Shows extra details that help troubleshoot the script

## Task 3
Test Name: Should create a new resouce group

Expected Results: The resouce group should be created successfully in Central US

Actual Result: The test verified that the group was created successfully