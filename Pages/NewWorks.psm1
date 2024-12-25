Import-Module `
    Pode.Web, `
    .\DB.psm1

function Show-NewWorksPage {
    New-PodeWebCard -Content @(
        New-PodeWebButton -Name 'Click me' -ScriptBlock {
            Show-PodeWebToast "Clicked"
        }
        
        New-PodeWebTable -Name 'Scripts' -ScriptBlock {
            foreach ($script in (Read-PlayScripts)) {
                [ordered]@{
                    Name = $script.Name
                    Description = $script.Desc
                    Author = $script.AuthorName
                }
            }
        }
    )
}

Export-ModuleMember Show-NewWorksPage