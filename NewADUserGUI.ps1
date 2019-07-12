##################################################################################### Text Feilds #####################################################################################

[String]$UserName
[String]$ExtensionName
[String]$Password
[string]$FirstName
[string]$MiddleInit 
[string]$LastName 
[String]$name5
[String]$name2
#5-2-1
[string]$EmployeeID 
#Phone Number
[string]$PhoneNum 
#Email
[string]$Email 
#Home Folder
[string]$HomeFolder 
#Description
[string]$Description 
#Job Title
[string]$Title
#Job description
[string]$Department 
#Job manager
[ADUser]$Manager 
#Company
[string]$Company 
#Mailstop
[string]$MailStop

############################################################ General GUI #########################################################################

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")                                                  
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
Import-Module ActiveDirectory                                                                                                           
$GUIFont                                = [System.Drawing.Font]::new('Segoe UI', 9, [System.Drawing.FontStyle]::Regular)              #Font for main form and mult form

#Main form - 
$Icon                                   = New-Object System.Drawing.Icon ('C:\Users\turflhj1\profile_512_pm1_icon.ico')               #Icon for main form and mult form 
$main_form                              = New-Object System.Windows.Forms.Form                                                        #Main form creation and formatting
$main_form.Icon                         = $Icon
$main_form.Text                         = 'Active Directory User'
$main_form.Font                         = $GUIFont
$main_form.FormBorderStyle              = 'fixed3d'
$main_form.BackColor                    = 'whitesmoke'
$main_form.AutoSize                     = $true

#Tab Control Info - 

$tabControl                             = New-Object System.Windows.Forms.TabControl                                                  
$tabControl.Location                    = New-Object System.Drawing.Size (5,5)
$tabControl.Name                        = "tabControl"
$tabControl.Font                        = $GUIFont
$tabControl.Size                        = New-Object System.Drawing.Size (405,465)
$tabControl.DataBindings.DefaultDataSourceUpdateMode =  0
$main_form.Controls.Add($tabControl)                                                                                                #Add tab control to main form

############################################################ Account Page #########################################################################

