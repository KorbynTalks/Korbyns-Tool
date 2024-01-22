Add-Type -AssemblyName System.Windows.Forms ##THIS IS FOR THE WINDOW CODE TO WORK!
##all these are required for all the Objects to work properly.
echo "Loading Form Objects.."
$FormObject = [System.windows.Forms.Form]
$LabelObject = [System.windows.Forms.Label]
$ComboBoxObject = [System.windows.Forms.ComboBox]
$SelectableTextObj = [System.Windows.Forms.TextBox]
$DefaultFont='Font,10'
echo "Finished!"
##the window itself.
echo "Loading Window code.."
$WindowForm=New-object $FormObject
$WindowForm.ClientSize='700,300'
$WindowForm.Text='Korbyns Tool Service Inspector'
$WindowForm.MaximizeBox = $false
$WindowForm.MaximumSize='700,300'
$WindowForm.BackColor="white"
$WindowForm.Font=$DefaultFont
echo "Finished!"
##all Objects.
$lblService=New-object $LabelObject
$lblService.Text='Services :'
$lblService.AutoSize=$true
$lblService.Location=New-object System.Drawing.Point(20,20)

$DropDown=New-object $ComboBoxObject
$DropDown.Width='300'
$DropDown.Font='Font,13'
$DropDown.Text='Choose a Service'
$DropDown.Location=New-object System.Drawing.Point(125,20)
Get-Service | ForEach-Object {$DropDown.Items.Add($_.Name)}

$lblServiceNme=New-object $LabelObject
$lblServiceNme.Text='Readable Name :'
$lblServiceNme.AutoSize=$true
$lblServiceNme.Location=New-object System.Drawing.Point(20,80)

$lblNme=New-object $LabelObject
$lblNme.Text=''
$lblNme.AutoSize=$true
$lblNme.Location=New-object System.Drawing.Point(200,80)

$lblForStatus=New-object $LabelObject
$lblForStatus.Text='Status :'
$lblForStatus.AutoSize=$true
$lblForStatus.Location=New-object System.Drawing.Point(20,120)

$lblStatus=New-object $LabelObject
$lblStatus.Text=''
$lblStatus.AutoSize=$true
$lblStatus.Location=New-object System.Drawing.Point(200,120)

$lblStartType=New-object $LabelObject
$lblStartType.Text='Startup Type :'
$lblStartType.AutoSize=$true
$lblStartType.Location=New-object System.Drawing.Point(20,160)

$lblStartTypeInfo=New-object $LabelObject
$lblStartTypeInfo.Text=''
$lblStartTypeInfo.AutoSize=$true
$lblStartTypeInfo.Location=New-object System.Drawing.Point(200,160)

$lblExtra=New-object $SelectableTextObj
$lblExtra.Text=''
$lblExtra.Enabled = $false
$lblExtra.Width='620'
$lblExtra.AutoSize=$true
$lblExtra.Location=New-object System.Drawing.Point(20,200)

$WindowForm.Controls.AddRange(@($lblService,$lblServiceNme,$lblNme,$lblForStatus,$lblStatus,$lblExtra,$lblStartType,$lblStartTypeInfo))
$WindowForm.Controls.AddRange(@($DropDown))
function GetServiceDetails {
    $ServiceName=$DropDown.SelectedItem
    $details=Get-Service -Name $ServiceName | select *

    $lblNme.Text=$details.displayname
    $lblStatus.Text=$details.status
    $lblExtra.Text=$details
    $lblExtra.Enabled = $true
    $lblStartTypeInfo.Text=$details.StartType

    if($lblStatus.Text -eq 'Running') {
        $lblStatus.ForeColor='green'
    }else{
        $lblStatus.ForeColor='red'
    }
}
$DropDown.Add_SelectedIndexChanged({GetServiceDetails})
##display the Form.
$WindowForm.ShowDialog()
##cleans up the Form.
$WindowForm.Dispose()