# Understanding of OSI & TCP/IP Models

This document explains the OSI and TCP/IP models, breaking down their layers, purposes, and real-world applications.


## Table of Contents

- [OSI Model](#osi-model)
- [TCP/IP Model](#tcpip-model)


## OSI Model

The OSI (Open Systems Interconnection) model is a theoretical model of networking. This model shows us how a packet traverses through a network in seven different layers.

- [Application Layer](#layer-7-application-layer)
- [Presentation Layer](#layer-6-presentation-layer)
- [Session Layer](#layer-5-session-layer)
- [Transport Layer](#layer-4-transport-layer)
- [Network Layer](#layer-3-network-layer)
- [Data Link Layer](#layer-2-data-link-layer)
- [Physical Layer](#layer-1-physical-layer)


### Layer 7: Application Layer

- It is the top layer of the OSI model and closest to the end user.
- It provides an interface to send and receive data from user.
- Protocol Data Unit: Data

- **High level protcols** are involved for resource sharing or remote file access.
- It supports concurrent protocols like HTTP, FTP, SMTP, and DNS for seamless network operations.

- **Example:** Web browsers and Email programs; they are directly integrated into the application layer through the functions of communication.


### Layer 6: Presentation Layer

- Protocol Data Unit: Data
- It acts as a translator of data between a networking service and an application

- Converts data into formats that are readable by the Application Layer; also handles
  - character encoding
  - data compression
  - encryption/decryption

- **Protocols:**
  - SSL ensures secure communication between devices by encrypting data, maintaining its integrity, and providing authentication.
  - TLS improves encryption, authentication, and overall security. TLS is widely used for secure web browsing, replacing SSL.

- **Example:** Watching a YouTube video where data is compressed and formatted correctly for display.


### Layer 5: Session Layer

- Responsible for establishing and managing active communication sessions between two devices.
- Protocol Data Unit: Data
- Enables two-way data exchanges, either one at a time or simultaneously, and helps in recovering from interruptions by using checkpoints.
- **Protocols:**
  - PPTP (Point-to-Point Tunneling Protocol)
  - RPCP (Remote Procedure Call Protocol)
  - SDP (Sockets Direct Protocol)
- **Example:** Maintaining your secure online banking session until you log out.


### Layer 4: Transport Layer

- Protocol Data Unit: Segment, Datagram
- **Purpose:** Ensures complete and error-free data delivery between devices.
- **Protocols:** TCP (Transmission Control Protocol), UDP (User Datagram Protocol).
- **Example:** Streaming a movie on Netflix. TCP ensures all parts of the movie arrive in sequence.


### Layer 3: Network Layer

- Protocol Data Unit: Packet
- Responsible for routing and forwarding packets across multiple networks.
- **Protocols:** IP (Internet Protocol), ICMP (Internet Control Message Protocol), OSPF (Open Shortest Path First).
- **Example:** When you visit `www.example.com`, IP addresses guide the data packets to the correct server location.


### Layer 2: Data Link Layer

- Protocol Data Unit: Frame
- Handles reliable node-to-node data transmission and manages error detection.
- **Protocols:** Ethernet, Wi-Fi (IEEE 802.11), ARP (Address Resolution Protocol)
- **Example:** When your Wi-Fi router assigns a MAC address to your laptop, ensuring that your data packets don't collide with others.


### Layer 1: Physical Layer

- Protocol Data Unit: Bit, Symbol
- Responsible for transmission and reception of raw bit streams over a physical medium.
- **Technologies:** Ethernet cables, fiber optics, radio frequencies
- **Example:** Connecting your laptop to the internet using a LAN cable or Wi-Fi signals.


---

## TCP/IP Model

A simpler and more practical approach with just four layers.

- [Application Layer](#1-application-layer)
- [Transport Layer](#2-transport-layer)
- [Internet Layer](#3-internet-or-network-layer)
- [Network Access Layer](#4-network-access-layer)

It is the actual implementation of networking. The TCP/IP model uses the TCP/IP protocol suite, which we just commonly refer to as TCP/IP.



### 1. Application Layer

- The top layer of the TCP/IP model.
- Equivalent to OSI Application, Presentation, and Session Layers
- Responsible for end-to-end communication and error-free delivery of data.

- **Protocols:**
  - **HTTP** (Hypertext Transfer Protocol) and **HTTPS** (Hypertext Transfer Protocol Secure) - manage communications between web browsers and servers
  - **SSH** (Secure Shell) - sets up a secure encrypted session over a TCP/IP connection
  - **NTP** (Network Time Protocol) - used to synchronize the clocks on our computer to one standard time source


### 2. Transport Layer

- Same as OSI Transport Layer.

- Exchange data receipt acknowledgments and retransmit missing packets to ensure that packets arrive in order and without error.

- Determines how data will be transmitted, includes
  - checking the correct ports
  - the integrity of the data
  - and basically delivering our packets.

- **Protocols:**
  - TCP (Transmission Control Protocol) - reliable data delivery
  - UDP (User Datagram Protocol) - unreliable data delivery


### 3. Internet or Network Layer

- It has same functionality as the OSI Network layer.
- Responsible for the logical transmission of data over the entire network.
- **Protocols:**
  - IP (Internet Protocol) - Helps route packets from one machine to another.
  - ICMP (Internet Control Message Protocol) - Helps tell us what is going on, such as error messages and debugging information.


### 4. Network Access Layer

- This layer specifies how to send data across a physical piece of hardware.
- Equivalent to Physical & Data Link Layers.
- **Examples:** Data travelling through Ethernet, fiber, etc.
