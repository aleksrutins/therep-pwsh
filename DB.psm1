function Sync-Migrations {
    psql $env:DATABASE_URL -f ./schema.sql
}

function Read-DBQuery ([string]$query) {
    return $query | psql $env:DATABASE_URL --csv | ConvertFrom-Csv
}

function Read-PlayScripts {
    return Read-DBQuery "
    SELECT Scripts.*, Users.Name as AuthorName FROM Scripts LEFT JOIN Authors ON Authors.Id = Author
    "
}

Export-ModuleMember Read-DBQuery,Read-PlayScripts,Sync-Migrations