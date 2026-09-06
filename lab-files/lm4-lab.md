# LM4 Lab 

### Strengths 
1. The fuction uses parameter validation to prevent invalid resource group names.
2. It supports pipeline input, making it easier to automate.
3. It supports WhatIf and Confirm to help prevent accidental changes.

### Areas for Improvement
1. The function only supports creating resource groups by name.
2. It could provide better feedback while running.
3. It could be improved to handle multiple resource groups at once.

## Added Begin, Process, and end to the funciton.
Begin is used for startup tasks.
Process handles each project ID from the pipe
End is used for cleanup after all items go through

I tested the function with multiple IDs and it created multiple resource groups

## Process Multiple Resource Groups
Objects passed: 3
Number successfully create: 3
Any warning: none