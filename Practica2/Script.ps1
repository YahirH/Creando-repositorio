Function TestPoShArgs {
"Me encanta PowerShell $Args"
}
TestPoShArgs un monton !!

$servicios= Get-Service
foreach($elemento in $servicios){
Write-host $elemento.Name "-->" $elemento.status
}


if($servicios){
 
   Write-Host "Se ha realizado con exito"
}