$AcctPage                               = New-Object System.Windows.Forms.TabPage                                                     
$AcctPage.Dock                          = 'bottom'
$AcctPage.Text                          = "Account"
$AcctPage.Font                          = $GUIFont
$AcctPage.Name                          = 'Account'
$AcctPage.Location                      = New-Object System.Drawing.Size (15,75)
$AcctPage.Size                          = New-Object System.Drawing.Size (405,475)
$AcctPage.AutoSize                      = $true
$AcctPage.DataBindings.DefaultDataSourceUpdateMode = 0
$tabControl.Controls.Add($AcctPage)                                                                                                 #Add "Account" page to tab control (in main form)

    ####################################### User Image #######################################

    #Image - 
    $image                                  = [System.Drawing.Image]::Fromfile('C:\Users\turflhj1\Profile-512.png')                   
    $pictureBox                             = new-object Windows.Forms.PictureBox
    $pictureBox.SizeMode                    = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
    $pictureBox.Size                        = New-Object System.Drawing.Size (35,35)
    $pictureBox.Location                    = New-Object System.Drawing.Size (30,18)
    $pictureBox.Image                       = $image
    $AcctPage.Controls.Add($pictureBox)                                                                                             #Add user image to Account age (in main form)

    ####################################### Name GroupBox #######################################

    $NameGroupBox                           = New-Object System.Windows.Forms.GroupBox                                                
    $NameGroupBox.Location                  = New-Object System.Drawing.Size (5,70)
    $NameGroupBox.Size                      = New-Object System.Drawing.Size (387,100)
    $NameGroupBox.AutoSize                  = $true
    $NameGroupBox.Text                      = "Name"
    $NameGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $AcctPage.Controls.Add($NameGroupBox)                                                                                           #Add "Name" group box to Account page (in main form)

        ################ First Name ################

        #Label - 
        $FNameLabel                             = New-Object System.Windows.Forms.Label                                               
        $FNameLabel.Location                    = New-Object System.Drawing.Size (10,30)
        $FNameLabel.AutoSize                    = $true
        $FNameLabel.Text                        = "First "
        $NameGroupBox.Controls.Add($FNameLabel)                                                                                     #Add "first name" label to name group box (on account page)
        
        #TextBox - 
        $FNameBox                               = New-Object System.Windows.Forms.TextBox                                             
        $FNameBox.BorderStyle                   = 'FixedSingle'
        $FNameBox.Location                      = New-Object System.Drawing.Size (90,28)
        $FNameBox.Size                          = New-Object System.Drawing.Size (195,10)
        $NameGroupBox.Controls.Add($FNameBox)                                                                                       #Add "first name" text box to name group box (on account page)

        ################ Middle Name ################

        #Label - 
        $MNameLabel                             = New-Object System.Windows.Forms.Label                                                  
        $MNameLabel.Location                    = New-Object System.Drawing.Size (295,30)
        $MNameLabel.AutoSize                    = $true
        $MNameLabel.Text                        = "M.I. "
        $NameGroupBox.Controls.Add($MNameLabel)                                                                                     #Add "middle initial" label to name group box (on account page)

        #TextBox - 
        $MNameBox                               = New-Object System.Windows.Forms.TextBox                                           #only 1 char should be put in this text box
        $MNameBox.BorderStyle                   = 'FixedSingle'
        $MNameBox.Location                      = New-Object System.Drawing.Size (330,28)
        $MNameBox.Size                          = New-Object System.Drawing.Size (35,10)
        $NameGroupBox.Controls.Add($MNameBox)                                                                                       #Add "middle initial" text box to name group box (on account page)

        ################ Last Name ################

        #Label - 
        $LNameLabel                             = New-Object System.Windows.Forms.Label                                               
        $LNameLabel.Location                    = New-Object System.Drawing.Size (10,60)
        $LNameLabel.AutoSize                    = $true
        $LNameLabel.Text                        = "Last "
        $NameGroupBox.Controls.Add($LNameLabel)                                                                                     #Add "last name" label to name group box (on account page)

        #TextBox - 
        $LNameBox                               = New-Object System.Windows.Forms.TextBox                                             
        $LNameBox.BorderStyle                   = 'FixedSingle'
        $LNameBox.Location                      = New-Object System.Drawing.Size (90,58)
        $LNameBox.Size                          = New-Object System.Drawing.Size (275,10)
        $NameGroupBox.Controls.Add($LNameBox)                                                                                       #Add "last name" text box to name group box (on account page)

        ################ Multiple User Creation Button ################

        $MultButton                             = New-Object System.Windows.Forms.Button                                                                               
        $MultButton.Text                        = 'Create Multiple Users'
        $MultButton.FlatStyle                   = 'flat'
        $MultButton.BackColor                   = "white"
        $MultButton.Location                    = New-Object System.Drawing.Size(135,179)
        $MultButton.Size                        = New-Object System.Drawing.Size(120,12)
        $MultButton.AutoSize                    = $true
        $MultButton.FlatAppearance.BorderColor  = 'lightgray'
        $MultButton.DataBindings.DefaultDataSourceUpdateMode = 0
        $AcctPage.Controls.Add($MultButton)                                                                                         #Add "multiple user creation" button to account page (in main form)

    ################################################################ Multiple Account Creation Form ################################################################

    $MultButton.Add_Click({                                                                                                         #Add click for "multiple user creation" button
        $mult_form                              = New-Object System.Windows.Forms.Form                                              #Multiple user creation (mult form) form creation
        $mult_form.Icon                         = $Icon
        $mult_form.Text                         = 'Multiple User Creation'
        $mult_form.Font                         = $GUIFont
        $mult_form.FormBorderStyle              = 'fixed3d'
        $mult_form.BackColor                    = 'whitesmoke'
        $mult_form.AutoSize                     = $true
        $mult_form.Size                         = New-Object System.Drawing.Size (410,265)

        #Image - 
        $multimage                              = [System.Drawing.Image]::Fromfile('C:\Users\turflhj1\group-users.png')
        $multpictureBox                         = new-object Windows.Forms.PictureBox
        $multpictureBox.SizeMode                = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
        $multpictureBox.Size                    = New-Object System.Drawing.Size (75,55)
        $multpictureBox.Location                = New-Object System.Drawing.Size (175,5)
        $multpictureBox.Image                   = $multimage
        $mult_form.Controls.Add($multpictureBox)                                                                                    #Add multiple users graphic image to mult form 

        ####################################### Import GroupBox #######################################

        $multGroupBox                           = New-Object System.Windows.Forms.GroupBox
        $multGroupBox.Location                  = New-Object System.Drawing.Size (5,60)
        $multGroupBox.Size                      = New-Object System.Drawing.Size (400,140)
        $multGroupBox.AutoSize                  = $true
        $multGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
        $mult_form.Controls.Add($multGroupBox)                                                                                      #Add "mult" group box to mult form (only group box on form )

        #Label - 
        $multformlabel                          = New-Object System.Windows.Forms.Label
        $multformlabel.text                     = "Create multiple Active Directory users at once by importing a CSV file."
        $multformlabel.Location                 = New-Object System.Drawing.Size(15,23)
        $multformlabel.Size                     = New-Object System.Drawing.Size (375,15)
        $multformlabel.AutoSize                 = $true
        $multGroupBox.Controls.Add($multformlabel)                                                                                  #Add label to display info about form to mult group box (on mult form)

        ########################## Import CSV ##########################

            #TextBox - 
            $multBox                                = New-Object System.Windows.Forms.TextBox
            $multBox.text                           = $usersfile
            $multBox.BorderStyle                    = 'FixedSingle'
            $multBox.Location                       = New-Object System.Drawing.Size (90,60)
            $multBox.Size                           = New-Object System.Drawing.Size (305,12)
            $multGroupBox.Controls.Add($multBox)                                                                                    #Add text box to mult group box (on mult form) - contains link to CSV file

            ################ Choose Button ################

            #Button - 
            $MultButton                             = New-Object System.Windows.Forms.Button
            $MultButton.Text                        = 'Choose'
            $MultButton.FlatStyle                   = 'flat'
            $MultButton.BackColor                   = "white"
            $MultButton.Location                    = New-Object System.Drawing.Size(10,57)
            $MultButton.Size                        = New-Object System.Drawing.Size(75,12)
            $MultButton.AutoSize                    = $true
            $MultButton.FlatAppearance.BorderColor  = 'lightgray'
            $MultButton.DataBindings.DefaultDataSourceUpdateMode = 0
            $multGroupBox.Controls.Add($MultButton)                                                                                 #Add "choose" button to mult group box (on mult form) -add click to open file directory

            $MultButton.Add_Click({
                $filebrowser                            = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
                $filebrowser.ShowDialog()
                $csvfile                                = $filebrowser.FileName
                $multBox.Text                           = $csvfile
                if($multBox.text.Length -ne 0){                                                                                     #Only allow import button to be enabled if text box contains text (file link)
                    $MultButton2.enabled = $true
                }
                else{
                    $MultButton2.enabled = $false
                }
            })

            
            ################ Import Button ################

            #Button - 
            $MultButton2                            = New-Object System.Windows.Forms.Button
            $MultButton2.Enabled                    = $false
            $MultButton2.Text                       = 'Import'
            $MultButton2.FlatStyle                  = 'flat'
            $MultButton2.BackColor                  = "white"
            $MultButton2.Location                   = New-Object System.Drawing.Size(170,100)
            $MultButton2.Size                       = New-Object System.Drawing.Size(75,12)
            $MultButton2.AutoSize                   = $true
            $MultButton2.FlatAppearance.BorderColor = 'lightgray'
            $MultButton2.DataBindings.DefaultDataSourceUpdateMode = 0
            $multGroupBox.Controls.Add($MultButton2)                                                                                #Add "import" button to mult group box (on mult from) 
                                                                                                    
            $MultButton2.Add_Click({                                                                                                #Add click to import CSV file and assign multiple AD user parameters - FINISH
                $ADUsers = Import-Csv $csvfile
                foreach($user in $ADUsers){
                    $Username                           = $user.username
                    $Password                           = $user.password
                    $FirstName                          = $user.firstname
                    $LastName                           = $user.lastName
                    
                    
                }
                if(Get-ADUser -Filter { SamAccountName -eq $Username }){
                    
                }
            })

    ############################################################ Bottom Buttons #########################################################################

    $mult_form.KeyPreview = $true                                                                                                   #Add Key Preview to mult form
    $mult_form.Add_KeyDown({                                                                                                        #Add Key Down so if 'enter' key clicked OK button will be clicked
        if ($_.keycode -eq 'Enter'){
            $OkButton2.PerformClick()
        }
    })
    $mult_form.Add_KeyDown({                                                                                                        #Add Key Down so if 'esc' key clicked Cancel button will be clicked
        if($_.keycode -eq 'Escape'){
            $CancelButton2.PerformClick()
        }
    })
            ################ Cancel Button ################

            $CancelButton2                          = New-Object System.Windows.Forms.Button
            $CancelButton2.Text                     = 'Cancel'
            $CancelButton2.FlatStyle                = 'flat'
            $CancelButton2.BackColor                = "white"
            $CancelButton2.Location                 = New-Object System.Drawing.Size(243,215)
            $CancelButton2.Size                     = New-Object System.Drawing.Size(80,12)
            $CancelButton2.AutoSize                 = $true
            $CancelButton2.FlatAppearance.BorderColor = 'lightgray'
            $CancelButton2.DataBindings.DefaultDataSourceUpdateMode = 0
            $mult_form.Controls.Add($CancelButton2)                                                                                 #Add "Cancel" button to bottom of mult form
            
            $CancelButton2.Add_Click({                                                                                              #Add click to Cancel button to close form
                $mult_form.close()
            })

            ################ OK Button ################

            $OkButton2                              = New-Object System.Windows.Forms.Button
            $OkButton2.Text                         = 'OK'
            $OkButton2.FlatStyle                    = 'flat'
            $OkButton2.BackColor                    = "white"
            $OkButton2.Location                     = New-Object System.Drawing.Size(328,215)
            $OkButton2.Size                         = New-Object System.Drawing.Size(80,12)
            $OkButton2.AutoSize                     = $true
            $OkButton2.FlatAppearance.BorderColor   = 'lightgray'
            $OkButton2.DataBindings.DefaultDataSourceUpdateMode = 0
            $mult_form.Controls.Add($OkButton2)                                                                                     #Add "OK" button to bottom of mult form

            $OkButton2.Add_Click({                         #splatting                                                               #Add click to OK button to create new users using assigned params from import button
                #New-ADUser `
                #-Name $name -GivenName $Firstname -Surname $Lastname $DisplayName $Fullname -EmployeeID $EmployeeID `
                #-OfficePhone $PhoneNum -EmailAddress $Email -HomeDrive $HomeFolder -Description $Description `
                #-Title $Title -Department $Department -Manager $Manager -Company $Company -PostalCode $MailStop
            })

            $mult_form.ShowDialog()
    })

    ####################################### Account GroupBox #######################################

    $AcctGroupBox                           = New-Object System.Windows.Forms.GroupBox
    $AcctGroupBox.Location                  = New-Object System.Drawing.Size (5,210)
    $AcctGroupBox.Size                      = New-Object System.Drawing.Size (387,100)
    $AcctGroupBox.AutoSize                  = $true
    $AcctGroupBox.Text                      = "User Account"
    $AcctGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $AcctPage.Controls.Add($AcctGroupBox)                                                                                           #Add "Account" group box to Account page (on main form)

    #Image - 
    $Acctimage                              = [System.Drawing.Image]::Fromfile('C:\Users\turflhj1\1034125-contact-us.png')
    $AcctpictureBox                         = new-object Windows.Forms.PictureBox
    $AcctpictureBox.SizeMode                = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
    $AcctpictureBox.Size                    = New-Object System.Drawing.Size (140,65)
    $AcctpictureBox.Location                = New-Object System.Drawing.Size (220,20)
    $AcctpictureBox.Image                   = $Acctimage
    $AcctGroupBox.Controls.Add($AcctpictureBox)                                                                                     #Add email,phone graphic image to account group box (on account page)

        ################ 5-2-1 ################

        #Label - 
        $521NameLabel                           = New-Object System.Windows.Forms.Label
        $521NameLabel.Location                  = New-Object System.Drawing.Size (10,30)
        $521NameLabel.AutoSize                  = $true                                                                               
        $521NameLabel.Text                      = "5-2-1 "
        $AcctGroupBox.Controls.Add($521NameLabel)                                                                                   #Add "5-2-1" label to account group box (on account page)

        #TextBox -
        $521NameBox                             = New-Object System.Windows.Forms.TextBox
        $521NameBox.Enabled                     = $false                                                                            #5-2-1 text box not enabled, text generated from OK click
        $521NameBox.BorderStyle                 = 'FixedSingle'
        $521NameBox.Location                    = New-Object System.Drawing.Size (90,28)
        $521NameBox.Size                        = New-Object System.Drawing.Size (120,10)
        $AcctGroupBox.Controls.Add($521NameBox)                                                                                     #Add 5-2-1 text box to account group box (on account page)

        ################ Office Phone Number ################ 

        #Label - 
        $PhoneLabel                             = New-Object System.Windows.Forms.Label
        $PhoneLabel.Location                    = New-Object System.Drawing.Size (10,60)
        $PhoneLabel.AutoSize                    = $true
        $PhoneLabel.Text                        = "Phone "
        $AcctGroupBox.Controls.Add($PhoneLabel)                                                                                     #Add "Phone" label to account group box (on account page)

        #TextBox -
        $PhoneBox                               = New-Object System.Windows.Forms.TextBox
        $PhoneBox.BorderStyle                   = 'FixedSingle'
        $PhoneBox.Location                      = New-Object System.Drawing.Size (90,58)
        $PhoneBox.Size                          = New-Object System.Drawing.Size (120,10)
        $AcctGroupBox.Controls.Add($PhoneBox)                                                                                       #Add phone number text box to account group box (on account page)

        ################ Work E-mail ################ 

        #Label - 
        $EmailNameLabel                         = New-Object System.Windows.Forms.Label
        $EmailNameLabel.Location                = New-Object System.Drawing.Size (10,90)
        $EmailNameLabel.AutoSize                = $true
        $EmailNameLabel.Text                    = "Email "
        $AcctGroupBox.Controls.Add($EmailNameLabel)                                                                                 #Add "Email" label to account group box (on account page)

        #TextBox -
        $EmailNameBox                           = New-Object System.Windows.Forms.TextBox
        $EmailNameBox.Enabled                   = $false                                                                            #Email text box not enabled, text generated from OK click
        $EmailNameBox.BorderStyle               = 'FixedSingle'
        $EmailNameBox.Location                  = New-Object System.Drawing.Size (90,88)
        $EmailNameBox.Size                      = New-Object System.Drawing.Size (275,10)
        $AcctGroupBox.Controls.Add($EmailNameBox)                                                                                   #Add email address to account group box (on account page)

        ################ Office Location ################ 

        #Label - 
        $OfficeLabel                            = New-Object System.Windows.Forms.Label
        $OfficeLabel.Location                   = New-Object System.Drawing.Size (10,120)
        $OfficeLabel.AutoSize                   = $true
        $OfficeLabel.Text                       = "Office "
        $AcctGroupBox.Controls.Add($OfficeLabel)                                                                                    #Add "Office" label to account group box (on account page)

        #TextBox -
        $OfficeBox                              = New-Object System.Windows.Forms.TextBox
        $OfficeBox.BorderStyle                  = 'FixedSingle'
        $OfficeBox.Location                     = New-Object System.Drawing.Size (90,118)
        $OfficeBox.Size                         = New-Object System.Drawing.Size (275,10)
        $AcctGroupBox.Controls.Add($OfficeBox)                                                                                      #Add office location text box to account group box (on account page)
        
        ################ Home Folder ################

        #Label - 
        $HFolderNameLabel                       = New-Object System.Windows.Forms.Label
        $HFolderNameLabel.Location              = New-Object System.Drawing.Size (10,150)
        $HFolderNameLabel.AutoSize              = $true
        $HFolderNameLabel.Text                  = "Home Folder "
        $AcctGroupBox.Controls.Add($HFolderNameLabel)                                                                               #Add "home folder" label to account group box (on account page)

        #TextBox -
        $HFolderNameBox                         = New-Object System.Windows.Forms.TextBox
        $HFolderNameBox.BorderStyle             = 'FixedSingle'
        $HfolderNameBox.Location                = New-Object System.Drawing.Size (90,148)
        $HFolderNameBox.Size                    = New-Object System.Drawing.Size (275,10)
        $AcctGroupBox.Controls.Add($HFolderNameBox)                                                                                 #Add home folder location text box to account group box (on account page)

        ################ Employee Number ################

        #Label - 
        $DescNameLabel                          = New-Object System.Windows.Forms.Label
        $DescNameLabel.Location                 = New-Object System.Drawing.Size (10,180)
        $DescNameLabel.AutoSize                 = $true
        $DescNameLabel.Text                     = "Employee # "
        $AcctGroupBox.Controls.Add($DescNameLabel)                                                                                  #Add "Employee #" label to account group box (on account page)

        #TextBox -
        $DescNameBox                            = New-Object System.Windows.Forms.TextBox
        $DescNameBox.BorderStyle                = 'FixedSingle'
        $DescNameBox.Location                   = New-Object System.Drawing.Size (90,178)
        $DescNameBox.Size                       = New-Object System.Drawing.Size (275,10)
        $AcctGroupBox.Controls.Add($DescNameBox)                                                                                   #Add employee number text box to account group box (on account page)

