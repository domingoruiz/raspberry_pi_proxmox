# Manual para el uso de máquinas virtuales Proxmox desde una Raspberry Pi

Acceder a máquinas virtuales Proxmox desde una Raspberry Pi puede dar bastante juego, ya que te da la posibilidad de montar puestos de trabajo con un coste muy pequeño y centralizar en un único lugar toda la información del centro / empresa. En este manual vamos a ver como lo podemos hacer de una forma sencilla y cómoda.

## Requisitos

Para poder llevar a cabo esta idea vamos a necesitar un servidor Proxmox funcionando correctamente con al menos una máquina virtual. También vamos a necesitar una Raspberry Pi (cualquier versión).

Ambos deben estar en la misma red y deben ser accesibles entre ellos.

### 1º PASO: Instalación base en Raspberry Pi

Para ello debemos instalar en la Raspberry Pi la última versión de Raspberry Pi OS (antiguo Raspbian). Para ello debemos descargar la imagen correspondiente desde [aquí](https://www.raspberrypi.com/software/operating-systems/) y quemarla en una microSD (podemos usar [Balena Etcher](https://www.balena.io/etcher/)). 

### 2º PASO: Arrancamos la Raspberry Pi 

Una vez encendida debemos seguir los pasos del asistente inicial y actualizar el sistema.

``
apt-get update && apt-get -y upgrade
``

### 3º PASO: Instalar virt-viewer

Virt-viewer es el cliente que usaremos para conectarnos a las máquinas virtuales Proxmox. La instalación se realiza con el siguiente comando:

``
apt-get install virt-viewer
``

### 4º PASO: Probar conexión

Ya tenemos nuestra Raspberry lista para conectarnos a Proxmox. Podemos probarlo accediendo a Proxmox web desde el navegador y descargando un token spice. Si todo ha ido bien al abrir el archivo debes ver tu máquina virtual.

### 5º PASO: Acceso directo en el escritorio

Si siempre vas a acceder a la misma máquina virtual podemos crear un acceso directo en el escritorio que al pulsar sobre él encienda y se conecte a la máquina virtual sin necesidad de acceder a Proxmox.

Para ello debes copiar [script_conexion.sh](script_conexion.sh) en el escritorio de tu Raspberry Pi. Luego debes modificarlo para configurar las variables con los datos correspondientes a tu servidor.

Una vez modificado y tenga permisos de ejecución asignados cada vez que lo ejecutes se abrirá remote-viewer con tu máquina virtual de forma automática.

## Dudas y errores

Espero que te haya servido el manual y en caso de que se haya quedado desactualizado o no funcione no dudes en reportarlo mediante una issue. 

Gracias