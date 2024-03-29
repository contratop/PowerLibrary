Add-Type -AssemblyName System.Windows.Forms

if($IsWindows -eq $False){
    Write-Host "AVISO: Ejecuta esto en Windows, no es compatible con PowerShell Core Linux" -ForegroundColor Yellow
    break
}

### CUSTOM DIALOGBOXES
function Show-SimpleTextBox {
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message,

        [string]$dialogcolor = "Control"
    )
    $Form = New-Object System.Windows.Forms.Form
    $Form.Text = $title
    $Form.FormBorderStyle = 'FixedSingle'
    $Form.MaximizeBox = $false
    $Form.Size = New-Object System.Drawing.Size(500, 300)
    $Form.StartPosition = 'CenterScreen'
    $Form.BackColor = $dialogcolor
    
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

        [string]$buttonlabel = "Aceptar",

        [string]$buttoncolor = "Control",

        [string]$dialogcolor = "Control"
    )

    $Form = New-Object System.Windows.Forms.Form
    $Form.Text = $title
    $Form.FormBorderStyle = 'FixedSingle'
    $Form.MaximizeBox = $false
    $Form.Size = New-Object System.Drawing.Size(500, 300)
    $Form.StartPosition = 'CenterScreen'
    $Form.BackColor = $dialogcolor
    
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
    $Button.BackColor = $buttoncolor
    $Button.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $Button.Add_Click({
        $global:TextBoxValue = $TextBox.Text
    })

    $Form.Controls.Add($LabelTop)
    $Form.Controls.Add($TextBox)
    $Form.Controls.Add($Button)
    
    $Form.ShowDialog()
}

function Show-ComboboxDialog {
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message,

        [Parameter(Mandatory=$true)]
        [string[]]$options,

        [string]$buttonlabel = "Aceptar",

        [string]$buttoncolor = "Control",

        [string]$dialogcolor = "Control",

        [int32]$boxindex = 0,

        [int32]$maxitems = 4
    )

    $Form = New-Object System.Windows.Forms.Form
    $Form.Text = $title # CUSTOMIZABLE
    $Form.FormBorderStyle = 'FixedSingle'
    $Form.MaximizeBox = $false
    $Form.Size = New-Object System.Drawing.Size(500, 300)
    $Form.StartPosition = 'CenterScreen'
    $Form.BackColor = $dialogcolor # CUSTOMIZABLE
    
    $LabelTop = New-Object System.Windows.Forms.Label
    $LabelTop.Location = New-Object System.Drawing.Point(0, 0)
    $LabelTop.Size = New-Object System.Drawing.Size(480, 150)
    $LabelTop.Text = $message
    $LabelTop.TextAlign = 'MiddleCenter'
    $LabelTop.Dock = 'Top'
    $LabelTop.Font = New-Object System.Drawing.Font("Arial", 12)

    $ComboBox = New-Object System.Windows.Forms.ComboBox
    $ComboBox.Location = New-Object System.Drawing.Point(40, 160)
    $ComboBox.Size = New-Object System.Drawing.Size(400, 20)
    $ComboBox.Font = New-Object System.Drawing.Font("Arial", 12)
    $ComboBox.Items.AddRange($options) # CUSTOMIZABLE
    $ComboBox.SelectedIndex = $boxindex # CUSTOMIZABLE
    $ComboBox.MaxDropDownItems = $maxitems # CUSTOMIZABLE

    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Point(60, 200)
    $Button.Size = New-Object System.Drawing.Size(360, 40)
    $Button.Text = $buttonlabel
    #$Button.Dock = 'Bottom'
    $Button.BackColor = $buttoncolor # CUSTOMIZABLE
    $Button.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $Button.Add_Click({
        $global:ComboboxValue = $ComboBox.SelectedItem
    })

    $Form.Controls.Add($ComboBox)
    $Form.Controls.Add($Button)
    $Form.Controls.Add($LabelTop)
    
    $Form.ShowDialog()

}