############################################################ Profile Page #########################################################################

$ProfPage                           = New-Object System.Windows.Forms.TabPage
$ProfPage.Text                      = "Profile"
$ProfPage.Font                      = $GUIFont
$ProfPage.Location                  = New-Object System.Drawing.Size (15,70)
$ProfPage.Size                      = New-Object System.Drawing.Size (405,475)
$ProfPage.AutoSize                  = $true
$ProfPage.DataBindings.DefaultDataSourceUpdateMode = 0
$tabControl.Controls.Add($ProfPage)                                                                                                 #Add "Profile" page to tab control (in main form)

    ####################################### Profile GroupBox #######################################

    $ProfGroupBox                       = New-Object System.Windows.Forms.GroupBox
    $ProfGroupBox.Location              = New-Object System.Drawing.Size (5,10)
    $ProfGroupBox.Size                  = New-Object System.Drawing.Size (387,190)
    $ProfGroupBox.AutoSize              = $true
    $ProfGroupBox.Text                  = "User Profile"
    $ProfGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $ProfPage.Controls.Add($ProfGroupBox)                                                                                           #Add "User Profile" group box to profile page (on main form)

    #Image - 
    $Profimage                          = [System.Drawing.Image]::Fromfile('C:\Users\turflhj1\edit-user.png')
    $ProfpictureBox                     = new-object Windows.Forms.PictureBox
    $ProfpictureBox.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
    $ProfpictureBox.Size                = New-Object System.Drawing.Size (45,45)
    $ProfpictureBox.Location            = New-Object System.Drawing.Size (315,125)
    $ProfpictureBox.Image               = $Profimage
    $ProfGroupBox.Controls.Add($ProfpictureBox)                                                                                     #Add user graphic image to user profile group box (on profile page)

        ################ Job Title ################

        #Label - 
        $JobTLabel                          = New-Object System.Windows.Forms.Label
        $JobTLabel.Location                 = New-Object System.Drawing.Size (10,30)
        $JobTLabel.AutoSize                 = $true
        $JobTLabel.Text                     = "Job Title "
        $ProfGroupBox.Controls.Add($JobTLabel)                                                                                      #Add "Job title" label to user profile group box (on profile page)

        #TextBox -
        $JobTBox                            = New-Object System.Windows.Forms.TextBox
        $JobTBox.BorderStyle                = 'FixedSingle'
        $JobTBox.Location                   = New-Object System.Drawing.Size (90,28)
        $JobTBox.Size                       = New-Object System.Drawing.Size (275,10)
        $ProfGroupBox.Controls.Add($JobTBox)                                                                                        #Add job title text box to user profile group box (on profile page)

        ################ Department ################

        #Label - 
        $DeptLabel                          = New-Object System.Windows.Forms.Label
        $DeptLabel.Location                 = New-Object System.Drawing.Size (10,60)
        $DeptLabel.AutoSize                 = $true
        $DeptLabel.Text                     = "Department "
        $ProfGroupBox.Controls.Add($DeptLabel)                                                                                      #Add "Department" label to user profile group box (on profile page)

        #TextBox -
        $DeptBox                            = New-Object System.Windows.Forms.TextBox
        $DeptBox.BorderStyle                = 'fixedsingle'
        $DeptBox.Location                   = New-Object System.Drawing.Size (90,58)
        $DeptBox.Size                       = New-Object System.Drawing.Size (120,12)
        $ProfGroupBox.Controls.Add($DeptBox)                                                                                        #Add department text box to user profile group box (on profile page)

        ################ Group Box ################

        #Label - 
        $GroupLabel                         = New-Object System.Windows.Forms.Label
        $GroupLabel.Location                = New-Object System.Drawing.Size (220,60)
        $GroupLabel.AutoSize                = $true
        $GroupLabel.Text                    = "Group "
        $ProfGroupBox.Controls.Add($GroupLabel)                                                                                     #Add "Group" label to user profile group box (on profile page)

        #TextBox -
        $GroupBox                           = New-Object System.Windows.Forms.TextBox
        $GroupBox.BorderStyle               = 'fixedsingle'
        $GroupBox.Location                  = New-Object System.Drawing.Size (265,58)
        $GroupBox.Size                      = New-Object System.Drawing.Size (100,12)
        $ProfGroupBox.Controls.Add($GroupBox)                                                                                       #Add group text box to user profile group box (on profile page)

        ################ Manager ################

        #Label - 
        $ManNameLabel                       = New-Object System.Windows.Forms.Label
        $ManNameLabel.Location              = New-Object System.Drawing.Size (10,90)
        $ManNameLabel.AutoSize              = $true
        $ManNameLabel.Text                  = "Manager "
        $ProfGroupBox.Controls.Add($ManNameLabel)                                                                                   #Add "Manager" label to user profile group box (on profile page)

        #TextBox -
        $ManNameBox                         = New-Object System.Windows.Forms.TextBox
        $ManNameBox.BorderStyle             = 'FixedSingle'
        $ManNameBox.Location                = New-Object System.Drawing.Size (90,88)
        $ManNameBox.Size                    = New-Object System.Drawing.Size (275,10)
        $ProfGroupBox.Controls.Add($ManNameBox)                                                                                     #Add manager text box to user profile group box (on profile page) - accepts AD User type

        ################ Company ################

        #Label - 
        $CompNameLabel                      = New-Object System.Windows.Forms.Label
        $CompNameLabel.Location             = New-Object System.Drawing.Size (10,120)
        $CompNameLabel.AutoSize             = $true
        $CompNameLabel.Text                 = "Company "
        $ProfGroupBox.Controls.Add($CompNameLabel)                                                                                  #Add "Company" label to user profile group box (on profile page)

        #TextBox -
        $CompNameBox                        = New-Object System.Windows.Forms.TextBox
        $CompNameBox.Enabled                = $false                                                                                #Company text box not enabled, text generated from .text
        $Company                            = 'JHU/APL'
        $CompNameBox.text                   = $Company
        $CompNameBox.BorderStyle            = 'FixedSingle'
        $CompNameBox.Location               = New-Object System.Drawing.Size (90,118)
        $CompNameBox.Size                   = New-Object System.Drawing.Size (200,10)
        $ProfGroupBox.Controls.Add($CompNameBox)                                                                                    #Add company text box to user profile group box (on profile page)

        ################ Mailstop ################

        #Label - 
        $MailLabel                          = New-Object System.Windows.Forms.Label
        $MailLabel.Location                 = New-Object System.Drawing.Size (10,150)
        $MailLabel.AutoSize                 = $true
        $MailLabel.Text                     = "Mailbox "
        $ProfGroupBox.Controls.Add($MailLabel)                                                                                      #Add "Mailbox" label to user profile group box (on profile page)

        #TextBox -
        $MailBox                            = New-Object System.Windows.Forms.TextBox
        $MailBox.BorderStyle                = 'FixedSingle'
        $MailBox.Location                   = New-Object System.Drawing.Size (90,148)
        $MailBox.Size                       = New-Object System.Drawing.Size (200,10)
        $ProfGroupBox.Controls.Add($MailBox)                                                                                        #Add mailbox text box to user profile group box (on profile page)

    ####################################### Member Of GroupBox #######################################

    $MemGroupBox                        = New-Object System.Windows.Forms.GroupBox
    $MemGroupBox.Location               = New-Object System.Drawing.Size (5,210)
    $MemGroupBox.Size                   = New-Object System.Drawing.Size (387,221)
    $MemGroupBox.AutoSize               = $true
    $MemGroupBox.Text                   = "Member Of"
    $MemGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $ProfPage.Controls.Add($MemGroupBox)                                                                                            #Add "Member Of" group box to profile page (on main form)

    ################ Groups Panel ################                                                                        

    $MemPanel                           = New-Object System.Windows.Forms.Panel
    $MemPanel.Size                      = New-Object System.Drawing.Size(365,100)
    $MemPanel.Location                  = New-Object System.Drawing.Size(10,25)
    $MemPanel.BackColor                 = 'white'
    $MemPanel.BorderStyle               = 'FixedSingle'
    $MemGroupBox.Controls.Add($MemPanel)

    ############### Groups TextBox ###############

    $MemTextBox                         = New-Object System.Windows.Forms.TextBox
    $MemTextBox.Size                    = New-Object System.Drawing.Size(350,80)
    $MemTextBox.Location                = New-Object System.Drawing.Size(10,7)
    $MemTextBox.Text                    = ''
    $MemTextBox.BackColor               = 'white'
    $MemTextBox.BorderStyle             = 'FixedSingle'
    $MemPanel.Controls.Add($MemTextBox)
    
        #Label for combobox - 

        $FacilityLabel                      = New-Object System.Windows.Forms.Label
        $FacilityLabel.Text                 = 'Facility'
        $FacilityLabel.Size                 = New-Object System.Drawing.Size (60,20)
        $FacilityLabel.Location             = New-Object System.Drawing.Size(55,135)
        $MemGroupBox.Controls.Add($FacilityLabel)

        #ComboBox - 

        $FacilityBox                        = New-Object System.Windows.Forms.ComboBox
        $FacilityBox.FlatStyle              = 'popup'
        $FacilityBox.BackColor              = 'white'
        $FacilityBox.Location               = New-Object System.Drawing.Size(15,165)
        $FacilityBox.Size                   = New-Object System.Drawing.Size(150,15)
        $FacilityBox.AutoSize               = $true
        $FacilityBox.Items.Add("A4 Classified Spark")
        $FacilityBox.Items.Add("ABMPC")
        $FacilityBox.Items.Add("ACES")
        $FacilityBox.Items.Add("ACRE")
        $FacilityBox.Items.Add("AMDR")
        $FacilityBox.Items.Add("AMDS CVTC")
        $FacilityBox.Items.Add("AMDS-CCF")
        $FacilityBox.Items.Add("AMSEL")
        $FacilityBox.Items.Add("ASCF")
        $FacilityBox.Items.Add("BLAST Lab")
        $FacilityBox.Items.Add("CSDF")
        $FacilityBox.Items.Add("DDA")
        $FacilityBox.Items.Add("GSEL-26")
        $FacilityBox.Items.Add("INTEROP")
        $FacilityBox.Items.Add("LODI")
        $FacilityBox.Items.Add("MSI")
        $FacilityBox.Items.Add("PARSE")
        $FacilityBox.Items.Add("RADAR")
        $FacilityBox.Items.Add("REDD")
        $FacilityBox.Items.Add("SCOPE")
        $FacilityBox.Items.Add("SRTF")
        $FacilityBox.Items.Add("SSDS")
        $FacilityBox.Items.Add("Viz-Sim")
        $FacilityBox.DataBindings.DefaultDataSourceUpdateMode = 0
        $MemGroupBox.Controls.Add($FacilityBox)    
        

        $AddButton.Add_Click{                           #this does not work ?????
            $MemTextBox.AppendText('Facility:')
                Switch($FacilityBox.SelectedText){

                "A4 Classified Spark"{ 
                    $MemTextBox.AppendText('A4 Classified Spark ' + '/ No groups')
                }
                "ABMPC"{
                    $MemTextBox.AppendText("ABMPC " + "/ No Groups")
                }
                "ACES"{
                    $MemTextBox.AppendText("ACES " + "/ No Groups")
                }
                "ACRE"{
                    $MemTextBox.AppendText("ACRE " + "/ No Groups")
                }
                "AMDR"{

                    $MemTextBox.AppendText("AMDR " + "/ AMDR Users")
                    $MemTextBox.AppendText("AMDR " + "/ RDSH-AMDR Mapped Network Drives") 
                }
                "AMDS CVTC"{
                    $MemTextBox.AppendText("AMDS CVTC " + "/ No Groups")
                }
                "AMDS-CCF"{
                    $MemTextBox.AppendText("AMDS-CCF " + "/ No Groups")
                }
                "AMSEL"{
                    $MemTextBox.AppendText("AMSEL " + "/ +AMSEL-Users")
                    $MemTextBox.AppendText("AMSEL " + "/ AMSEL-USERS")
                    $MemTextBox.AppendText("AMSEL " + "/ RDSH-AMSEL Mapped Network Drives")
                }
                "ASCF"{
                    $MemTextBox.AppendText("ASCF " + "/ ASCF Users")
                    $MemTextBox.AppendText("ASCF " + "/ ASCF-Users")
                    $MemTextBox.AppendText("ASCF " + "/ Remote Desktop Users")
                    $MemTextBox.AppendText("ASCF " + "/ RDSH-ASDF Mapped Network Drives")
                }
                "BLAST Lab"{
                    $MemTextBox.AppendText("BLAST Lab " + "/ Blast-Users")
                }
                "CSDF"{
                    $MemTextBox.AppendText("CSDF " + "/ CSDF-Facility Users")
                    $MemTextBox.AppendText("CSDF " + "/ CSDF-Users")
                    $MemTextBox.AppendText("CSDF " + "/ RDSH-CSDF Mapped Network Drives")
                }
                "DDA"{
                    $MemTextBox.AppendText("DDA " + "/ DDA Users")
                    $MemTextBox.AppendText("DDA " + "/ RDSH-DDA Mapped Network Drives")
                }
                "GSEL-26"{
                    $MemTextBox.AppendText("GSEL-26 " + "/ No Groups")
                }
                "INTEROP"{
                    $MemTextBox.AppendText("INTEROP " + "/ ExchangeLegacyInterop")
                    $MemTextBox.AppendText("INTEROP " + "/ INTEROP_USERS")
                }
                "LODI"{
                    $MemTextBox.AppendText("LODI " + "/ No Groups")
                }
                "MSI"{
                    $MemTextBox.AppendText("MSI " + "/ MSI Users")
                    $MemTextBox.AppendText("MSI " + "/ RDSH-MSI Mapped Network Drives")
                }
                "PARSE"{
                    $MemTextBox.AppendText("PARSE " + "/ PARSE-Users")
                    $MemTextBox.AppendText("PARSE " + "/ RDSH-PARSE Mapped Network Drives")
                }
                "RADAR"{
                    $MemTextBox.AppendText("RADAR " + "/ RADAR-Lab Users")
                    $MemTextBox.AppendText("RADAR " + "/ RADAR-Lab-Users")
                    $MemTextBox.AppendText("RADAR " + "/ RDSH-RADAR Mapped Network Drives")
                }
                "REDD"{
                    $MemTextBox.AppendText("REDD " + "/ REDD Users")
                    $MemTextBox.AppendText("REDD " + "/ REDD-Vmusers")
                }
                "SCOPE"{
                    $MemTextBox.AppendText("SCOPE " + "/ SCOPE-Users")
                    $MemTextBox.AppendText("SCOPE " + "/ RDSH-SCOPE Mapped Network Drives")
                }
                "SRTF"{
                    $MemTextBox.AppendText("SRIF " + "/ SRIF-Users")
                    $MemTextBox.AppendText("SRIF " + "/ RDSH-SRTF Mapped Network Drives")
                }
                "SSDS"{
                    $MemTextBox.AppendText("SSDS " + "/ SSDSUsers")
                }
                "Viz-Sim"{
                    $MemTextBox.AppendText("Viz-Sim " + "/ No Groups")
                }
        }
    }
       

        
        #Add to group button - 

        $AddButton                        = New-Object System.Windows.Forms.Button
        $AddButton.Text                   = 'Add'
        $AddButton.FlatStyle              = 'flat'
        $AddButton.BackColor              = "white"
        $AddButton.Location               = New-Object System.Drawing.Size(200,162.5)
        $AddButton.Size                   = New-Object System.Drawing.Size(80,12)
        $AddButton.AutoSize               = $true
        $AddButton.FlatAppearance.BorderColor = 'lightgray'
        $AddButton.DataBindings.DefaultDataSourceUpdateMode = 0
        $MemGroupBox.Controls.Add($AddButton)                                            
        
        #Remove from group button - 

        $RemButton                        = New-Object System.Windows.Forms.Button
        $RemButton.Text                   = 'Remove'
        $RemButton.FlatStyle              = 'flat'
        $RemButton.BackColor              = "white"
        $RemButton.Location               = New-Object System.Drawing.Size(288,162.5)
        $RemButton.Size                   = New-Object System.Drawing.Size(80,12)
        $RemButton.AutoSize               = $true
        $RemButton.FlatAppearance.BorderColor = 'lightgray'
        $RemButton.DataBindings.DefaultDataSourceUpdateMode = 0
        $MemGroupBox.Controls.Add($RemButton)                                           


