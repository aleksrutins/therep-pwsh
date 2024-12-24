function Use-DotEnv {
    if (Test-Path .env -PathType Leaf) {
        Get-Content .env | ForEach-Object {
            $name, $value = $_.split('=')
            Set-Content env:\$name $value
        }
    }
}

Export-ModuleMember -Function Use-DotEnv