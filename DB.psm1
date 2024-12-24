function Read-DBQuery ([string]$query) {
    return $query | psql --csv $env:DATABASE_URL | ConvertFrom-Csv
}

function Read-PlayScripts {
    return Read-DBQuery "
    SELECT scripts.*, authors.name as author_name FROM scripts LEFT JOIN authors ON authors.id = author
    "
}

Export-ModuleMember -Function Read-DBQuery,Read-PlayScripts