############################################################ Organization Page #########################################################################

$OrgPage                            = New-Object System.Windows.Forms.TabPage
$OrgPage.Text                       = "Organization"
$OrgPage.Font                       = $GUIFont
$OrgPage.Location                   = New-Object System.Drawing.Size(15,70)
$OrgPage.Size                       = New-Object System.Drawing.Size(405,475)
$OrgPage.AutoSize                   = $true
$OrgPage.DataBindings.DefaultDataSourceUpdateMode = 0
$tabControl.Controls.Add($OrgPage)                                                                                                  #Add "Organization" page to tab control (in main form)

    ####################################### Environment GroupBox #######################################

    $EnvGroupBox                        = New-Object System.Windows.Forms.GroupBox
    $EnvGroupBox.Location               = New-Object System.Drawing.Size(5,10)
    $EnvGroupBox.Size                   = New-Object System.Drawing.Size(387,70)
    $EnvGroupBox.AutoSize               = $true
    $EnvGroupBox.Text                   = "Environment"
    $EnvGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $OrgPage.Controls.Add($EnvGroupBox)                                                                                             #Add "Environment" group box to organization page (on main form)

    #Environment info Label-
    $EnvLabel                           = New-Object System.Windows.Forms.Label
    $EnvLabel.Location                  = New-Object System.Drawing.Size(10,20)
    $EnvLabel.Size                      = New-Object System.Drawing.Size (320,20)
    $EnvLabel.Text                      = "Configure Remote Desktop Services startup enviroment."
    $EnvGroupBox.Controls.Add($EnvLabel)                                                                                            #Add label to provide environment info to environment group box (on organization page)

    #Image - 
    $envimage                           = [System.Drawing.Image]::Fromfile('C:\Users\turflhj1\client-devices.png')
    $envpictureBox                      = new-object Windows.Forms.PictureBox
    $envpictureBox.SizeMode             = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
    $envpictureBox.Size                 = New-Object System.Drawing.Size (45,45)
    $envpictureBox.Location             = New-Object System.Drawing.Size (325,20)
    $envpictureBox.Image                = $envimage
    $EnvGroupBox.Controls.Add($envpictureBox)                                                                                       #Add computer graphic image to environment group box (on organization page)

        ################ Client Devices ################ 

        #Label - 
        $ClientLabel                        = New-Object System.Windows.Forms.Label
        $ClientLabel.Location               = New-Object System.Drawing.Size(10,45)
        $ClientLabel.AutoSize               = $true
        $ClientLabel.Text                   = "Client Devices "
        $EnvGroupBox.Controls.Add($ClientLabel)                                                                                     

        #ComboBox - 
        $ClientD                            = New-Object System.Windows.Forms.ComboBox
        $ClientD.FlatStyle                  = 'popup'
        $ClientD.BackColor                  = 'white'
        $ClientD.Location                   = New-Object System.Drawing.Size(100,45)
        $ClientD.Size                       = New-Object System.Drawing.Size(210,12)
        $ClientD.AutoSize                   = $true
        $ClientD.Items.Add("Connect Client Devices at Logon")
        $ClientD.Items.Add("Connect Client Printers at Logon")
        $ClientD.Items.Add("Default to Main Client Computer")
        $ClientD.DataBindings.DefaultDataSourceUpdateMode = 0
        $EnvGroupBox.Controls.Add($ClientD)                                                                                         #Add client devices group box and label to environment group box (on organization page)

    ####################################### Remote Control GroupBox #######################################

    $RemCGroupBox                       = New-Object System.Windows.Forms.GroupBox
    $RemCGroupBox.Location              = New-Object System.Drawing.Size(5,100)
    $RemCGroupBox.Size                  = New-Object System.Drawing.Size(387,90)
    $RemCGroupBox.AutoSize              = $true
    $RemCGroupBox.Text                  = "Remote Control"
    $RemCGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $OrgPage.Controls.Add($RemCGroupBox)                                                                                            #Add "Remote Control" group box to organization page (on main form)
    
    #Remote Control label-  
    $RemCLabel                          = New-Object System.Windows.Forms.Label        
    $RemCLabel.Location                 = New-Object System.Drawing.Size(10,20)
    $RemCLabel.Size                     = New-Object System.Drawing.Size (335,20)
    $RemCLabel.Text                     = "Configure Remote Desktop Services remote control settings."
    $RemCGroupBox.Controls.Add($RemCLabel)                                                                                          #Add label to provide remote control info to remote control group box (on organization page)

    #Image - 
    $RemCimage                          = [System.Drawing.Image]::Fromfile('C:\Users\turflhj1\remote_access-512.png')
    $RemCpictureBox                     = new-object Windows.Forms.PictureBox
    $RemCpictureBox.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
    $RemCpictureBox.Size                = New-Object System.Drawing.Size (45,45)
    $RemCpictureBox.Location            = New-Object System.Drawing.Size (325,38)
    $RemCpictureBox.Image               = $RemCimage
    $RemCGroupBox.Controls.Add($RemCpictureBox)                                                                                     #Add remote computers image to remote control group box (on organization page)
    
        ################ Enable Remote Control CheckBox ################ 

        $CheckBox1                          = New-Object System.Windows.Forms.CheckBox
        $CheckBox1.FlatStyle                = 'popup'
        $CheckBox1.Location                 = New-Object System.Drawing.Size(10,42)
        $CheckBox1.Size                     = New-Object System.Drawing.Size(10,10)
        $CheckBox1.AutoSize                 = $true
        $CheckBox1.Text                     = "Enable Remote Control"
        $CheckBox1.DataBindings.DefaultDataSourceUpdateMode = 0
        $RemCGroupBox.Controls.Add($CheckBox1)                                                                                      #Add "Enable Remote Control" checkbox to remote control group box (on organization page)
        
        $CheckBox1.Add_CheckStateChanged({                                                                                          #Only if "Enable Remote Control" checkbox is checked, "Require User's Permission" checkbox becomes visible
            if($CheckBox1.Checked -eq $true){
                $CheckBox2.enabled = $true
            }
            else{
                $CheckBox2.enabled = $false
            }
        })

        ################ User Permission CheckBox ################ 

        $CheckBox2                          = New-Object System.Windows.Forms.CheckBox
        $CheckBox2.Enabled                  = $false
        $CheckBox2.FlatStyle                = 'popup'
        $CheckBox2.Location                 = New-Object System.Drawing.Size(160,42)
        $CheckBox2.Size                     = New-Object System.Drawing.Size(10,10)
        $CheckBox2.AutoSize                 = $true
        $CheckBox2.Text                     = "Require User's Permission"
        $CheckBox2.DataBindings.DefaultDataSourceUpdateMode = 0
        $RemCGroupBox.Controls.Add($CheckBox2)                                                                                      #Add "Require User's Permission" checkbox to remote control group box (on organization page)

        $CheckBox2.Add_CheckStateChanged({                                                                                          #Only if "Require User's Permission" checkbox is checked, control level combobox becomes visible
            if($CheckBox2.Checked -eq $true){
                $Control3.enabled = $true
            }
            else{
                $Control3.enabled = $false
            }
        })

        ################ Level of Control ################  

        #ComboBox - 
        $Control3                           = New-Object System.Windows.Forms.ComboBox
        $Control3.Enabled                   = $false
        $Control3.FlatStyle                 = 'popup'
        $Control3.BackColor                 = 'white'
        $Control3.Location                  = new-object System.Drawing.Size(176,66)
        $Control3.Size                      = new-object System.Drawing.Size(125,15)
        $Control3.AutoSize                  = $true
        $Control3.Items.Add("View User's Session")
        $Control3.Items.Add("Interact with Session")
        $Control3.DataBindings.DefaultDataSourceUpdateMode = 0
        $RemCGroupBox.Controls.Add($Control3)                                                                                       #Add Combo box to select control level to remote control group box (on organization page)


    ####################################### Sessions GroupBox #######################################
    
    $SessGroupBox                       = New-Object System.Windows.Forms.GroupBox
    $SessGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $SessGroupBox.Location              = New-Object System.Drawing.Size(5,210)
    $SessGroupBox.Size                  = New-Object System.Drawing.Size(387,150)
    $SessGroupBox.AutoSize              = $true
    $SessGroupBox.Text                  = "Sessions"
    $OrgPage.Controls.Add($SessGroupBox)                                                                                            #Add "Sessions" group box to organization page (on main form)

    #Sessions info Label- 
    $SessLabel                          = New-Object System.Windows.Forms.Label
    $SessLabel.Location                 = New-Object System.Drawing.Size(10,20)
    $SessLabel.Size                     = New-Object System.Drawing.Size (365,20)
    $SessLabel.Text                     = "Set Remote Desktop Services timeout and reconnection settings."
    $SessGroupBox.Controls.Add($SessLabel)                                                                                          #Add label to provide session info to session group box (on organization page)

    #Image - 
    $Sessimage                          = [System.Drawing.Image]::Fromfile('C:\Users\turflhj1\sessions.png')
    $SesspictureBox                     = new-object Windows.Forms.PictureBox
    $SesspictureBox.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
    $SesspictureBox.Size                = New-Object System.Drawing.Size (45,45)
    $SesspictureBox.Location            = New-Object System.Drawing.Size (325,55)
    $SesspictureBox.Image               =$Sessimage
    $SessGroupBox.Controls.Add($SesspictureBox)                                                                                     #Add computer settings image to session group box (on organization page)

        ################ Disconnected Sessions ComboBox ################ 

        #Label - 
        $Box1Label                          = New-Object System.Windows.Forms.Label
        $Box1Label.Location                 = New-Object System.Drawing.Size(10,47)
        $Box1Label.AutoSize                 = $true
        $Box1Label.Text                     = "End a Disconnected Session "
        $SessGroupBox.Controls.Add($Box1Label)                                                                      

        #ComboBox - 
        $ListBox1                           = New-Object System.Windows.Forms.ComboBox
        $ListBox1.FlatStyle                 = 'popup'
        $ListBox1.BackColor                 = 'white'
        $ListBox1.Location                  = New-Object System.Drawing.Size(180,45)
        $ListBox1.Size                      = New-Object System.Drawing.Size(105,15)
        $ListBox1.AutoSize                  = $true
        $listBox1.Items.Add('Never')
        $listBox1.Items.Add('1 Minute')
        $listBox1.Items.Add('5 Minutes')
        $listBox1.Items.Add('10 Minutes')
        $listBox1.Items.Add('15 Minutes')
        $listBox1.Items.Add('30 Minutes')
        $listBox1.Items.Add('1 Hour')
        $ListBox1.DataBindings.DefaultDataSourceUpdateMode = 0
        $SessGroupBox.Controls.Add($ListBox1)                                                                                   #Add "End a disconnected session" combobox and label to select end time to sessions group box (on organization page)

        ################ Active Session Limit ComboBox ################ 

        #Label - 
        $Box2Label                          = New-Object System.Windows.Forms.Label
        $Box2Label.Location                 = New-Object System.Drawing.Size(10,72)
        $Box2Label.AutoSize                 = $true
        $Box2Label.Text                     = "Active Session Limit "
        $SessGroupBox.Controls.Add($Box2Label)

        #ComboBox - 
        $ListBox2                           = New-Object System.Windows.Forms.ComboBox
        $ListBox2.FlatStyle                 = 'popup'
        $ListBox2.BackColor                 = 'white'
        $ListBox2.Location                  = New-Object System.Drawing.Size(180,70)
        $ListBox2.Size                      = New-Object System.Drawing.Size(105,15)
        $ListBox2.AutoSize                  = $true
        $listBox2.Items.Add('Never')
        $listBox2.Items.Add('1 Minute')
        $listBox2.Items.Add('5 Minutes')
        $listBox2.Items.Add('10 Minutes')
        $listBox2.Items.Add('15 Minutes')
        $listBox2.Items.Add('30 Minutes')
        $listBox2.Items.Add('1 Hour')
        $ListBox2.DataBindings.DefaultDataSourceUpdateMode = 0
        $SessGroupBox.Controls.Add($ListBox2)                                                                                   #Add "Active session limit" combobox and label to select active session limit time to sessions group box (on organization page)
        
        ################ Idle Session Limit ComboBox ################

        #Label - 
        $Box3Label                          = New-Object System.Windows.Forms.Label
        $Box3Label.Location                 = New-Object System.Drawing.Size(10,97)
        $Box3Label.AutoSize                 = $true
        $Box3Label.Text                     = "Idle Session Limit "
        $SessGroupBox.Controls.Add($Box3Label)

        #ComboBox - 
        $ListBox3                           = New-Object System.Windows.Forms.ComboBox
        $ListBox3.FlatStyle                 = 'popup'
        $ListBox3.BackColor                 = 'white'
        $ListBox3.Location                  = New-Object System.Drawing.Size(180,95)
        $ListBox3.Size                      = New-Object System.Drawing.Size(105,15)
        $ListBox3.AutoSize                  = $true
        $listBox3.Items.Add('Never')
        $listBox3.Items.Add('1 Minute')
        $listBox3.Items.Add('5 Minutes')
        $listBox3.Items.Add('10 Minutes')
        $listBox3.Items.Add('15 Minutes')
        $listBox3.Items.Add('30 Minutes')
        $listBox3.Items.Add('1 Hour')
        $ListBox3.DataBindings.DefaultDataSourceUpdateMode = 0
        $SessGroupBox.Controls.Add($ListBox3)                                                                                   #Add "Idle session limit" combobox and label to select idle session limit time to sessions group box (on organization page)

        ################ Session Limit Controls ################  

        $SessLimLabel                       = New-Object System.Windows.Forms.Label
        $SessLimLabel.Location              = New-Object System.Drawing.Size(10,125)
        $SessLimLabel.AutoSize              = $true
        $SessLimLabel.Text                  = "When Session Limit Reached or Connection Broken "
        $SessGroupBox.Controls.Add($SessLimLabel)

        #Panel -
        $panel1                             = New-Object System.windows.Forms.Panel
        $panel1.Size                        = New-Object System.Drawing.Size(80,35)
        $panel1.Location                    = New-Object System.Drawing.Size(295,122)
        $SessGroupBox.Controls.Add($panel1)                                                                     

        #Disconnect button - 
        $DisSessionButton                   = New-Object System.Windows.Forms.RadioButton
        $DisSessionButton.FlatStyle         = 'popup'
        $DisSessionButton.Location          = New-Object System.Drawing.Size(2,0)
        $DisSessionButton.Size              = New-Object System.Drawing.Size(30,15)
        $DisSessionButton.AutoSize          = $true
        $DisSessionButton.Text              = "Disconnect"
        $DisSessionButton.DataBindings.DefaultDataSourceUpdateMode = 0
        $panel1.Controls.Add($DisSessionButton)

        #End Session button - 
        $EndSessionButton                   = New-Object System.Windows.Forms.RadioButton
        $EndSessionButton.FlatStyle         = 'popup'            
        $EndSessionButton.Location          = New-Object System.Drawing.Size(2,18)
        $EndSessionButton.Size              = New-Object System.Drawing.Size(5,5)
        $EndSessionButton.AutoSize          = $true
        $EndSessionButton.Text              = "End Session"
        $EndSessionButton.DataBindings.DefaultDataSourceUpdateMode = 0
        $panel1.Controls.Add($EndSessionButton)                                                                                 #Add "when session limit reached or connection broken" label and panel to select radio buttons disonnect/end session to sessions group box (on organization page)

        ################ Allow Reconnection Controls ################  

        $ARecLabel                          = New-Object System.Windows.Forms.Label
        $ARecLabel.Location                 = New-Object System.Drawing.Size(10,160)
        $ARecLabel.AutoSize                 = $true
        $ARecLabel.Text                     = "Allow Reconnection From "
        $SessGroupBox.Controls.Add($ARecLabel) 

        #Panel -
        $panel2                             = New-Object System.windows.Forms.Panel
        $panel2.Size                        = New-Object System.Drawing.Size(150,40)
        $panel2.Location                    = New-Object System.Drawing.Size(163,158)
        $SessGroupBox.Controls.Add($panel2)

        #Any Client button - 
        $AnyCButton                         = New-Object System.Windows.Forms.RadioButton
        $AnyCButton.FlatStyle               = 'popup'
        $AnyCButton.Location                = New-Object System.Drawing.Size(2,0)
        $AnyCButton.Size                    = New-Object System.Drawing.Size(5,5)
        $AnyCButton.AutoSize                = $true
        $AnyCButton.Text                    = "Any Client"
        $AnyCButton.DataBindings.DefaultDataSourceUpdateMode = 0
        $panel2.Controls.Add($AnyCButton)                                                                                       

        #Originating Client Only button - 
        $ARecButton                         = New-Object System.Windows.Forms.RadioButton
        $ARecButton.FlatStyle               = 'popup'
        $ARecButton.Location                = New-Object System.Drawing.Size(2,18)
        $ARecButton.Size                    = New-Object System.Drawing.Size(5,5)
        $ARecButton.AutoSize                = $true
        $ARecButton.Text                    = "Originating Client Only"
        $ARecButton.DataBindings.DefaultDataSourceUpdateMode = 0
        $panel2.Controls.Add($ARecButton)                                                                                       #Add "alllow reconnection from" label and panel to select radio buttons any client/originating client to sessions group box (on organization page)

