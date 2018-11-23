#HAVE To Be Logged in as Administrator
Remove-Item C:\Kruse\18f-SVC_HOST_INFO.txt
cls
function Get-SVCHOST_COMMANDLINE_WMI_WIN32_PROCESS_Property
{
    "SVC_HOST_INFO" | Out-File C:\Kruse\SVC_HOST_INFO.txt
    (Get-Process svchost).Id | out-file c:\kruse\18f-svchost.txt
    $id_SVCHOST = get-content c:\kruse\18f-svchost.txt
    
        foreach ($JH in $id_SVCHOST)
        {
        $BB= Get-Date
        $DJ = Get-WmiObject win32_process -Filter "ProcessId = $JH"
            Write-Verbose -Message "----------------$BB----------------------" -Verbose 6>&1
            Write-Verbose -Message "----------------SVHOST ID= $JH-------------------------" -Verbose 6>&1
            $DJ.CommandLine
            Write-Verbose -Message "----------------Happy_Turkey_Day_<@:D---------------------
            " -Verbose 6>&1
        Add-Content C:\kruse\18f-SVC_HOST_INFO.txt -Value "----------------$BB----------------------", "----------------SVHOST ID= $JH-------------------------", $DJ.commandline, "----------------Happy_Turkey_Day_<@:D---------------------","-"
            Start-Sleep -Milliseconds 175
            cls
        }
}
       
cls

Get-SVCHOST_COMMANDLINE_WMI_WIN32_PROCESS_Property
notepad C:\Kruse\18f-SVC_HOST_INFO.txt
