<#
Run the script to load the function into the powershell scope (running memory)
Then use the function in the below format (the validate set and Param settings will help you with autocomplete / suggestions):

Example - Get-CounterData -MaxSamples 2 -SampleInterval 1
Example - Get-CounterData -MaxSamples 3 -SampleInterval 5

#>
Function Get-CounterData
{
Param (
    [parameter(Mandatory=$true)]
    [ValidateSet("Processor","Disk","Memory")]$Data,
    
    [ValidateRange(1,10)]
    [int]$MaxSamples = 1,
    
    [ValidateRange(1,10)]
    [int]$SampleInterval = 1
    )
        
    Switch ($Data)
    {
        "Processor" {$Counter = "\Processor(_total)\% Processor Time"}
        "Disk" {$Counter = "\PhysicalDisk(0*)\% Disk Time"}
        "Memory" {$Counter = "\Memory\Page Faults/sec"}
    }
    Get-Counter -Counter $Counter -MaxSamples $MaxSamples -SampleInterval $SampleInterval
}

Get-CounterData -Data 