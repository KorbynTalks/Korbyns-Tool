Add-Type -AssemblyName System.Windows.Forms

$FormObject = [System.windows.Forms.Form]
$LabelObject = [System.windows.Forms.Label]
$ButtonObject = [System.Windows.Forms.Button]
$SelectableTextObj = [System.Windows.Forms.TextBox]


$WindowForm=New-object $FormObject
$WindowForm.ClientSize='1100,750'
$WindowForm.Text='Korbyns Tool ICO Converter'

$lblTitle=New-object $LabelObject
$lblTitle.Text='ICO Converter'
$lblTitle.AutoSize=$true
$lblTitle.Font='Font,12'
$lblTitle.Location=New-object System.Drawing.Point(20,20)

$Button=New-object $ButtonObject
$Button.Text='Convert'
$Button.AutoSize=$true
$Button.Font='Font,12'
$Button.Location=New-object System.Drawing.Point(550,520)

$lblError=New-object $LabelObject
$lblError.Text=''
$lblError.AutoSize=$true
$lblError.Font='Font,12'
$lblError.Location=New-object System.Drawing.Point(20,600)

$TextBox=New-object $SelectableTextObj
$TextBox.Font='Font,12'
$TextBox.Text='Enter Image Here'
$TextBox.Width='500'
$TextBox.Location=New-object System.Drawing.Point(20,500)


$WindowForm.Controls.AddRange(@($lblTitle,$lblError))
$WindowForm.Controls.AddRange(@($Button,$TextBox))

function ConvertTo-Icon { 
    <#
        .NOTE
        This function is created by the CTT Team.
    #>
    
    Add-Type -AssemblyName System.Drawing 
    
        $bitmapPath = $TextBox.Text
        $iconPath = "$env:temp\newicon.ico"

    if (Test-Path $bitmapPath) { 
        $b = [System.Drawing.Bitmap]::FromFile($bitmapPath) 
        $icon = [System.Drawing.Icon]::FromHandle($b.GetHicon()) 
        $file = New-Object System.IO.FileStream($iconPath, 'OpenOrCreate') 
        $icon.Save($file) 
        $lblError.Text='ICO saved successfully. Go to %Temp% directory to find it!'
        $file.Close() 
        $icon.Dispose() 
        #explorer "/SELECT,$iconpath" 
    } 
    else { $lblError.Text='The image you typed in does not exist.' } 
}

$Button.Add_Click({ConvertTo-Icon})


##display the Form.
$WindowForm.ShowDialog()
##cleans up the Form.
$WindowForm.Dispose()