# Host Discovery

Este repositorio contiene un script de Bash llamado HostDiscover.sh que te permite descubrir y enumerar los dispositivos activos en tu red local.

## Requisitos previos

## Compatibilidad y Pruebas

Este script ha sido probado en el sistema operativo **KaliLinux 2023.2** y se ha verificado su funcionamiento correctamente en esta plataforma. 
Aunque se ha probado específicamente en **KaliLinux**, el script debería funcionar en otros sistemas operativos basados en **Unix** que cuenten con los comandos y herramientas necesarios.

Si encuentras algún problema o tienes dificultades para ejecutar el script en tu entorno específico, no dudes en abrir un problema o solicitud de mejora en este repositorio.
Ten en cuenta que este script utiliza comandos y herramientas específicas de Linux, por lo que su compatibilidad con otros sistemas operativos puede variar.

- Se requiere tener Bash instalado en tu sistema.
- Debes conceder permisos de ejecución al archivo HostDiscovery.sh antes de ejecutarlo.

## Instrucciones de uso

1. Clona o descarga este repositorio en tu máquina local.
2. Abre una terminal y navega hasta el directorio donde se encuentra el archivo HostDiscover.sh.
3. Ejecuta el siguiente comando para otorgar permisos de ejecución al archivo:

    ```shell
    chmod +x HostDiscovery.sh
    ```

4. Una vez que hayas otorgado los permisos de ejecución, ejecuta el script utilizando el siguiente comando:

    ```shell
    ./HostDiscover.sh
    ```

    Esto iniciará el escaneo de la red local y mostrará la información de los dispositivos activos, como la dirección IP, el estado, la dirección MAC y el sistema operativo (Unix, Windows, u otro).

5. Espera a que el script finalice y observe los resultados en la terminal.

    ```shell
    Host: 10.0.0.21  - Estado: ACTIVO  - MAC: B8:AC:6F:A7:53:44 - Sistema: Windows
    Host: 10.0.0.6   - Estado: ACTIVO  - MAC: 3C:52:82:B4:5A:5F - Sistema: Windows
    Host: 10.0.0.17  - Estado: ACTIVO  - MAC: DC:A6:32:82:DA:CA - Sistema: Unix
    Host: 10.0.0.8   - Estado: ACTIVO  - MAC: DA:54:AA:BD:69:16 - Sistema: Unix
    Host: 10.0.0.16  - Estado: ACTIVO  - MAC: 6A:22:BD:94:AD:36 - Sistema: Unix
    Host: 10.0.0.3   - Estado: ACTIVO  - MAC: F6:56:86:DC:6A:B1 - Sistema: Unix
    ```
## Notas adicionales

- Asegúrate de que tu sistema esté conectado a la red local antes de ejecutar el script.
- Ten en cuenta que este script utiliza comandos específicos de Linux y puede no ser compatible con otros sistemas operativos.

¡Disfruta descubriendo los dispositivos activos en tu red local con Host Discovery!
