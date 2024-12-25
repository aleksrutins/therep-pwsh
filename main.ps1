Import-Module `
    .\Env.psm1, .\DB.psm1, .\Pages\NewWorks.psm1, `
    Pode.Web

Use-DotEnv

Sync-Migrations

Start-PodeServer {
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging -Levels Error,Warning,Informational

    Add-PodeEndpoint -Address ($env:LISTEN_ADDR ?? "localhost") -Port ($env:PORT ?? 8080) -Protocol Http

    Use-PodeWebTemplates -Title 'The Rep'

    Add-PodeWebPage -Name 'New Works' -Icon 'Script-Outline' -ScriptBlock {
        Show-NewWorksPage
    }

    Add-PodeWebPage -Name 'One Acts' -Icon 'Drama-Masks' -ScriptBlock {
        
    }
}