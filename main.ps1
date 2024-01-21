Add-Type -AssemblyName System.Windows.Forms
##THIS IS FOR THE WINDOW CODE TO WORK!
echo "█╬█ ███ ███ ██▄ █╬█ █╬╬█ ███ ███ █╬ █╬█ ██
██▄ █╬█ █▄╬ █▄█ █▄█ ██▄█ ╬█╬ █▄█ █╬ ██▄ █▄
█╬█ █▄█ █╬█ █▄█ ╬█╬ █╬██ ╬█╬ █╬█ ██ █╬█ ▄█"
##all these are required for all the Objects to work properly.
echo "Loading Form Objects.."
$FormObject = [System.windows.Forms.Form]
$LabelObject = [System.windows.Forms.Label]
$ButtonObject = [System.Windows.Forms.Button]
echo "Finished!"
##the window itself.
echo "Loading Window code.."
$WindowForm=New-object $FormObject
$WindowForm.ClientSize='1000,650'
$WindowForm.Text='Korbyns Tool by: KorbynTalks'
$WindowForm.BackColor="gray"
echo "Finished!"
##all Objects.
echo "Adding elements.."
$lblTitle=New-object $LabelObject
$lblTitle.Text='Korbyns Tool'
$lblTitle.AutoSize=$true
$lblTitle.Font='Font,13'
$lblTitle.Location=New-object System.Drawing.Point(20,20)

$lblTitleOptimize=New-object $LabelObject
$lblTitleOptimize.Text='Cat: Optimize'
$lblTitleOptimize.AutoSize=$true
$lblTitleOptimize.Font='Font,13'
$lblTitleOptimize.Location=New-object System.Drawing.Point(20,60)

$lblTitleMisc=New-object $LabelObject
$lblTitleMisc.Text='Cat: Miscellaneous'
$lblTitleMisc.AutoSize=$true
$lblTitleMisc.Font='Font,13'
$lblTitleMisc.Location=New-object System.Drawing.Point(20,60)
$lblTitleMisc.Visible = $false

$Button=New-object $ButtonObject
$Button.Text='Remove Useless Apps (Bloat)'
$Button.AutoSize=$true
$Button.Font='Font,12'
$Button.Location=New-object System.Drawing.Point(350,50)

$Button2=New-object $ButtonObject
$Button2.Text='Temporary File Clean'
$Button2.AutoSize=$true
$Button2.Font='Font,12'
$Button2.Location=New-object System.Drawing.Point(350,100)

$Button3=New-object $ButtonObject
$Button3.Text='Fix Corrupt Files'
$Button3.AutoSize=$true
$Button3.Font='Font,12'
$Button3.Location=New-object System.Drawing.Point(350,150)

$Button4=New-object $ButtonObject
$Button4.Text='Remove Edge (WILL BREAK CERTAIN APPS!)'
$Button4.AutoSize=$true
$Button4.Font='Font,12'
$Button4.Location=New-object System.Drawing.Point(350,200)

$Button5=New-object $ButtonObject
$Button5.Text='Open ChrisTitusTool (Not affiliated with me.)'
$Button5.AutoSize=$true
$Button5.Font='Font,12'
$Button5.Location=New-object System.Drawing.Point(350,250)

$Button6=New-object $ButtonObject
$Button6.Text='Convert PNG to ICO'
$Button6.AutoSize=$true
$Button6.Font='Font,12'
$Button6.Location=New-object System.Drawing.Point(350,50)
$button6.Visible = $false

$Button7=New-object $ButtonObject
$Button7.Text='Next Page'
$Button7.AutoSize=$true
$Button7.Font='Font,12'
$Button7.Location=New-object System.Drawing.Point(350,350)

$Button8=New-object $ButtonObject
$Button8.Text='Last Page'
$Button8.AutoSize=$true
$Button8.Font='Font,12'
$Button8.Location=New-object System.Drawing.Point(350,350)
$Button8.Visible = $false

$Button9=New-object $ButtonObject
$Button9.Text='Exit'
$Button9.AutoSize=$true
$Button9.Font='Font,12'
$Button9.Location=New-object System.Drawing.Point(350,500)

