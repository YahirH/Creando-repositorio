
##WALTER YAHIR

###Funcion para ver estatus de un perfil especifico en firewall

function Ver-Estatus {
    param([Parameter(Mandatory)] [ValidateSet('Private','Public')] $perfil)
    begin{
        Write-Host "Hola te mostrare el perfil que elejiste: " $perfil}
    process{
        Get-NetFirewallProfile $perfil}
    end{
        Write-Host "Listo ha terminado esta funcion"}
}


###Funcion para cambia el estatus
function Cambiar-Estatus {
    param([Parameter(Mandatory)] [ValidateSet('True','False')] $activo,
    [Parameter(Mandatory)] [ValidateSet('Public','Private')] [string] $perfil)
    begin{
        Write-Host "Este es el estatus sin cambios" $perfil
        Get-NetFirewallProfile $perfil | select Name, Enabled | format-list}
    process{
        Write-Host "Se cambio el estatus"
        Set-NetFirewallProfile -Name $perfil -Enabled $activo | select Name, Enabled | format-list}
    end{
        Write-Host "Este es el estado actual"
        Get-NetFirewallProfile -Name $perfil | select Name, Enabled | format-list}
}

###Funcion para ver el perfil de mi red

function Ver-Plred {
    param([Parameter(Mandatory)] [string] $nomred)
    Get-NetConnectionProfile -Name $nomred | select Name,NetworkCategory | format-list
}


###Funcion para cambiar la red a otro tipo de perfil

function Cambiar-Perfilred {
    param([Parameter(Mandatory)] [ValidateSet('Public','Private')] $perfil,
    [Parameter(Mandatory)] [string] $nomred)
    begin{
        Write-Host "Este es el perfil sin cambios"
        Get-NetConnectionProfile -Name $nomred | select Name, NetworkCategory | format-list}
    process{
        Write-Host "Se ha cambiado!"
        Set-NetConnectionProfile -Name $nomred -NetworkCategory $perfil}
    end{
        Write-Host "Aqui nos muestra el perfil cambiado"
        Get-NetConnectionProfile -Name $nomred | select Name,NetworkCategory | format-list}
}


###Funcion para ver las reglas de bloqueo

function Ver-Reglasblock {
    param([Parameter()] [string] $activo = 'True',
    [Parameter()] [string] $vari = 'Block')
    Get-NetFirewallRule -Enabled $activo -EdgeTraversalPolicy $vari
}


###Funcion para crear una nueva regla
function Crear-Regla {
    param([Parameter()] [string] $nombredis = "Nuevaregla1")
    New-NetFirewallRule -DisplayName $nombredis -Profile Public
}


###Funcion para remover la regla creada

function Quitar-Regla {
    param([Parameter()] [string] $nombredis = "Nuevaregla1")
    Remove-NetFirewallRule -DisplayName $nombredis
}
