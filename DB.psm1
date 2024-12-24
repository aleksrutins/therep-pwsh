function Sync-Migrations {
    psql $env:DATABASE_URL -f ./schema.sql
}

function Read-DBQuery ([string]$query) {
    return $query | psql $env:DATABASE_URL --csv | ConvertFrom-Csv
}

function Read-PlayScripts {
    return Read-DBQuery "
    SELECT scripts.*, authors.name as author_name FROM scripts LEFT JOIN authors ON authors.id = author
    "
}

Export-ModuleMember Read-DBQuery,Read-PlayScripts,Sync-Migrations