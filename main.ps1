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
$windowForm.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon('.\assets\icon.ico')
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
$lblTitleOptimize.Text='Cat: Optimization'
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
$Button.Location=New-object System.Drawing.Point(350,250)

$Button2=New-object $ButtonObject
$Button2.Text='Temporary File Clean'
$Button2.AutoSize=$true
$Button2.Font='Font,12'
$Button2.Location=New-object System.Drawing.Point(350,300)

$Button3=New-object $ButtonObject
$Button3.Text='Fix Corrupt Files'
$Button3.AutoSize=$true
$Button3.Font='Font,12'
$Button3.Location=New-object System.Drawing.Point(350,350)

$Button4=New-object $ButtonObject
$Button4.Text='Remove Edge (WILL BREAK CERTAIN APPS!)'
$Button4.AutoSize=$true
$Button4.Font='Font,12'
$Button4.Location=New-object System.Drawing.Point(350,400)

$Button5=New-object $ButtonObject
$Button5.Text='Open ChrisTitusTool (Not affiliated with me.)'
$Button5.AutoSize=$true
$Button5.Font='Font,12'
$Button5.Location=New-object System.Drawing.Point(350,450)

$Button6=New-object $ButtonObject
$Button6.Text='ICO Converter'
$Button6.AutoSize=$true
$Button6.Font='Font,12'
$Button6.Location=New-object System.Drawing.Point(350,250)
$Button6.Visible = $false

##These are Category buttons.
$Button7=New-object $ButtonObject
$Button7.Text='Miscellaneous'
$Button7.AutoSize=$true
$Button7.Font='Font,12'
$Button7.Location=New-object System.Drawing.Point(520,50)

$Button8=New-object $ButtonObject
$Button8.Text='Optimization'
$Button8.AutoSize=$true
$Button8.Font='Font,12'
$Button8.Location=New-object System.Drawing.Point(350,50)

$Button11=New-object $ButtonObject
$Button11.Text='Fixes'
$Button11.AutoSize=$true
$Button11.Font='Font,12'
$Button11.Location=New-object System.Drawing.Point(710,50)
##These are Category buttons.

$Button9=New-object $ButtonObject
$Button9.Text='Exit'
$Button9.AutoSize=$true
$Button9.Font='Font,12'
$Button9.Location=New-object System.Drawing.Point(350,550)

$Button10=New-object $ButtonObject
$Button10.Text='Service Inspector'
$Button10.AutoSize=$true
$Button10.Font='Font,12'
$Button10.Location=New-object System.Drawing.Point(350,300)
$button10.Visible = $false

$Button12=New-object $ButtonObject
$Button12.Text='Windows Installer Error 2502 + 2503 Fix'
$Button12.AutoSize=$true
$Button12.Font='Font,12'
$Button12.Location=New-object System.Drawing.Point(350,300)
$button12.Visible = $false

$Button13=New-object $ButtonObject
$Button13.Text='Task Manager'
$Button13.AutoSize=$true
$Button13.Font='Font,12'
$Button13.Location=New-object System.Drawing.Point(350,350)
$button13.Visible = $false
##all of these are required for all the Objects to appear.
$WindowForm.Controls.AddRange(@($lblTitle,$lblTitleOptimize,$lblTitleMisc))
$WindowForm.Controls.AddRange(@($Button,$Button2,$Button3,$Button4,$Button5,$Button6,$Button7,$Button8,$Button9,$Button10,$Button11,$Button12,$Button13))
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
function MiscSwi {
    $Button.Visible = $false
    $lblTitleOptimize.Visible = $false
    $lblTitleMisc.Visible = $true
    $Button2.Visible = $false
    $Button3.Visible = $false
    $Button4.Visible = $false
    $Button5.Visible = $false
    $Button6.Visible = $true
    $Button10.Visible = $true
    $button12.Visible = $false
    $Button13.Visible = $true
}
function OptiSwi {
    $Button.Visible = $true
    $lblTitleOptimize.Visible = $true
    $lblTitleMisc.Visible = $false
    $Button2.Visible = $true
    $Button3.Visible = $true
    $Button4.Visible = $true
    $Button5.Visible = $true
    $Button6.Visible = $false
    $Button10.Visible = $false
    $button12.Visible = $false
    $Button13.Visible = $false
}
function FixSwi {
    $Button.Visible = $false
    $lblTitleOptimize.Visible = $false
    $lblTitleMisc.Visible = $false
    $Button2.Visible = $false
    $Button3.Visible = $false
    $Button4.Visible = $false
    $Button5.Visible = $false
    $Button6.Visible = $false
    $Button10.Visible = $false
    $button12.Visible = $true
    $Button13.Visible = $false
}
function FixInstaller {
    Write-Host "This might crash the tool + You most likely need to open this tool in Administrator. Do you want to continue?"
    pause
    .\scripts-batches\WinInstallerErrorFix.bat
}
##code to run functions from buttons
$Button.Add_Click({runBloatRemoval})
$Button2.Add_Click({tempClean})
$Button3.Add_Click({corruptFixer})
$Button4.Add_Click({RemovEdge})
$Button5.Add_Click({OpenCTT})
$Button6.Add_Click({.\scripts-batches\ICOConvert.ps1})
$Button7.Add_Click({MiscSwi})
$Button8.Add_Click({OptiSwi})
$Button9.Add_Click({$windowForm.Close()})
$Button10.Add_Click({.\scripts-batches\ServiceInspect.ps1})
$Button11.Add_Click({FixSwi})
$Button12.Add_Click({FixInstaller})
$Button13.Add_Click({.\scripts-batches\KToolTaskMgr.ps1})
echo "Finished!"
##display the Form.
$WindowForm.ShowDialog()
##cleans up the Form.
$WindowForm.Dispose()
echo "█╬█ ███ ███ ██▄ █╬█ █╬╬█ ███ ███ █╬ █╬█ ██
██▄ █╬█ █▄╬ █▄█ █▄█ ██▄█ ╬█╬ █▄█ █╬ ██▄ █▄
█╬█ █▄█ █╬█ █▄█ ╬█╬ █╬██ ╬█╬ █╬█ ██ █╬█ ▄█"
echo "Thanks for using. Have a nice day (:"