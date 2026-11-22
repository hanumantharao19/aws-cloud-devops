# Linux Architecture

## 1. Learning Objectives

By the end of this session, students will understand:

- What Linux architecture means.
- The major components of a Linux operating system.
- The difference between hardware, kernel, shell, and applications.
- The difference between user space and kernel space.
- How applications communicate with the Linux kernel.
---

## 2. Introduction to Linux Architecture

Linux architecture describes how different components of a Linux operating system work together to execute commands, run applications, manage memory, communicate with hardware, and provide services.

Linux follows a layered architecture.

### High-Level Linux Architecture

```text
+--------------------------------------+
|          User Applications           |
|                                      |
|  Nginx | Docker | Jenkins | Python   |
+--------------------------------------+
|             Shell                    |
|                                      |
|       Bash | Zsh | Sh                |
+--------------------------------------+
|          System Libraries            |
|                                      |
|             glibc                    |
+--------------------------------------+
|             Kernel                   |
|                                      |
| Process Management                   |
| Memory Management                    |
| Device Drivers                       |
| File System Management               |
| Network Management                   |
+--------------------------------------+
|             Hardware                 |
|                                      |
| CPU | RAM | Disk | Network Devices   |
+--------------------------------------+
```

### Main Components

1. Hardware
2. Kernel
3. System Libraries
4. Shell
5. User Applications

Let's understand each component.

---

## 3. Hardware Layer

Hardware is the physical infrastructure on which Linux runs.

Examples:

- CPU
- RAM
- Hard disk or SSD
- Network interface card
- Keyboard and mouse
- Storage devices

### Example in Cloud Environments

When you create an EC2 instance in AWS, AWS provides virtualized computing resources.

For example:

- 2 vCPUs
- 4 GB RAM
- 30 GB EBS storage
- Network interface

Linux uses these resources through the kernel.

## 4. Linux Kernel

The kernel is the core component of the Linux operating system.

It acts as an interface between hardware and software.

Applications cannot directly control hardware resources. They request services from the kernel.

### Responsibilities of the Kernel

**1. Process Management**

The kernel creates, schedules, and terminates processes.

Example:

```bash
ps aux
```

This command displays running processes.

**2. Memory Management**

The kernel manages RAM allocation and memory usage.

Example:

```bash
free -h
```

**3. Device Management**

The kernel communicates with hardware using device drivers.

Examples:

- Disk drivers
- Network drivers
- USB drivers

**4. File System Management**

The kernel provides access to files and directories through supported file systems.

Examples:

- ext4
- XFS
- Btrfs

**5. Network Management**

The kernel handles networking operations such as TCP/IP communication, routing, and network interfaces.

## 5. User Space and Kernel Space

Linux divides execution into two important areas:

1. User Space
2. Kernel Space

### User Space

User space is where normal applications and user-level processes execute.

Examples:

- Nginx
- Docker CLI
- Python applications
- Jenkins
- Shell commands
- Monitoring agents

Applications generally cannot directly access protected kernel memory or hardware.

### Kernel Space

Kernel space is where the Linux kernel executes with privileged access to system resources.

It handles:

- CPU scheduling
- Memory management
- Hardware access
- Device drivers
- Networking
- File system operations

### Architecture Diagram

```text
+--------------------------------------+
|              USER SPACE              |
|                                      |
|  Nginx                               |
|  Docker CLI                          |
|  Python Application                  |
|  Jenkins                             |
|  Bash Shell                          |
|                                      |
+--------------------------------------+
|         SYSTEM CALL INTERFACE        |
+--------------------------------------+
|             KERNEL SPACE             |
|                                      |
|  Process Management                  |
|  Memory Management                   |
|  File System Management              |
|  Network Management                  |
|  Device Drivers                      |
|                                      |
+--------------------------------------+
|               HARDWARE               |
|                                      |
|  CPU | RAM | Disk | Network          |
+--------------------------------------+
```
## 6. What Is a Shell?

A shell is a command-line interpreter that allows users to interact with the operating system.

When you execute a Linux command, the shell interprets the command and starts the required program.

### Popular Linux Shells

| Shell | Description |
|---|---|
| Bash | Bourne Again Shell; widely used in Linux |
| Sh | Traditional Unix shell interface |
| Zsh | Extended shell with additional interactive features |
| Fish | User-friendly interactive shell |



The shell receives the command and launches the `pwd` program.

The program determines the current working directory and displays the result.

---

## 7. System Libraries

System libraries provide reusable functions that applications can use to interact with operating system services.

For example, many Linux applications use the GNU C Library (`glibc`).

Instead of every application implementing low-level operating system interactions independently, libraries provide common functions.