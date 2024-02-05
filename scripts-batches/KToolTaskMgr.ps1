Add-Type -AssemblyName System.Windows.Forms

$FormObject = [System.windows.Forms.Form]
$LabelObject = [System.windows.Forms.Label]
$ButtonObject = [System.Windows.Forms.Button]
$ComboBoxObject = [System.windows.Forms.ComboBox]
$SelectableTextObj = [System.Windows.Forms.TextBox]


$WindowForm=New-object $FormObject
$WindowForm.ClientSize='1300,450'
$WindowForm.Text='Korbyns Tool Task Mgr'

$lblTitle=New-object $LabelObject
$lblTitle.Text='Task Manager'
$lblTitle.AutoSize=$true
$lblTitle.Font='Font,12'
$lblTitle.Location=New-object System.Drawing.Point(20,20)

$DropDown=New-object $ComboBoxObject
$DropDown.Width='300'
$DropDown.Font='Font,13'
$DropDown.Text='Choose a Task'
$DropDown.Location=New-object System.Drawing.Point(125,60)

$lblName=New-object $LabelObject
$lblName.Text='Name'
$lblName.AutoSize=$true
$lblName.Font='Font,12'
$lblName.Location=New-object System.Drawing.Point(125,100)

$lblResp=New-object $LabelObject
$lblResp.Text='Responding'
$lblResp.AutoSize=$true
$lblResp.Font='Font,12'
$lblResp.Location=New-object System.Drawing.Point(275,140)

$lblISResp=New-object $LabelObject
$lblISResp.Text='Responding :'
$lblISResp.AutoSize=$true
$lblISResp.Font='Font,12'
$lblISResp.Location=New-object System.Drawing.Point(125,140)

$lblSettings=New-object $LabelObject
$lblSettings.Text='Settings :'
$lblSettings.AutoSize=$true
$lblSettings.Font='Font,12'
$lblSettings.Location=New-object System.Drawing.Point(125,370)

$lblExtra=New-object $SelectableTextObj
$lblExtra.Text='Extra Info'
$lblExtra.Enabled = $false
$lblExtra.Width='750'
$lblExtra.Font='Font,15'
$lblExtra.AutoSize=$true
$lblExtra.Location=New-object System.Drawing.Point(125,300)
$lblExtra.Visible=$false

$ButtonKill=New-object $ButtonObject
$ButtonKill.Text='Kill Task'
$ButtonKill.Width='100'
$ButtonKill.Location=New-object System.Drawing.Point(125,200)

$ButtonRefresh=New-object $ButtonObject
$ButtonRefresh.Text='Refresh Task List'
$ButtonRefresh.Width='160'
$ButtonRefresh.Location=New-object System.Drawing.Point(125,230)

$ButtonShowExtra=New-object $ButtonObject
$ButtonShowExtra.Text='Show Extra Info'
$ButtonShowExtra.Width='160'
$ButtonShowExtra.Location=New-object System.Drawing.Point(125,410)


$WindowForm.Controls.AddRange(@($lblTitle,$lblName,$lblExtra,$lblResp,$lblISResp,$lblSettings))
$WindowForm.Controls.AddRange(@($DropDown,$ButtonKill,$ButtonRefresh,$ButtonShowExtra))

function GetTasks {
    $processName=$DropDown.SelectedItem
    $getAllProcesses=Get-Process -Name $processName | Select *

    $lblExtra.Text=$getAllProcesses
    $lblExtra.Enabled = $true
    $lblName.Text=$getAllProcesses.ProcessName
    $lblResp.Text=$getAllProcesses.Responding
}

function StopTask {
    $processName=$DropDown.SelectedItem
    $getAllProcesses=Get-Process -Name $processName | Select *
    
    Stop-Process -Name $DropDown.SelectedItem
    Write-Host "Successfully killed task" $DropDown.SelectedItem
}

function Refresh {
  $DropDown.Items.Remove($_.Name)
  Get-Process | ForEach-Object {$DropDown.Items.Add($_.Name)}
}

$DropDown.Add_SelectedIndexChanged({GetTasks})
$ButtonKill.Add_Click({StopTask})
$ButtonRefresh.Add_Click({Refresh})
$ButtonShowExtra.Add_Click({$lblExtra.Visible=$true})

##display the Form.
$WindowForm.ShowDialog()
##cleans up the Form.
$WindowForm.Dispose()