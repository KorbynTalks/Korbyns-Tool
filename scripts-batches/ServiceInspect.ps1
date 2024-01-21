Add-Type -AssemblyName System.Windows.Forms ##THIS IS FOR THE WINDOW CODE TO WORK!
##all these are required for all the Objects to work properly.
echo "Loading Form Objects.."
$FormObject = [System.windows.Forms.Form]
$LabelObject = [System.windows.Forms.Label]
$ComboBoxObject = [System.windows.Forms.ComboBox]
$DefaultFont='Font,10'
echo "Finished!"
##the window itself.
echo "Loading Window code.."
$WindowForm=New-object $FormObject
$WindowForm.ClientSize='700,300'
$WindowForm.Text='Korbyns Tool Service Inspector'
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

$WindowForm.Controls.AddRange(@($lblService,$lblServiceNme,$lblNme,$lblForStatus,$lblStatus))
$WindowForm.Controls.AddRange(@($DropDown))
function GetServiceDetails {
    $ServiceName=$DropDown.SelectedItem
    $details=Get-Service -Name $ServiceName | select displayname,status
    $lblNme.Text=$details.displayname
    $lblStatus.Text=$details.status

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