function Show-ComboboxTextDialog{
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message,

        [Parameter(Mandatory=$true)]
        [string[]]$options,

        [string]$defaultlabel,

        [string]$buttonlabel = "Aceptar",

        [string]$buttoncolor = "Control",

        [string]$dialogcolor = "Control",

        [int32]$boxindex = 0,

        [int32]$maxitems = 4
    )

    $Form = New-Object System.Windows.Forms.Form
    $Form.Text = $title # CUSTOMIZABLE
    $Form.FormBorderStyle = 'FixedSingle'
    $Form.MaximizeBox = $false
    $Form.Size = New-Object System.Drawing.Size(500, 300)
    $Form.StartPosition = 'CenterScreen'
    $Form.BackColor = $dialogcolor # CUSTOMIZABLE
    
    $LabelTop = New-Object System.Windows.Forms.Label
    $LabelTop.Location = New-Object System.Drawing.Point(0, 0)
    $LabelTop.Size = New-Object System.Drawing.Size(480, 130)
    $LabelTop.Text = $message
    $LabelTop.TextAlign = 'MiddleCenter'
    $LabelTop.Dock = 'Top'
    $LabelTop.Font = New-Object System.Drawing.Font("Arial", 12)

    $ComboBox = New-Object System.Windows.Forms.ComboBox
    $ComboBox.Location = New-Object System.Drawing.Point(40, 140)
    $ComboBox.Size = New-Object System.Drawing.Size(400, 20)
    $ComboBox.Font = New-Object System.Drawing.Font("Arial", 12)
    $ComboBox.Items.AddRange($options) # CUSTOMIZABLE
    $ComboBox.SelectedIndex = $boxindex # CUSTOMIZABLE
    $ComboBox.MaxDropDownItems = $maxitems # CUSTOMIZABLE

    $TextBox = New-Object System.Windows.Forms.TextBox
    $TextBox.Location = New-Object System.Drawing.Point(40, 170)
    $TextBox.Size = New-Object System.Drawing.Size(400, 20)
    $TextBox.Text = $defaultlabel
    $TextBox.Font = New-Object System.Drawing.Font("Arial", 12)

    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Point(60, 200)
    $Button.Size = New-Object System.Drawing.Size(360, 40)
    $Button.Text = $buttonlabel
    #$Button.Dock = 'Bottom'
    $Button.BackColor = $buttoncolor # CUSTOMIZABLE
    $Button.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $Button.Add_Click({
        $global:ComboboxValue = $ComboBox.SelectedItem
        $global:TextBoxValue = $TextBox.Text
    })

    $Form.Controls.Add($ComboBox)
    $Form.Controls.Add($Button)
    $Form.Controls.Add($LabelTop)
    $Form.Controls.Add($TextBox)

    $Form.ShowDialog()

}

function Show-DualButtonDialog{
    param (
        [Parameter(Mandatory=$true)]
        [string]$title,

        [Parameter(Mandatory=$true)]
        [string]$message,

        [string]$dialogcolor = "Control",

        [string]$buttonlabel1 = "Aceptar",
        
        [string]$buttoncolor1 = "Control",

        [string]$buttonlabel2 = "Cancelar",

        [string]$buttoncolor2 = "Control"
    )

    $Form = New-Object System.Windows.Forms.Form
    $Form.Text = $title
    $Form.FormBorderStyle = 'FixedSingle'
    $Form.MaximizeBox = $false
    $Form.Size = New-Object System.Drawing.Size(500, 300)
    $Form.StartPosition = 'CenterScreen'
    $Form.BackColor = $dialogcolor
    
    $LabelTop = New-Object System.Windows.Forms.Label
    $LabelTop.Location = New-Object System.Drawing.Point(0, 0)
    $LabelTop.Size = New-Object System.Drawing.Size(480, 180)
    $LabelTop.Text = $message
    $LabelTop.TextAlign = 'MiddleCenter'
    $LabelTop.Dock = 'Top'
    $LabelTop.Font = New-Object System.Drawing.Font("Arial", 12)
    
    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Point(9, 190)
    $Button.Size = New-Object System.Drawing.Size(197, 59)
    $Button.Text = $buttonlabel1
    $Button.BackColor = $buttoncolor1
    $Button.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $Button.Add_Click({
        $global:ButtonValue = "1"
    })

    $Button2 = New-Object System.Windows.Forms.Button
    $Button2.Location = New-Object System.Drawing.Point(278, 190)
    $Button2.Size = New-Object System.Drawing.Size(197, 59)
    $Button2.Text = $buttonlabel2
    $Button2.BackColor = $buttoncolor2
    $Button2.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $Button2.Add_Click({
        $global:ButtonValue = "2"
    })


    $Form.Controls.Add($LabelTop)
    $Form.Controls.Add($Button)
    $Form.Controls.Add($Button2)
    
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