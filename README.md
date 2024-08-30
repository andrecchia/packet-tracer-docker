# Cisco Packet Tracer in docker

This repository provides a Docker container for running Cisco's [Packet Tracer](https://learningnetwork.cisco.com/s/packet-tracer-alternative-lab-solutions). After downloading the Packet Tracer tarball, the program is installed within the Docker container, which uses the host's X server to render the GUI.

## Prerequisite:

Ensure that Docker and Docker Compose are installed and set up.

## Instructions:

### 1. Clone this repository

```shell
git clone https://github.com/andrecchia/packet-tracer-docker.git && cd packet-tracer-docker
```

### 2. Download the packet tracer .deb file

Download the Packet Tracer deb package distributed in Cisco's website:

- Log into Cisco Networking Academy (Skills For All / NetAcad) using your Cisco Account. Register an account if you do not have it.
- Once in the Networking Academy portal, download the Packet Tracer from https://skillsforall.com/resources/lab-downloads. The downloaded filename should be something like `Packet_Tracer822_amd64_signed.deb`.
- Place the .deb file in the root of this repository

### 3. Build the image

Execute the following command to build the Docker image. **By running this command, you automatically accept the EULA**:

```shell
docker compose build
```

This process will create an image with Packet Tracer installed, including a `cisco` user within the container.

### 4. Run Packet Tracer inside Docker

To run Packet Tracer inside the Docker container, simply execute:

```shell
docker compose up
```

This command will bind the necessary volumes for X to function properly: `/tmp/.X11-unix` and your `.Xauthority` file. It will also bind two volumes where Packet Tracer configurations and files are stored: [Cisco_Packet_Tracer](./Cisco_Packet_Tracer/) and [pt](./pt/) respectively.