$Button10=New-object $ButtonObject
$Button10.Text='Service Inspector'
$Button10.AutoSize=$true
$Button10.Font='Font,12'
$Button10.Location=New-object System.Drawing.Point(350,100)
$button10.Visible = $false
##all of these are required for all the Objects to appear.
$WindowForm.Controls.AddRange(@($lblTitle,$lblTitleOptimize,$lblTitleMisc))
$WindowForm.Controls.AddRange(@($Button,$Button2,$Button3,$Button4,$Button5,$Button6,$Button7,$Button8,$Button9,$Button10))
echo "Finished!"
##all functions to run tools.
echo "Loading Button Functions.."
function runBloatRemoval{ 
    Write-Host "This will mass remove alot of Applications on your computer that come preinstalled with Windows."
    Write-Host "If you are sure there are not any programs listed below that are important to you, Press any key to Continue."
    Write-Host "FOR THIS TO WORK YOU WILL NEED TO RUN POWERSHELL AS ADMINISTRATOR."
    Write-Host Microsoft.WindowsCalculator Microsoft.MSPaint Clipchamp.Clipchamp Microsoft.Windows.Photos Microsoft.ScreenSketch windowscommunicationsapps windowscamera officehub skypeapp zunemusic windowsmaps solitairecollection bingfinance zunevideo bingnews onenote people bingsports windowsphone soundrecorder
    pause
    .\scripts-batches\ApplicationRemover.ps1
}
function tempClean{ 
    Write-Host "If you are not running Powershell as administrator this will not remove all Temp files as there are some in protected directories. Press any key to Continue."
    pause
    .\scripts-batches\TempClean.bat
}
function corruptFixer{ 
    Write-Host "FOR THIS TO WORK YOU WILL NEED TO RUN POWERSHELL AS ADMINISTRATOR."
    pause
    .\scripts-batches\CorruptFixer.bat
}
function RemovEdge{ 
    Write-Host "Removing Edge can break certain apps that use WebView2. Press any Key to continue?"
    Write-Host "FOR THIS TO WORK YOU WILL NEED TO RUN POWERSHELL AS ADMINISTRATOR."
    pause
    .\scripts-batches\removeedge.bat
}
function OpenCTT{ 
    Write-Host "This tool is not affiliated with PC Optimizer in any way. This is just a tool I want to include because I use it and its pretty cool, not only that but because this is basically inspired by it. So I have to put credit here somewhere, If you would like to open it press any key to Continue."
    pause
    .\scripts-batches\CTTTool.ps1
}
function ConvertTo-Icon { 
    <#
        .NOTE
        This function is created by the CTT Team.
    
        .DESCRIPTION
        This function will convert PNG to ICO file

        .EXAMPLE
        ConvertTo-Icon -bitmapPath "$env:TEMP\cttlogo.png" -iconPath $iconPath
    #>
    param( [Parameter(Mandatory=$true)] 
        $bitmapPath, 
        $iconPath = "$env:temp\newicon.ico"
    ) 
    
    Add-Type -AssemblyName System.Drawing 
    
    if (Test-Path $bitmapPath) { 
        $b = [System.Drawing.Bitmap]::FromFile($bitmapPath) 
        $icon = [System.Drawing.Icon]::FromHandle($b.GetHicon()) 
        $file = New-Object System.IO.FileStream($iconPath, 'OpenOrCreate') 
        $icon.Save($file) 
        $file.Close() 
        $icon.Dispose() 
        #explorer "/SELECT,$iconpath" 
    } 
    else { Write-Warning "$BitmapPath does not exist" } 
}
function NxtPge {
    $Button.Visible = $false
    $lblTitleOptimize.Visible = $false
    $lblTitleMisc.Visible = $true
    $Button2.Visible = $false
    $Button3.Visible = $false
    $Button4.Visible = $false
    $Button5.Visible = $false
    $Button6.Visible = $true
    $Button7.Visible = $false
    $Button8.Visible = $true
    $Button10.Visible = $true
}
function LstPge {
    $Button.Visible = $true
    $lblTitleOptimize.Visible = $true
    $lblTitleMisc.Visible = $false
    $Button2.Visible = $true
    $Button3.Visible = $true
    $Button4.Visible = $true
    $Button5.Visible = $true
    $Button6.Visible = $false
    $Button7.Visible = $true
    $Button8.Visible = $false
    $Button10.Visible = $false
}
function ExitApp { 
    $windowForm.Close()
}
function OpenServInspect {
    .\scripts-batches\ServiceInspect.ps1
}
##code to run functions from buttons
$Button.Add_Click({runBloatRemoval})
$Button2.Add_Click({tempClean})
$Button3.Add_Click({corruptFixer})
$Button4.Add_Click({RemovEdge})
$Button5.Add_Click({OpenCTT})
$Button6.Add_Click({ConvertTo-Icon})
$Button7.Add_Click({NxtPge})
$Button8.Add_Click({LstPge})
$Button9.Add_Click({ExitApp})
$Button10.Add_Click({OpenServInspect})
echo "Finished!"
##display the Form.
$WindowForm.ShowDialog()
##cleans up the Form.
$WindowForm.Dispose()
echo "█╬█ ███ ███ ██▄ █╬█ █╬╬█ ███ ███ █╬ █╬█ ██
██▄ █╬█ █▄╬ █▄█ █▄█ ██▄█ ╬█╬ █▄█ █╬ ██▄ █▄
█╬█ █▄█ █╬█ █▄█ ╬█╬ █╬██ ╬█╬ █╬█ ██ █╬█ ▄█"
echo "Thanks for using. Have a nice day (:"