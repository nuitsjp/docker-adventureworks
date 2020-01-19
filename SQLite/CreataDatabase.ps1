$database_path = 'AdventureWorksLT.db'

if(Test-Path $database_path){
  Remove-Item $database_path
}

Copy-Item AdventureWorksLT_blank.db $database_path