############################################################ AD-Object Page #########################################################################

# Required Parameters - [String]Filter, [ADObject]Identitiy, [String]LDAPFilter

$ObjPage                            = New-Object System.Windows.Forms.TabPage
$ObjPage.Text                       = "Object"
$ObjPage.Font                       = $GUIFont
$ObjPage.Location                   = New-Object System.Drawing.Size(15,70)
$ObjPage.Size                       = New-Object System.Drawing.Size(405,475)
$ObjPage.AutoSize                   = $true
$ObjPage.DataBindings.DefaultDataSourceUpdateMode = 0
$tabControl.Controls.Add($ObjPage)

    ####################################### Object GroupBox #######################################

    $ObjGroupBox                        = New-Object System.Windows.Forms.GroupBox
    $ObjGroupBox.Location               = New-Object System.Drawing.Size(5,10)
    $ObjGroupBox.Size                   = New-Object System.Drawing.Size(387,150)
    $ObjGroupBox.AutoSize               = $true
    $ObjGroupBox.Text                   = "AD Object"
    $ObjGroupBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $ObjPage.Controls.Add($ObjGroupBox)

    #Object info Label-
    $ObjLabel                           = New-Object System.Windows.Forms.Label
    $ObjLabel.Location                  = New-Object System.Drawing.Size(10,20)
    $ObjLabel.Size                      = New-Object System.Drawing.Size (320,20)
    $ObjLabel.Text                      = "Configure Active Directory object parameters."
    $ObjGroupBox.Controls.Add($ObjLabel)

    #Image - 
    #$Objimage                          = [System.Drawing.Image]::Fromfile('')
    #$ObjpictureBox                     = new-object Windows.Forms.PictureBox
    #$ObjpictureBox.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
    #$ObjpictureBox.Size                = New-Object System.Drawing.Size (45,45)
    #$ObjpictureBox.Location            = New-Object System.Drawing.Size (325,20)
    #$ObjpictureBox.Image               = $Objimage
    #$ObjGroupBox.Controls.Add($ObjpictureBox)

        ################ Filter ################

        #Label - 
        $FilterLabel                        = New-Object System.Windows.Forms.Label
        $FilterLabel.Location               = New-Object System.Drawing.Size (10,45)
        $FilterLabel.AutoSize               = $true
        $FilterLabel.Text                   = "Filter "
        $ObjGroupBox.Controls.Add($FilterLabel)

        #TextBox -
        $FilterBox                          = New-Object System.Windows.Forms.TextBox
        $FilterBox.BorderStyle              = 'FixedSingle'
        $FilterBox.Location                 = New-Object System.Drawing.Size (90,43)
        $FilterBox.Size                     = New-Object System.Drawing.Size (175,12)
        $ObjGroupBox.Controls.Add($FilterBox)

