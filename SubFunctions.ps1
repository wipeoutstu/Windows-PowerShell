<#
Run the script to load the function into the powershell scope (running memory)
Then use the function in the below format (the validate set and Param settings will help you with autocomplete / suggestions):

Example - Do-Math -Num1 2500 -Num2 75 -Operation Multiply
Example - Do-Math -Num1 3350 -Num2 26 -Operation Divide

#>
Function Do-Math
{
    Param (
        $Num1,
        $Num2,
        [ValidateSet("Add","Subtract","Multiply","Divide")]$Operation
        )

        Function Addition
        {
            Param($N1,$N2)
            Write-Output ($N1 + $N2)
        }
         
        Function Subtraction
        {
            Param($N1,$N2)
            Write-Output ($N1 - $N2)
        }
        
        Function Multiplication
        {
            Param($N1,$N2)
            Write-Output ($N1 * $N2)
        }
        
        Function Division
        {
            Param($N1,$N2)
            Write-Output ($N1 / $N2)
        }
               
        Switch ($Operation)
        {
            "Add" {$Data = Addition -N1 $Num1 -N2 $Num2} 
            "Subtract" {$Data = Subtraction -N1 $Num1 -N2 $Num2}
            "Multiply" {$Data = Multiplication -N1 $Num1 -N2 $Num2}
            "Divide" {$Data = Division -N1 $Num1 -N2 $Num2}
        }
        Write-Output $Data
}