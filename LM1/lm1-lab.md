### Issue 1: Bad Variable Name. The variable "$a" does not explain what it is used for.
### Issue 2: The String "centralus" is not in quotes which could make it harder to read in a big script.
### Issue 3: There is no error handling.

## Task 2

Purpose
Create a new Azure resource group

Parameter
The resource group name

Example
.\create-resourcegroup.ps1

## Task 3

Validation method:
ValidateLength

Valid input:
TestRG

Invalid input:
Thisisaverylongnamesodontwork

Results:
The valid input worked. The invalid input did not because it was too long.

## Task 4
Error generated:
Invalid location

Error message:
Failed to create resource group

Catch:
The catch showed the error message

Finally:
The Finally showed "Script execution completed."