############################################################ Bottom Buttons #########################################################################

$main_form.KeyPreview = $true
$main_form.Add_KeyDown({
    if ($_.keycode -eq 'Enter'){
        $OkButton.PerformClick()
    }
})
$main_form.Add_KeyDown({
    if($_.keycode -eq 'Escape'){
        $CancelButton.PerformClick()
    }
})

    ################ Cancel Button ################

    $CancelButton                       = New-Object System.Windows.Forms.Button
    $CancelButton.Text                  = 'Cancel'
    $CancelButton.FlatStyle             = 'flat'
    $CancelButton.BackColor             = "white"
    $CancelButton.Location              = New-Object System.Drawing.Size(75,475)
    $CancelButton.Size                  = New-Object System.Drawing.Size(80,12)
    $CancelButton.AutoSize              = $true
    $CancelButton.FlatAppearance.BorderColor = 'lightgray'
    $CancelButton.DataBindings.DefaultDataSourceUpdateMode = 0
    $main_form.Controls.Add($CancelButton)                                                                                      #Add "Cancel" button to bottom of main form to cancel/exit form

    # Cancel Button Click - 

$CancelButton.Add_Click({
    $main_form.Close()
})

    ################ OK Button ################

    $OkButton                           = New-Object System.Windows.Forms.Button
    $OkButton.Text                      = 'OK'
    $OkButton.FlatStyle                 = 'flat'
    $OkButton.BackColor                 = "white"
    $OkButton.Location                  = New-Object System.Drawing.Size(160,475)
    $OkButton.Size                      = New-Object System.Drawing.Size(80,12)
    $OkButton.AutoSize                  = $true
    $OkButton.FlatAppearance.BorderColor= 'lightgray'
    $OkButton.DataBindings.DefaultDataSourceUpdateMode = 0
    $main_form.Controls.Add($OkButton)                                                                                          #Add "OK" buton to bottom of main form to assign entered form parameters to corresponding AD parameters/preform neccessary form object enablizations

    # OK Button Click - 

