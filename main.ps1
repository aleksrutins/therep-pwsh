Import-Module .\Env.psm1
Import-Module .\DB.psm1
Import-Module Pode.Web

Use-DotEnv

Sync-Migrations

Start-PodeServer {
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging -Levels Error,Warning,Informational

    Add-PodeEndpoint -Address ($env:LISTEN_ADDR ?? "localhost") -Port ($env:PORT ?? 8080) -Protocol Http

    Use-PodeWebTemplates -Title 'The Rep'

    Add-PodeWebPage -Name 'New Works' -Icon 'Script-Outline' -ScriptBlock {
        New-PodeWebCard -Content @(
            New-PodeWebTable -Name 'Scripts' -ScriptBlock {
                foreach ($script in (Read-PlayScripts)) {
                    [ordered]@{
                        Name = $script.name
                        Description = $script.desc
                        Author = $script.author_name
                    }
                }
            }
        )
    }

    Add-PodeWebPage -Name 'One Acts' -Icon 'Drama-Masks' -ScriptBlock {
        
    }
}