Add-Type -AssemblyName System.Windows.Forms

### CUSTOM DIALOGBOXES
function Show-SimpleTextBox {
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message
    )
    $Form = New-Object System.Windows.Forms.Form
    $Form.Text = $title
    $Form.FormBorderStyle = 'FixedSingle'
    $Form.MaximizeBox = $false
    $Form.Size = New-Object System.Drawing.Size(500, 300)
    $Form.StartPosition = 'CenterScreen'
    
    $Label = New-Object System.Windows.Forms.Label
    $Label.Location = New-Object System.Drawing.Point(10, 20)
    $Label.Text = $message
    $Label.TextAlign = 'MiddleCenter'
    $Label.Dock = 'Fill'
    $Label.Font = New-Object System.Drawing.Font("Arial", 12)
    
    $Form.Controls.Add($Label)
    
    $Form.ShowDialog()
}
function Show-TextBoxDialog {
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message,

        [string]$defaultlabel,

        [string]$buttonlabel = "Aceptar"
    )

    $Form = New-Object System.Windows.Forms.Form
    $Form.Text = $title
    $Form.FormBorderStyle = 'FixedSingle'
    $Form.MaximizeBox = $false
    $Form.Size = New-Object System.Drawing.Size(500, 300)
    $Form.StartPosition = 'CenterScreen'
    
    $LabelTop = New-Object System.Windows.Forms.Label
    $LabelTop.Location = New-Object System.Drawing.Point(0, 0)
    $LabelTop.Size = New-Object System.Drawing.Size(480, 180)
    $LabelTop.Text = $message
    $LabelTop.TextAlign = 'MiddleCenter'
    $LabelTop.Dock = 'Top'
    $LabelTop.Font = New-Object System.Drawing.Font("Arial", 12)
    
    $TextBox = New-Object System.Windows.Forms.TextBox
    $TextBox.Location = New-Object System.Drawing.Point(20, 220)
    $TextBox.Size = New-Object System.Drawing.Size(280, 20)
    $TextBox.Text = $defaultlabel
    $TextBox.Font = New-Object System.Drawing.Font("Arial", 12)

    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Point(320, 217)
    $Button.Size = New-Object System.Drawing.Size(130, 30)
    $Button.Text = $buttonlabel
    $Button.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $Button.Add_Click({
        $global:TextBoxValue = $TextBox.Text
    })

    $Form.Controls.Add($LabelTop)
    $Form.Controls.Add($TextBox)
    $Form.Controls.Add($Button)
    
    $Form.ShowDialog()
}
############################################
### WINDOWS DIALOGBOXES
function Show-ErrorMessage {
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message
    )

    [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
}
function Show-WarningMessage {
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message
    )

    [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
}
function Show-InformationMessage {
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message
    )

    [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
}
function Show-QuestionMessage {
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message
    )

    return [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
}