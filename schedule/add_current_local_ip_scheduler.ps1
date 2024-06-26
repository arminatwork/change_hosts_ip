$taskName = "Change_Ip"
$task_path = "\ChangeIp\"

Unregister-ScheduledTask -TaskName $taskName -TaskPath $task_path -Confirm:$false

$xmlFilePath = "$pwd\Change_Ip.xml"
[xml]$xmlContent = Get-Content -Path $xmlFilePath

# $executionFile = "$pwd\add_current_local_ip.ps1"
$executionFile = Resolve-Path -Path (Join-Path -Path $pwd -ChildPath "..")

$xmlContent.Task.Actions.Exec[0].Arguments = "-Executionpolicy Bypass -File $executionFile\add_current_local_ip.ps1"
$xmlContent.Task.Actions.Exec[1].Arguments = "-File $executionFile\add_current_local_ip.ps1 -Hostname local_ip"

$xmlContent.Save($xmlFilePath)

Register-ScheduledTask -Xml $xmlContent.InnerXml -TaskName $taskName -TaskPath $task_path