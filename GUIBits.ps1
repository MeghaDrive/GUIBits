
<#===========================================================================================================

This script is released under the GNU GENERAL PUBLIC LICENSE Version 3.
for a full copy of the license visit: https://www.gnu.org/licenses/gpl-3.0.en.html


To do:
* Add checkboxs to form for avalible Start-Bits flags
* Build out start-bits command based on avalible flag options
* Determine how to present progress for active Bits jobs created by script.

===========================================================================================================#>


CLS

Add-Type -AssemblyName System.Windows.Forms
Import-Module BitsTransfer

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'GUIBits'
$main_form.Width = 600
$main_form.Height = 600
$main_form.AutoSize = $true

$from_button = New-Object System.Windows.Forms.Button
$from_button.Location = New-Object System.Drawing.Size (25,25)
$from_button.Size = New-Object System.Drawing.Size (100,25)
$from_button.Add_Click($from_click)
$from_button.Text = "From"

$to_button = New-Object System.Windows.Forms.Button
$to_button.Location = New-Object System.Drawing.Size (25,75)
$to_button.Size = New-Object System.Drawing.Size (100,25)
$to_button.Add_Click($to_click)
$to_button.Text = "To"

$start_button = New-Object System.Windows.Forms.Button
$start_button.Location = New-Object System.Drawing.Size (425,500)
$start_button.Size = New-Object System.Drawing.Size (120,25)
$start_button.Add_Click($start_click)
$start_button.Text = "Start Transfer"

$from_text = New-Object System.Windows.Forms.TextBox
$from_text.Location = New-Object System.Drawing.Size (150,28)
$from_text.Size = New-Object System.Drawing.Size (400,40)
$from_text.Text = "FROM"

$to_text = New-Object System.Windows.Forms.TextBox
$to_text.Location = New-Object System.Drawing.Size (150,78)
$to_text.Size = New-Object System.Drawing.Size (400,40)
$to_text.Text = "TO"

$name_text = New-Object System.Windows.Forms.TextBox
$name_text.Location = New-Object System.Drawing.Size (150,128)
$name_text.Size = New-Object System.Drawing.Size (400,40)
$name_text.Text =""

$name_label = New-Object System.Windows.Forms.Label
$name_label.Location = New-Object System.Drawing.Size (25,131)
$name_label.Size = New-Object System.Drawing.Size (150,40)
$name_label.Text ="Custom BITS job name:"

$sync_label = New-Object System.Windows.Forms.Label
$sync_label.Location = New-Object System.Drawing.Size (25,186)
$sync_label.Size = New-Object System.Drawing.Size (150,40)
$sync_label.Text ="-Asynchronous"

$sync_check = New-Object System.Windows.Forms.CheckBox
$sync_check.Location = New-Object System.Drawing.Size (110,175)
$sync_check.Size = New-Object System.Drawing.Size (150,40)
$sync_check.Checked = $false

#


$from_browser  = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$to_browser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$to_browser.InitialDirectory = [Environment]::GetFolderPath("Desktop")



$from_click = 
{
    $from_browser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
    $null = $from_browser.ShowDialog()
    $fromlocal = $from_browser.FileName
    $from_text.Text = $fromlocal
    write-host $fromlocal
}

$to_click = 
{
    $to_browser = New-Object System.Windows.Forms.FolderBrowserDialog
    $null = $to_browser.ShowDialog()
    $tolocal = $to_browser.SelectedPath
    $to_text.Text = $tolocal
    write-host $tolocal
}


$main_form.Controls.Add($from_button)
$main_form.Controls.Add($to_button)
$main_form.Controls.Add($to_text)
$main_form.Controls.Add($from_text)
$main_form.Controls.Add($name_text)
$main_form.Controls.Add($name_label)
$main_form.Controls.Add($sync_check)
$main_form.Controls.Add($sync_label)
$main_form.Controls.Add($start_button)
$main_form.ShowDialog()