$OkButton.Add_Click({ 
    $FirstName                          = $FNameBox.Text
    $MiddleInit                         = $MNameBox.Text
    $LastName                           = $LNameBox.Text
    if($LastName.Length -gt 5){
        $name5                              = $LastName.Substring(0,5)
    }
    else {
        $name5                              = $LastName
    }   
    if($MiddleInit.Length -ne 0){
        $name2                              = $FirstName.Substring(0,1) + $MiddleInit
    }
    else{
        $name2                              = $FirstName.Substring(0,1)
    }
    $EmployeeID                         = $name5 + $name2 + "1"
    [bool]$exists = (Get-ADUser -Filter { SamAccountName -eq $EmployeeID })
    if($exists){
        $UserName                           = $LastName + ', ' + $FirstName + ' ' + $MiddleInit 
        $ClickFont                          = [System.Drawing.Font]::new('Segoe UI', 14, [System.Drawing.FontStyle]::Bold)
            $AcctPageUserName                   = New-Object System.Windows.Forms.Label
            $AcctPageUserName.Text              = $UserName
            $AcctPageUserName.Font              = $ClickFont
            $AcctPageUserName.ForeColor         = 'DarkSlateGray'
            $AcctPageUserName.Size              = New-Object System.Drawing.Size(300,150)
            $AcctPageUserName.Location          = New-Object System.Drawing.Size(90,23)
            $AcctPage.Controls.Add($AcctPageUserName)
        $ExistingUser = Get-ADUser $EmployeeID -Properties *
        #Populate text feilds from existing user parameters
        $FNameBox.Text = $ExistingUser | Select-Object -ExpandProperty 'GivenName'
        $MNameBox.Text = $ExistingUser | Select-Object -ExpandProperty 'Initials'
        $LNameBox.Text = $ExistingUser | Select-Object -ExpandProperty 'Surname'
        $521NameBox.Text = $ExistingUser | Select-Object -ExpandProperty 'SamAccountName'
        $PhoneBox.Text = $ExistingUser | Select-Object -ExpandProperty 'OfficePhone'
        $EmailNameBox.Text = $ExistingUser | Select-Object -ExpandProperty 'EmailAddress'
        $OfficeBox.Text = $ExistingUser | Select-Object -ExpandProperty 'Office'
        $HFolderNameBox.Text = $ExistingUser | Select-Object -ExpandProperty 'HomeDirectory'
        $DescNameBox.Text = $ExistingUser | Select-Object -ExpandProperty 'EmployeeNumber'
        $JobTBox.Text = $ExistingUser | Select-Object -ExpandProperty 'Title'
        $ExistingUserDeptGroup = $ExistingUser | Select-Object -ExpandProperty 'Department'
        $ExistingUserDeptString = $ExistingUserDeptGroup.Substring(0,($ExistingUserDeptGroup.IndexOf('/')))
        $DeptBox.Text = $ExistingUserDeptString
        $GroupBox.Text = $ExistingUserDeptGroup.Substring(($ExistingUserDeptGroup.IndexOf('/'))+1,(($ExistingUserDeptGroup.Length - $ExistingUserDeptString.Length)-1))
        $ExistingUserManager = Get-ADUser $EmployeeID -Properties 'Manager' | Select-Object -ExpandProperty 'Manager'
        $ExistingUserManagerString = $ExistingUserManager.Substring(3,($ExistingUserManager.IndexOf('\')-3)) + ',' + $ExistingUserManager.Substring(($ExistingUserManager.IndexOf('\')+3),($ExistingUserManager.IndexOf('OU')))
        $ManNameBox.Text = $ExistingUserManagerString
        $MailBox.Text = $ExistingUser | Select-Object -ExpandProperty 'StreetAdress'
    }
    else{
        if($FNameBox.Text.Length -ne 0 -and $MNameBox.text.Length -le 1 -and $LNameBox.Text.Length -ne 0){
            #Populate parameters from text feilds
            $ExtensionName                      = $FirstName + " " + $MiddleInit + " " + $LastName
            $UserName                           = $LastName + ', ' + $FirstName + ' ' + $MiddleInit 
            $ClickFont                          = [System.Drawing.Font]::new('Segoe UI', 14, [System.Drawing.FontStyle]::Bold)
            $AcctPageUserName                   = New-Object System.Windows.Forms.Label
            $AcctPageUserName.Text              = $UserName
            $AcctPageUserName.Font              = $ClickFont
            $AcctPageUserName.ForeColor         = 'DarkSlateGray'
            $AcctPageUserName.Size              = New-Object System.Drawing.Size(300,150)
            $AcctPageUserName.Location          = New-Object System.Drawing.Size(90,23)
            $AcctPage.Controls.Add($AcctPageUserName)
            $EmployeeID                         = $EmployeeID.ToUpper()
            $521NameBox.Text                    = $EmployeeID
            $Email                              = $FirstName + '.' + $LastName + "@jhuapl.edu"
            $EmailNameBox.text                  = $Email
        }
        $HomeFolder                         = $HFolderNameBox.text
        $EmployeeNum                        = $DescNameBox.text
        $Title                              = $JobTBox.text
        $Department                         = $DeptBox.text
        $Manager                            = $ManNameBox.ADUser
        $Dept                               = $DeptBox.text
        $Group                              = $GroupBox.text
        $Department                         = $Dept + '/' + $Group
        $PhoneNum                           = $PhoneBox.text
        $MailStop                           = $MailBox.text
    }
    
})

    ################ Save Button ################

    $ApplyButton                        = New-Object System.Windows.Forms.Button
    $ApplyButton.Text                   = 'Save'
    $ApplyButton.FlatStyle              = 'flat'
    $ApplyButton.BackColor              = "white"
    $ApplyButton.Location               = New-Object System.Drawing.Size(245,475)
    $ApplyButton.Size                   = New-Object System.Drawing.Size(80,12)
    $ApplyButton.AutoSize               = $true
    $ApplyButton.FlatAppearance.BorderColor = 'lightgray'
    $ApplyButton.DataBindings.DefaultDataSourceUpdateMode = 0
    $main_form.Controls.Add($ApplyButton)                                                                                       #Add "Save" button to bottom of main form to create a new AD User

    # Save Button Click- 

$ApplyButton.Add_Click({
    if(Get-ADUser -Filter{ SamAccountName -eq $EmployeeID }){
        $OkButton.PerformClick()
        #Set-ADUser 
    }
    #else{
        #New-ADUser `
        #-Username $UserName -GivenName $Firstname -Surname $Lastname $DisplayName $Fullname -EmployeeID $EmployeeID `
        #-OfficePhone $PhoneNum -EmailAddress $Email -HomeDrive $HomeFolder -EmployeeNumber $EmployeeNum `
        #-Title $Title -Department $Department -Manager $Manager -Company $Company -PostalCode $MailStop
    #}
})

    ################ Help Button ################

    $HelpButton                         = New-Object System.Windows.Forms.Button
    $HelpButton.Text                    = 'Help'
    $HelpButton.FlatStyle               = 'flat'
    $HelpButton.BackColor               = "white"
    $HelpButton.Location                = New-Object System.Drawing.Size(330,475)
    $HelpButton.Size                    = New-Object System.Drawing.Size(80,12)
    $HelpButton.AutoSize                = $true
    $HelpButton.FlatAppearance.BorderColor = 'lightgray'
    $HelpButton.DataBindings.DefaultDataSourceUpdateMode = 0
    $main_form.Controls.Add($HelpButton)                                                                                        #Add "help" button to bottom of main form - DISPLAY HELP MENU/INFO HERE


##########################################################################################################################

[void] $main_form.ShowDialog()