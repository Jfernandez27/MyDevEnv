La siguiente guía explica cómo instalar el entorno de desarrollo. Se asume que ya se ha instalado lo siguiente:
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- La actualización de [Windows 10 2004, Build 19041 o superior](https://support.microsoft.com/es-cl/help/3159635/windows-10-update-assistant).

# Instalar Windows Subsystem for Linux 2 (WSL 2)

Para instalar WSL 2, es necesario abrir una terminal PowerShell como Administrador e ingresar los siguientes comandos:

```shell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

El comando instala la versión 1 de WSL, por lo que ahora debemos actualizar a la versión 2, ingresando el siguiente comando:

```shell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Reiniciamos nuestro equipo, y WSL2 ya debería estar habilitado.

Por último, establecemos que la versión por defecto de WSL sea la 2.

```shell
wsl --set-default-version 2
```

Podría aparecer el siguiente mensaje al ejecutar el comando anterior:

`WSL 2 requires an update to its kernel component. For information please visit https://aka.ms/wsl2kernel`

Si aparece, es necesario descargar y ejecutar la actualización del kernel Linux de WSL2, lo que se puede hacer desde [aquí](https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel)

Para más información, consultar la página oficial de Microsoft sobre la instalación de [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

# Instalar distribución de Linux en Windows

Luego de instalar WSL, se debe instalar cualquier distribución de Linux disponible en la Microsoft Store. Para los siguientes ejemplos se utilizó Ubuntu 20.04.

Luego de instalar la distribución, es necesario acceder a sus archivos. Para ello se debe agregar como una ubicación de red en "Este equipo".

![](https://user-images.githubusercontent.com/62489778/86285053-f3ac9200-bbb1-11ea-9e21-9a5584e02f14.png)

![](https://user-images.githubusercontent.com/62489778/86285305-5dc53700-bbb2-11ea-9e04-6c595aa25362.png)

Las direcciones de red de las distribuciones en WSL siguen el siguiente formato:

```batch
\\wsl$\{nombre_distribucion}-{version}
```

Por ejemplo, para Ubuntu 20.04:

```batch
\\wsl$\Ubuntu-20.04
```

**Nota 1:** Existe la posibilidad de acceder a los archivos directamente desde el disco `C`, pero existe el riesgo de corromper la distribución o que los archivos nuevos, no sean reconocidos.

**Nota 2:** Aunque la distribución esté instalada en el mismo equipo, las limitaciones de las carpetas de red en Windows aún se aplican.

## Cambiar la versión del WSL de una distribución

Si se instaló una distribución antes de actualizar el WSL a la versión 2, es necesario cambiar la versión del WSL en el que se esta ejecutando la distribución misma. Para ver que versión de WSL se está usando, se usa el siguiente comando:

```shell
wsl --list --verbose
```

Mostrando la siguiente lista:

![](https://user-images.githubusercontent.com/62489778/86287473-383a2c80-bbb6-11ea-8556-d73ad234d213.png)

Para cambiar la versión del WSL se ingresa el siguiente comando:

```shell
wsl --set-version <distribution name> <versionNumber>`
```

Por ejemplo, para Ubuntu-20.04:

```shell
wsl --set-version Ubuntu-20.04 2`
```

## Activar distribución por defecto

Para verificar qué distribución se utiliza por defecto en WSL, ejecutar:

```shell
wslconfig /l
```

Y luego seleccionar una:

```shell
wslconfig /setdefault <NombreDeDistribución>
```

# Activar Docker en la distribución

En Docker Desktop accedemos a Ajustes o Settings, Recursos, Integración WSL:

![](https://user-images.githubusercontent.com/62489778/86287941-1f7e4680-bbb7-11ea-9598-756c1dab523f.png)

Aquí se nos mostrarán las distribuciones que son compatibles con WSL 2. Para que Docker acceda a ellas, solo se debe activar cada distribución en la lista.

![](https://user-images.githubusercontent.com/62489778/86288435-e8f4fb80-bbb7-11ea-86bf-b8bd2d0a3bc3.png)

Luego solo falta aplicar y reiniciar Docker:

![](https://user-images.githubusercontent.com/62489778/86288820-9405b500-bbb8-11ea-809d-7f60ce1f4d5c.png)
