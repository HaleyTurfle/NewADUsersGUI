function NewUserGUI{
    #Name
    [string]$FirstName = $FNameBox.text 
    [string]$MiddleInit = $MNameBox.text
    [string]$LastName = $LNameBox.text
    [string]$FullName = $FirstName + $MiddleInit + $LastName
    [String]$name5
    if($LastName.Length -gt 5){
        $name5 = $LastName.Substring(0,5)
    }
    else {
        $name5 = $LastName
    }    
    [String]$name2
    if($MiddleInit.Length -gt 0){
        $name2 = $MiddleInit.Substring(0,1) + $LastName.Substring(0,1)
    }
    else{
        $name2 = $LastName.Substring(0,1)
    }

    #5-2-1
    [string]$EmployeeID = $name5 + $name2 + "1"
    $521NameBox.text = $EmployeeID

    #Phone Number
    [string]$PhoneNum = $PhoneBox.text

    #Email
    [string]$Email = $EmailNameBox.text

    #Home Folder
    [string]$HomeFolder = $HFolderNameBox.text

    #Description
    [string]$Description = $DescNameBox.text

    #Job Title
    [string]$Title = $JobTBox.text

    #Job description
    [string]$Department = $DeptBox.text

    #Job manager
    [ADUser]$Manager = $ManNameBox.ADUser

    #Company
    [string]$Company = $CompNameBox.text

    #Mailstop
    [string]$MailStop = $MailBox.text


    New-ADUser -Name $FullName -EmployeeID $EmployeeID -OfficePhone $PhoneNum -EmailAddress $Email -HomeDrive $HomeFolder -Description $Description `
    -Title $Title -Department $Department -Manager $Manager -Company $Company -PostalCode $MailStop 
}


############################################################ General GUI #########################################################################

Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Active Directory User'
$main_form.BackColor = 'whitesmoke'
$main_form.AutoSize = $true
    
    #Tab Control Info - 
    $tabControl = New-Object System.Windows.Forms.TabControl
    $tabControl.DataBindings.DefaultDataSourceUpdateMode = 0
    $tabControl.BackColor = 'white'
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 5
    $System_Drawing_Point.Y = 10
    $tabControl.Location = $System_Drawing_Point
    $tabControl.Name = "tabControl"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 405
    $System_Drawing_Size.Height = 475
    $tabControl.Size = $System_Drawing_Size
    $main_form.Controls.Add($tabControl)

    ############################################################ Account Page #########################################################################

    $AcctPage = New-Object System.Windows.Forms.TabPage
    $AcctPage.DataBindings.DefaultDataSourceUpdateMode = 0
    $AcctPage.BackColor = 'white'
    $AcctPage.UseVisualStyleBackColor = $True
    $AcctPage.Text = "Account"
    $System_Drawing_Point.X = 15
    $System_Drawing_Point.Y = 75
    $AcctPage.Location = $System_Drawing_Point
    $System_Drawing_Size.Width = 405
    $System_Drawing_Size.Height = 475
    $AcctPage.Size = $System_Drawing_Size
    $AcctPage.AutoSize = $true
    $tabControl.Controls.Add($AcctPage)

        ####################################### User GroupBox #######################################

        #Image - 
        $image = [System.Drawing.Image]::Fromfile('C:\Users\turflhj1\Profile-512.png')
        $pictureBox = new-object Windows.Forms.PictureBox
        $pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
        $picturebox.width = 35
        $picturebox.height = 35
        $System_Drawing_Point.X = 30
        $System_Drawing_Point.Y = 20
        $pictureBox.Location= $System_Drawing_Point
        $pictureBox.Image=$image
        $AcctPage.Controls.Add($pictureBox) 

        ####################################### Account GroupBox #######################################

        $NameGroupBox = New-Object System.Windows.Forms.GroupBox
        $NameGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
        $System_Drawing_Point.X = 5
        $System_Drawing_Point.Y = 75
        $NameGroupBox.Location = $System_Drawing_Point
        $System_Drawing_Size.Width = 387
        $System_Drawing_Size.Height = 130
        $NameGroupBox.Size = $System_Drawing_Size
        $NameGroupBox.AutoSize = $true
        $NameGroupBox.Text = "Name"
        $AcctPage.Controls.Add($NameGroupBox)

            #First Name -
            #Label - 
            $FNameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 30
            $FNameLabel.Location  = $System_Drawing_Point
            $FNameLabel.AutoSize = $true
            $FNameLabel.Text = "First:"
            $NameGroupBox.Controls.Add($FNameLabel)
            #TextBox - 
            $FNameBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 28
            $FNameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 195
            $System_Drawing_Size.Height = 15
            $FNameBox.Size = $System_Drawing_Size
            $NameGroupBox.Controls.Add($FNameBox)

            #M.I. Name -
            #Label - 
            $MNameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 290
            $System_Drawing_Point.Y = 30
            $MNameLabel.Location  = $System_Drawing_Point
            $MNameLabel.AutoSize = $true
            $MNameLabel.Text = "M.I.:"
            $NameGroupBox.Controls.Add($MNameLabel)
            #TextBox - 
            $MNameBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 320
            $System_Drawing_Point.Y = 28
            $MNameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 45
            $System_Drawing_Size.Height = 15
            $MNameBox.Size = $System_Drawing_Size
            $NameGroupBox.Controls.Add($MNameBox)

            #Last Name - 
            #Label - 
            $LNameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 60
            $LNameLabel.Location  = $System_Drawing_Point
            $LNameLabel.AutoSize = $true
            $LNameLabel.Text = "Last:"
            $NameGroupBox.Controls.Add($LNameLabel)
            #TextBox - 
            $LNameBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 58
            $LNameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $LNameBox.Size = $System_Drawing_Size
            $NameGroupBox.Controls.Add($LNameBox)

            #Display Name - 
            #Label - 
            $FullNameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 90
            $FullNameLabel.Location  = $System_Drawing_Point
            $FullNameLabel.AutoSize = $true
            $FullNameLabel.Text = "Display:"
            $NameGroupBox.Controls.Add($FullNameLabel)
            #TextBox - 
            $FullNameBox = New-Object System.Windows.Forms.TextBox
            $FullNameBox.Text = $FullName
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 88
            $FullNameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $FullNameBox.Size = $System_Drawing_Size
            $NameGroupBox.Controls.Add($FullNameBox)

        ####################################### Account GroupBox #######################################

        $AcctGroupBox = New-Object System.Windows.Forms.GroupBox
        $AcctGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
        $System_Drawing_Point.X = 5
        $System_Drawing_Point.Y = 220
        $AcctGroupBox.Location = $System_Drawing_Point
        $System_Drawing_Size.Width = 387
        $System_Drawing_Size.Height = 130
        $AcctGroupBox.Size = $System_Drawing_Size
        $AcctGroupBox.AutoSize = $true
        $AcctGroupBox.Text = "User Account"
        $AcctPage.Controls.Add($AcctGroupBox)    

            #5-2-1 -
            #Label - 
            $521NameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 30
            $521NameLabel.Location  = $System_Drawing_Point
            $521NameLabel.AutoSize = $true
            $521NameLabel.Text = "5-2-1:"
            $AcctGroupBox.Controls.Add($521NameLabel)
            #TextBox -
            $521NameBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 28
            $521NameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 100
            $System_Drawing_Size.Height = 15
            $521NameBox.Size = $System_Drawing_Size
            $AcctGroupBox.Controls.Add($521NameBox)

            #Phone Number - 
            #Label - 
            $PhoneLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 60
            $PhoneLabel.Location  = $System_Drawing_Point
            $PhoneLabel.AutoSize = $true
            $PhoneLabel.Text = "Phone:"
            $AcctGroupBox.Controls.Add($PhoneLabel)
            #TextBox -
            $PhoneBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 58
            $PhoneBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $PhoneBox.Size = $System_Drawing_Size
            $AcctGroupBox.Controls.Add($PhoneBox)

            #Email - 
            #Label - 
            $EmailNameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 90
            $EmailNameLabel.Location  = $System_Drawing_Point
            $EmailNameLabel.AutoSize = $true
            $EmailNameLabel.Text = "Email:"
            $AcctGroupBox.Controls.Add($EmailNameLabel)
            #TextBox -
            $EmailNameBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 88
            $EmailNameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $EmailNameBox.Size = $System_Drawing_Size
            $AcctGroupBox.Controls.Add($EmailNameBox)
            
            #Home Folder -
            #Label - 
            $HFolderNameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 120
            $HFolderNameLabel.Location  = $System_Drawing_Point
            $HFolderNameLabel.AutoSize = $true
            $HFolderNameLabel.Text = "Home Folder:"
            $AcctGroupBox.Controls.Add($HFolderNameLabel)
            #TextBox -
            $HFolderNameBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 118
            $HfolderNameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $HFolderNameBox.Size = $System_Drawing_Size
            $AcctGroupBox.Controls.Add($HFolderNameBox)

            #Description - 
            #Label - 
            $DescNameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 150
            $DescNameLabel.Location  = $System_Drawing_Point
            $DescNameLabel.AutoSize = $true
            $DescNameLabel.Text = "Description:"
            $AcctGroupBox.Controls.Add($DescNameLabel)
            #TextBox -
            $DescNameBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 148
            $DescNameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $DescNameBox.Size = $System_Drawing_Size
            $AcctGroupBox.Controls.Add($DescNameBox)

 ############################################################ Profile Page #########################################################################

    $ProfPage = New-Object System.Windows.Forms.TabPage
    $ProfPage.DataBindings.DefaultDataSourceUpdateMode = 0
    $ProfPage.BackColor = 'white'
    $ProfPage.UseVisualStyleBackColor = $True
    $ProfPage.Text = "Proflie"
    $System_Drawing_Point.X = 15
    $System_Drawing_Point.Y = 70
    $ProfPage.Location = $System_Drawing_Point
    $System_Drawing_Size.Width = 405
    $System_Drawing_Size.Height = 475
    $ProfPage.Size = $System_Drawing_Size
    $ProfPage.AutoSize = $true
    $tabControl.Controls.Add($ProfPage)

        ####################################### Profile GroupBox #######################################

        $ProfGroupBox = New-Object System.Windows.Forms.GroupBox
        $ProfGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
        $System_Drawing_Point.X = 5
        $System_Drawing_Point.Y = 10
        $ProfGroupBox.Location = $System_Drawing_Point
        $System_Drawing_Size.Width = 387
        $System_Drawing_Size.Height = 190
        $ProfGroupBox.Size = $System_Drawing_Size
        $ProfGroupBox.AutoSize = $true
        $ProfGroupBox.Text = "User Profile"
        $ProfPage.Controls.Add($ProfGroupBox)    

            #Job Title -
            #Label - 
            $JobTLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 30
            $JobTLabel.Location  = $System_Drawing_Point
            $JobTLabel.AutoSize = $true
            $JobTLabel.Text = "Job Title:"
            $ProfGroupBox.Controls.Add($JobTLabel)
            #TextBox -
            $JobTBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 28
            $JobTBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $JobTBox.Size = $System_Drawing_Size
            $ProfGroupBox.Controls.Add($JobTBox)

            #Department -
            #Label - 
            $DeptLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 60
            $DeptLabel.Location  = $System_Drawing_Point
            $DeptLabel.AutoSize = $true
            $DeptLabel.Text = "Department:"
            $ProfGroupBox.Controls.Add($DeptLabel)
            #TextBox -
            $DeptBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 58
            $DeptBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $DeptBox.Size = $System_Drawing_Size
            $ProfGroupBox.Controls.Add($DeptBox)

            #Company -
            #Label - 
            $CompNameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 120
            $CompNameLabel.Location  = $System_Drawing_Point
            $CompNameLabel.AutoSize = $true
            $CompNameLabel.Text = "Company:"
            $ProfGroupBox.Controls.Add($CompNameLabel)
            #TextBox -
            $CompNameBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 118
            $CompNameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $CompNameBox.Size = $System_Drawing_Size
            $ProfGroupBox.Controls.Add($CompNameBox)

            #Manager -
            #Label - 
            $ManNameLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 90
            $ManNameLabel.Location  = $System_Drawing_Point
            $ManNameLabel.AutoSize = $true
            $ManNameLabel.Text = "Manager:"
            $ProfGroupBox.Controls.Add($ManNameLabel)
            #TextBox -
            $ManNameBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 88
            $ManNameBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $ManNameBox.Size = $System_Drawing_Size
            $ProfGroupBox.Controls.Add($ManNameBox)

            #Mailstop -
            #Label - 
            $MailLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 150
            $MailLabel.Location  = $System_Drawing_Point
            $MailLabel.AutoSize = $true
            $MailLabel.Text = "Mailstop:"
            $ProfGroupBox.Controls.Add($MailLabel)
            #TextBox -
            $MailBox = New-Object System.Windows.Forms.TextBox
            $System_Drawing_Point.X = 90
            $System_Drawing_Point.Y = 148
            $MailBox.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 275
            $System_Drawing_Size.Height = 15
            $MailBox.Size = $System_Drawing_Size
            $ProfGroupBox.Controls.Add($MailBox)

        ####################################### Member Of GroupBox #######################################

        $MemGroupBox = New-Object System.Windows.Forms.GroupBox
        $MemGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
        $System_Drawing_Point.X = 5
        $System_Drawing_Point.Y = 210
        $MemGroupBox.Location = $System_Drawing_Point
        $System_Drawing_Size.Width = 387
        $System_Drawing_Size.Height = 225
        $MemGroupBox.Size = $System_Drawing_Size
        $MemGroupBox.AutoSize = $true
        $MemGroupBox.Text = "Member Of"
        $ProfPage.Controls.Add($MemGroupBox)

 ############################################################ Organization Page #########################################################################

    $OrgPage = New-Object System.Windows.Forms.TabPage
    $OrgPage.DataBindings.DefaultDataSourceUpdateMode = 0
    $OrgPage.BackColor = 'white'
    $OrgPage.UseVisualStyleBackColor = $True
    $OrgPage.Text = "Organization"
    $System_Drawing_Point.X = 15
    $System_Drawing_Point.Y = 70
    $OrgPage.Location = $System_Drawing_Point
    $System_Drawing_Size.Width = 405
    $System_Drawing_Size.Height = 475
    $OrgPage.Size = $System_Drawing_Size
    $OrgPage.AutoSize = $true
    $tabControl.Controls.Add($OrgPage)

         ####################################### Environment GroupBox #######################################

        $EnvGroupBox = New-Object System.Windows.Forms.GroupBox
        $EnvGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
        $System_Drawing_Point.X = 5
        $System_Drawing_Point.Y = 10
        $EnvGroupBox.Location = $System_Drawing_Point
        $System_Drawing_Size.Width = 387
        $System_Drawing_Size.Height = 80
        $EnvGroupBox.Size = $System_Drawing_Size
        $EnvGroupBox.AutoSize = $true
        $EnvGroupBox.Text = "Environment"
        $OrgPage.Controls.Add($EnvGroupBox)

            #Environment info -
            #Label - 
            $EnvLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 20
            $EnvLabel.Location  = $System_Drawing_Point
            $EnvLabel.AutoSize = $true
            $EnvLabel.Text = "Configure Remote Desktop Services startup enviroment."
            $EnvGroupBox.Controls.Add($EnvLabel)

                #Client Devices - 
                #Label - 
                $ClientLabel = New-Object System.Windows.Forms.Label
                $System_Drawing_Point.X = 10
                $System_Drawing_Point.Y = 45
                $ClientLabel.Location  = $System_Drawing_Point
                $ClientLabel.AutoSize = $true
                $ClientLabel.Text = "Client Devices:"
                $EnvGroupBox.Controls.Add($ClientLabel)

                #ComboBox - 
                $ClientD = New-Object System.Windows.Forms.ComboBox
                $ClientD.DataBindings.DefaultDataSourceUpdateMode = 0
                $System_Drawing_Point.X = 100
                $System_Drawing_Point.Y = 45
                $ClientD.Location = $System_Drawing_Point
                $System_Drawing_Size.Width = 180
                $System_Drawing_Size.Height = 15
                $ClientD.Size = $System_Drawing_Size
                $ClientD.AutoSize = $true
                $ClientD.Items.Add("Connect Client Devices at Logon")
                $ClientD.Items.Add("Connect Client Printers at Logon")
                $ClientD.Items.Add("Default to Main Client Computer")
                $EnvGroupBox.Controls.Add($ClientD)

        ####################################### Remote Control GroupBox #######################################

        $RemCGroupBox = New-Object System.Windows.Forms.GroupBox
        $RemCGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
        $System_Drawing_Point.X = 5
        $System_Drawing_Point.Y = 100
        $RemCGroupBox.Location = $System_Drawing_Point
        $System_Drawing_Size.Width = 387
        $System_Drawing_Size.Height = 100
        $RemCGroupBox.Size = $System_Drawing_Size
        $RemCGroupBox.AutoSize = $true
        $RemCGroupBox.Text = "Remote Control"
        $OrgPage.Controls.Add($RemCGroupBox)

            #Remote Control label-  
            $RemCLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 20
            $RemCLabel.Location  = $System_Drawing_Point
            $RemCLabel.AutoSize = $true
            $RemCLabel.Text = "Configure Remote Desktop Services remote control settings."
            $RemCGroupBox.Controls.Add($RemCLabel)
        
            #Enable Remote Control CheckBox - 
            $CheckBox1 = New-Object System.Windows.Forms.CheckBox
            $CheckBox1.DataBindings.DefaultDataSourceUpdateMode = 0
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 42
            $CheckBox1.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 10
            $System_Drawing_Size.Height = 10
            $CheckBox1.Size = $System_Drawing_Size
            $CheckBox1.AutoSize = $true
            $CheckBox1.Text = "Enable Remote Control"
            $RemCGroupBox.Controls.Add($CheckBox1)

            #User Permission CheckBox - 
            $CheckBox2 = New-Object System.Windows.Forms.CheckBox
            $CheckBox2.DataBindings.DefaultDataSourceUpdateMode = 0
            $System_Drawing_Point.X = 30
            $System_Drawing_Point.Y = 65
            $CheckBox2.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 10
            $System_Drawing_Size.Height = 10
            $CheckBox2.Size = $System_Drawing_Size
            $CheckBox2.AutoSize = $true
            $CheckBox2.Text = "Require User's Permission"
            $RemCGroupBox.Controls.Add($CheckBox2)

            #Level of control label-  
            $ControlLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 190
            $System_Drawing_Point.Y = 67
            $ControlLabel.Location  = $System_Drawing_Point
            $ControlLabel.AutoSize = $true
            $ControlLabel.Text = "Control Level:"
            $RemCGroupBox.Controls.Add($ControlLabel)

            #ComboBox - 
            $Control1 = New-Object System.Windows.Forms.ComboBox
            $Control1.DataBindings.DefaultDataSourceUpdateMode = 0
            $System_Drawing_Point.X = 270
            $System_Drawing_Point.Y = 65
            $Control1.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 105
            $System_Drawing_Size.Height = 15
            $Control1.Size = $System_Drawing_Size
            $Control1.AutoSize = $true
            $Control1.Items.Add("View User's Session")
            $Control1.Items.Add("Interact with Session")
            $RemCGroupBox.Controls.Add($Control1)

        ####################################### Sessions GroupBox #######################################
        
        $SessGroupBox = New-Object System.Windows.Forms.GroupBox
        $SessGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
        $System_Drawing_Point.X = 5
        $System_Drawing_Point.Y = 210
        $SessGroupBox.Location = $System_Drawing_Point
        $System_Drawing_Size.Width = 387
        $System_Drawing_Size.Height = 220
        $SessGroupBox.Size = $System_Drawing_Size
        $SessGroupBox.AutoSize = $true
        $SessGroupBox.Text = "Sessions"
        $OrgPage.Controls.Add($SessGroupBox)

            #Sessions info -
            #Label - 
            $SessLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 20
            $SessLabel.Location  = $System_Drawing_Point
            $SessLabel.AutoSize = $true
            $SessLabel.Text = "Set Remote Desktop Services timeout and reconnection settings."
            $SessGroupBox.Controls.Add($SessLabel)

            #Disconnected Sessions ComboBox - 
            #Label - 
            $Box1Label = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 47
            $Box1Label.Location  = $System_Drawing_Point
            $Box1Label.AutoSize = $true
            $Box1Label.Text = "End a Disconnected Session:"
            $SessGroupBox.Controls.Add($Box1Label)
            #ComboBox - 
            $ListBox1 = New-Object System.Windows.Forms.ComboBox
            $ListBox1.DataBindings.DefaultDataSourceUpdateMode = 0
            $System_Drawing_Point.X = 165
            $System_Drawing_Point.Y = 45
            $ListBox1.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 105
            $System_Drawing_Size.Height = 15
            $ListBox1.Size = $System_Drawing_Size
            $ListBox1.AutoSize = $true
            $listBox1.Items.Add('Never')
            $listBox1.Items.Add('1 Minute')
            $listBox1.Items.Add('5 Minutes')
            $listBox1.Items.Add('10 Minutes')
            $listBox1.Items.Add('15 Minutes')
            $listBox1.Items.Add('30 Minutes')
            $listBox1.Items.Add('1 Hour')
            $SessGroupBox.Controls.Add($ListBox1)

            #Active Session limit ComboBox - 
            #Label - 
            $Box2Label = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 72
            $Box2Label.Location  = $System_Drawing_Point
            $Box2Label.AutoSize = $true
            $Box2Label.Text = "Active Session Limit:"
            $SessGroupBox.Controls.Add($Box2Label)
            #ComboBox - 
            $ListBox2 = New-Object System.Windows.Forms.ComboBox
            $ListBox2.DataBindings.DefaultDataSourceUpdateMode = 0
            $System_Drawing_Point.X = 165
            $System_Drawing_Point.Y = 70
            $ListBox2.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 105
            $System_Drawing_Size.Height = 15
            $ListBox2.Size = $System_Drawing_Size
            $ListBox2.AutoSize = $true
            $listBox2.Items.Add('Never')
            $listBox2.Items.Add('1 Minute')
            $listBox2.Items.Add('5 Minutes')
            $listBox2.Items.Add('10 Minutes')
            $listBox2.Items.Add('15 Minutes')
            $listBox2.Items.Add('30 Minutes')
            $listBox2.Items.Add('1 Hour')
            $SessGroupBox.Controls.Add($ListBox2)
            
            #Idle Session limit ComboBox - 
            #Label - 
            $Box3Label = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 97
            $Box3Label.Location  = $System_Drawing_Point
            $Box3Label.AutoSize = $true
            $Box3Label.Text = "Idle Session Limit:"
            $SessGroupBox.Controls.Add($Box3Label)
            #ComboBox - 
            $ListBox3 = New-Object System.Windows.Forms.ComboBox
            $ListBox3.DataBindings.DefaultDataSourceUpdateMode = 0
            $System_Drawing_Point.X = 165
            $System_Drawing_Point.Y = 95
            $ListBox3.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 105
            $System_Drawing_Size.Height = 15
            $ListBox3.Size = $System_Drawing_Size
            $ListBox3.AutoSize = $true
            $listBox3.Items.Add('Never')
            $listBox3.Items.Add('1 Minute')
            $listBox3.Items.Add('5 Minutes')
            $listBox3.Items.Add('10 Minutes')
            $listBox3.Items.Add('15 Minutes')
            $listBox3.Items.Add('30 Minutes')
            $listBox3.Items.Add('1 Hour')
            $SessGroupBox.Controls.Add($ListBox3)

            #Session Limit label-  
            $SessLimLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 130
            $SessLimLabel.Location  = $System_Drawing_Point
            $SessLimLabel.AutoSize = $true
            $SessLimLabel.Text = "When Session Limit Reached or Connection Broken:"
            $SessGroupBox.Controls.Add($SessLimLabel)

                #Control Buttons - 
                #Disconnect button - 
                $DisSessionButton = New-Object System.Windows.Forms.RadioButton
                $DisSessionButton.DataBindings.DefaultDataSourceUpdateMode = 0
                $System_Drawing_Point.X = 285
                $System_Drawing_Point.Y = 130
                $DisSessionButton.Location = $System_Drawing_Point
                $System_Drawing_Size.Width = 10
                $System_Drawing_Size.Height = 10
                $DisSessionButton.Size = $System_Drawing_Size
                $DisSessionButton.AutoSize = $true
                $DisSessionButton.Text = "Disconnect"
                $SessGroupBox.Controls.Add($DisSessionButton)

                #Disconnect button - 
                $EndSessionButton = New-Object System.Windows.Forms.RadioButton
                $EndSessionButton.DataBindings.DefaultDataSourceUpdateMode = 0
                $System_Drawing_Point.X = 285
                $System_Drawing_Point.Y = 150
                $EndSessionButton.Location = $System_Drawing_Point
                $System_Drawing_Size.Width = 10
                $System_Drawing_Size.Height = 10
                $EndSessionButton.Size = $System_Drawing_Size
                $EndSessionButton.AutoSize = $true
                $EndSessionButton.Text = "End Session"
                $SessGroupBox.Controls.Add($EndSessionButton)

            #Allow Reconnection label-  
            $ARecLabel = New-Object System.Windows.Forms.Label
            $System_Drawing_Point.X = 10
            $System_Drawing_Point.Y = 170
            $ARecLabel.Location  = $System_Drawing_Point
            $ARecLabel.AutoSize = $true
            $ARecLabel.Text = "Allow Reconnection From:"
            $SessGroupBox.Controls.Add($ARecLabel)

                #Control Buttons - 
                #Any Client button - 
                $AnyCButton = New-Object System.Windows.Forms.RadioButton
                $AnyCButton.DataBindings.DefaultDataSourceUpdateMode = 0
                $System_Drawing_Point.X = 155
                $System_Drawing_Point.Y = 170
                $AnyCButton.Location = $System_Drawing_Point
                $System_Drawing_Size.Width = 10
                $System_Drawing_Size.Height = 10
                $AnyCButton.Size = $System_Drawing_Size
                $AnyCButton.AutoSize = $true
                $AnyCButton.Text = "Any Client"
                $SessGroupBox.Controls.Add($AnyCButton)

                #Originating Client Only button - 
                $ARecButton = New-Object System.Windows.Forms.RadioButton
                $ARecButton.DataBindings.DefaultDataSourceUpdateMode = 0
                $System_Drawing_Point.X = 155
                $System_Drawing_Point.Y = 190
                $ARecButton.Location = $System_Drawing_Point
                $System_Drawing_Size.Width = 10
                $System_Drawing_Size.Height = 10
                $ARecButton.Size = $System_Drawing_Size
                $ARecButton.AutoSize = $true
                $ARecButton.Text = "Originating Client Only"
                $SessGroupBox.Controls.Add($ARecButton)

 ############################################################ Bottom Buttons #########################################################################

        #OkButton
        $OkButton = New-Object System.Windows.Forms.Button
            $OkButton.DataBindings.DefaultDataSourceUpdateMode = 0
            $OkButton.Text = 'OK'
            $OkButton.BackColor = "gainsboro"
            $System_Drawing_Point.X = 75
            $System_Drawing_Point.Y = 490
            $OkButton.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 80
            $System_Drawing_Size.Height = 20
            $OkButton.Size = $System_Drawing_Size
            $OkButton.AutoSize = $true
            $main_form.Controls.Add($OkButton)

        #CancelButton
            $CancelButton = New-Object System.Windows.Forms.Button
            $CancelButton.DataBindings.DefaultDataSourceUpdateMode = 0
            $CancelButton.Text = 'Cancel'
            $CancelButton.BackColor = "gainsboro"
            $System_Drawing_Point.X = 160
            $System_Drawing_Point.Y = 490
            $CancelButton.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 80
            $System_Drawing_Size.Height = 20
            $CancelButton.Size = $System_Drawing_Size
            $CancelButton.AutoSize = $true
            $main_form.Controls.Add($CancelButton)
        #ApplyButton
            $ApplyButton = New-Object System.Windows.Forms.Button
            $ApplyButton.DataBindings.DefaultDataSourceUpdateMode = 0
            $ApplyButton.Text = 'Apply'
            $CancelButton.BackColor = "gainsboro"
            $System_Drawing_Point.X = 245
            $System_Drawing_Point.Y = 490
            $ApplyButton.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 80
            $System_Drawing_Size.Height = 20
            $ApplyButton.Size = $System_Drawing_Size
            $ApplyButton.AutoSize = $true
            $main_form.Controls.Add($ApplyButton)

        # Help Button
            $HelpButton = New-Object System.Windows.Forms.Button
            $HelpButton.DataBindings.DefaultDataSourceUpdateMode = 0
            $HelpButton.Text = 'Help'
            $HelpButton.BackColor = "gainsboro"
            $System_Drawing_Point.X = 330
            $System_Drawing_Point.Y = 490
            $HelpButton.Location = $System_Drawing_Point
            $System_Drawing_Size.Width = 80
            $System_Drawing_Size.Height = 20
            $HelpButton.Size = $System_Drawing_Size
            $HelpButton.AutoSize = $true
            $main_form.Controls.Add($HelpButton)

$main_form.ShowDialog()