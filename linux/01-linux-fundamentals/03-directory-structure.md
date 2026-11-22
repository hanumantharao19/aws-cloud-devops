# Linux Directory Structure and Filesystem Hierarchy

## 1. Learning Objectives

By the end of this class, students will understand:

- What a Linux filesystem is.
- How the Linux directory structure works.
- What the root directory (`/`) means.
- Important Linux directories and their purposes.
- The difference between absolute and relative paths.
- How to navigate directories using Linux commands.
- Where configuration files, logs, application files, and user data are stored.
- How DevOps engineers use Linux directories in real-time projects.

---

## 2. Introduction to Linux Filesystem

A filesystem is a way of organizing and storing files and directories on a storage device.

Linux uses a hierarchical directory structure.

Unlike Windows, where different drives commonly have separate drive letters such as `C:` and `D:`, Linux organizes files under a single root directory represented by `/`.

All files and directories are organized under this root directory.

### Linux Filesystem Structure

```text
/
├── bin
├── boot
├── dev
├── etc
├── home
│   ├── ec2-user
│   └── ubuntu
├── lib
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin
├── srv
├── sys
├── tmp
├── usr
│   ├── bin
│   ├── lib
│   ├── local
│   └── share
└── var
    ├── log
    ├── cache
    ├── lib
    └── tmp
```

**Important:** The exact directory contents may differ depending on the Linux distribution. Some distributions use symbolic links, for example `/bin` may point to `/usr/bin`.

---

## 3. What Is the Root Directory (`/`)?

The root directory is the starting point of the Linux filesystem hierarchy.

Every Linux file and directory is located under `/`.

Example:

```bash
cd /
pwd
```

Output:

```text
/
```

List directories under root:

```bash
ls -l /
```

Display all entries, including hidden entries:

```bash
ls -la /
```

### Important Difference

| Path | Meaning |
|---|---|
| `/` | Root directory of the filesystem |
| `/root` | Home directory of the root user |
| `/home` | Parent directory for normal users' home directories |
| `/home/ubuntu` | Home directory of a user named ubuntu |

Do not confuse `/` and `/root`.

---

## 4. Important Linux Directories

Let's understand the directories that DevOps engineers commonly work with.

### 4.1 `/bin` – Essential User Commands

Contains essential user commands.

Examples may include:

- `ls`
- `cp`
- `mv`
- `cat`
- `mkdir`

Check:

```bash
ls -l /bin
```

On many modern Linux distributions, `/bin` is a symbolic link to `/usr/bin`.

### 4.2 `/boot` – Boot Files

Contains files required during the Linux boot process.

Examples:

- Linux kernel images
- initramfs images
- Bootloader-related files

Check:

```bash
ls -lh /boot
```

DevOps use case:

When troubleshooting Linux boot issues, engineers may inspect files and configurations related to the boot process.

### 4.3 `/dev` – Device Files

Linux represents devices through special files under `/dev`.

Examples:

| Device | Purpose |
|---|---|
| `/dev/sda` | Common disk device name |
| `/dev/nvme0n1` | Common NVMe disk device name |
| `/dev/null` | Discards data written to it |
| `/dev/zero` | Provides zero bytes when read |
| `/dev/tty` | Represents a terminal device |

Check:

```bash
ls -l /dev
```

Example:

```bash
echo "test" > /dev/null
```

The output is discarded.

DevOps use case:

Storage troubleshooting often involves identifying disks and their device names.

### 4.4 `/etc` – Configuration Files

Contains system-wide configuration files.

Examples:

| File | Purpose |
|---|---|
| `/etc/passwd` | User account information |
| `/etc/group` | Group information |
| `/etc/hostname` | System hostname |
| `/etc/hosts` | Local hostname-to-IP mappings |
| `/etc/fstab` | Filesystem mount configuration |
| `/etc/ssh/sshd_config` | SSH server configuration |
| `/etc/os-release` | Linux distribution information |

Check:

```bash
ls -l /etc
```

Read OS information:

```bash
cat /etc/os-release
```

Check hostname:

```bash
cat /etc/hostname
```

DevOps use case:

When configuring SSH, Nginx, application services, or system settings, engineers frequently work with files under `/etc`.

**Important:** Always take a backup before modifying important configuration files.

Example:

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
```

### 4.5 `/home` – Normal User Directories

Contains home directories for normal users.

Example:

```text
/home
├── ubuntu
├── ec2-user
└── devops
```

Check:

```bash
ls -l /home
```

Move to your home directory:

```bash
cd ~
```

Check current home directory:

```bash
echo $HOME
```

Check current user:

```bash
whoami
```

DevOps use case:

Engineers store scripts, Git repositories, configuration files, and personal project files under their home directories.

Example:

```text
/home/ubuntu/
    scripts/
    projects/
    aws-cloud-devops/
```

### 4.6 `/root` – Root User Home Directory

The `/root` directory is the home directory of the root user.

It is different from `/`.

Check:

```bash
sudo ls -la /root
```

To move to the root user's home directory:

```bash
sudo -i
cd ~
pwd
```

Expected output:

```text
/root
```

Return to your normal user:

```bash
exit
```

DevOps use case:

The root account is used for administrative operations. Normal users should use `sudo` when elevated privileges are required rather than working as root all the time.

### 4.7 `/lib` – Shared Libraries

Contains essential shared libraries and kernel-related modules required by the system.

Check:

```bash
ls -l /lib
```

On many modern distributions, `/lib` may be a symbolic link to a directory under `/usr/lib`.

DevOps use case:

Applications depend on system libraries. Missing or incompatible libraries can cause application startup failures.

### 4.8 `/media` – Removable Media Mount Points

Used as a mount location for removable media such as USB drives.

Check:

```bash
ls -l /media
```

### 4.9 `/mnt` – Temporary Mount Point

Commonly used by administrators to temporarily mount filesystems.

Example:

```bash
sudo mkdir -p /mnt/data
```

To mount a filesystem, the appropriate device and filesystem type must be known.

Example syntax:

```bash
sudo mount /dev/sdb1 /mnt/data
```

Do not execute this example blindly. `/dev/sdb1` must exist and must be the correct filesystem.

Check mounted filesystems:

```bash
findmnt
```

DevOps use case:

When attaching additional storage to an EC2 instance, engineers may mount a filesystem to a directory such as `/mnt/data`.

### 4.10 `/opt` – Optional Application Software

Used for additional application software and third-party packages.

Example:

```text
/opt/
    company-app/
    monitoring-agent/
    custom-tool/
```

Check:

```bash
ls -l /opt
```

DevOps use case:

Custom application binaries or third-party software may be installed under `/opt`.

### 4.11 `/proc` – Process and Kernel Information

`/proc` is a virtual filesystem that provides information about running processes and kernel information.

It does not behave like a normal disk directory.

Examples:

| File | Information |
|---|---|
| `/proc/cpuinfo` | CPU information |
| `/proc/meminfo` | Memory information |
| `/proc/uptime` | System uptime |
| `/proc/mounts` | Mounted filesystems |

Check CPU information:

```bash
cat /proc/cpuinfo
```

Check memory information:

```bash
cat /proc/meminfo
```

Check uptime:

```bash
cat /proc/uptime
```

DevOps use case:

Monitoring tools use information exposed by the kernel and virtual filesystems to monitor CPU, memory, and process information.

### 4.12 `/run` – Runtime System Data

Contains runtime information created after system startup.

Examples include:

- PID files
- Service-related runtime information
- Socket files

Check:

```bash
ls -l /run
```

Runtime data is generally temporary and does not represent permanent application storage.

### 4.13 `/sbin` – System Administration Commands

Traditionally contains important system administration commands.

Examples may include:

- `fsck`
- `reboot`
- `shutdown`

Check:

```bash
ls -l /sbin
```

On modern distributions, `/sbin` may be a symbolic link to `/usr/sbin`.

### 4.14 `/srv` – Service Data

Used for data provided by services running on the system.

For example, a system may store data served by an FTP or web service under `/srv`.

Check:

```bash
ls -l /srv
```

The exact usage depends on the administrator's configuration.

### 4.15 `/sys` – Kernel and Device Information

`/sys` is a virtual filesystem that exposes information about devices, drivers, and kernel subsystems.

Check:

```bash
ls -l /sys
```

DevOps use case:

System tools and monitoring agents can inspect device and kernel information through `/sys`.

### 4.16 `/tmp` – Temporary Files

Used for temporary files created by applications and users.

Example:

```bash
cd /tmp
touch test.txt
ls -l
```

Many Linux systems clean temporary files automatically based on their configuration.

**Important:** Do not store important or permanent application data in `/tmp`.

DevOps use case:

Temporary installation files, build artifacts, and short-lived processing files may be created under `/tmp`.

### 4.17 `/usr` – User Applications and Shared Resources

Contains many user applications, libraries, documentation, and shared resources.

Important subdirectories:

| Directory | Purpose |
|---|---|
| `/usr/bin` | User commands and applications |
| `/usr/sbin` | System administration programs |
| `/usr/lib` | Libraries |
| `/usr/local` | Locally installed software |
| `/usr/share` | Architecture-independent shared data |

Check:

```bash
ls -l /usr
```

Check executable locations:

```bash
which python3
which bash
which curl
```

DevOps use case:

Linux tools, programming languages, and system utilities are commonly installed in directories under `/usr`.

### 4.18 `/var` – Variable Data

Contains files that frequently change while the system is running.

Important subdirectories:

| Directory | Purpose |
|---|---|
| `/var/log` | System and application logs |
| `/var/cache` | Cached application data |
| `/var/lib` | Persistent application state |
| `/var/tmp` | Temporary files preserved longer than typical `/tmp` files |

Check:

```bash
ls -l /var
```

Check log files:

```bash
ls -lh /var/log
```

Check disk usage:

```bash
sudo du -sh /var/log
```

DevOps use case:

When an application fails, engineers inspect logs under `/var/log` or use the system journal.

Examples:

- Ubuntu Nginx logs: `/var/log/nginx/`
- Amazon Linux / RHEL Apache logs: commonly `/var/log/httpd/`
- Ubuntu Apache logs: commonly `/var/log/apache2/`

Log locations depend on service configuration and distribution.

---

## 5. Important Directories for DevOps Engineers

The following directories are especially important in day-to-day DevOps work.

| Directory | Why DevOps Engineers Use It |
|---|---|
| `/etc` | Application and system configuration |
| `/var/log` | Troubleshooting application and system logs |
| `/home` | User scripts and Git repositories |
| `/opt` | Custom application installations |
| `/tmp` | Temporary build and installation files |
| `/usr/bin` | Common command-line tools |
| `/var/lib` | Application state and service data |
| `/mnt` | Additional storage mounts |
| `/proc` | Runtime process and kernel information |
| `/boot` | Boot-related troubleshooting |

### Real-Time Example: Nginx

Suppose you install Nginx on a Linux EC2 instance.

Common locations:

```text
/etc/nginx/
    nginx.conf

/var/log/nginx/
    access.log
    error.log

/usr/sbin/
    nginx

/var/www/html/
    index.html
```

## 6. Absolute Path vs Relative Path

Linux supports two common ways to specify file and directory locations.

### Absolute Path

An absolute path starts from the root directory `/`.

Examples:

```text
/home/ubuntu
/etc/ssh/sshd_config
/var/log
/usr/bin/python3
```

Example:

```bash
cd /var/log
pwd
```

Output:

```text
/var/log
```

### Relative Path

A relative path is specified based on the current working directory.

Example:

```bash
cd /home/ubuntu
cd projects
```

If `/home/ubuntu/projects` exists, you move into that directory.

### Important Path Symbols

| Symbol | Meaning |
|---|---|
| `/` | Root directory |
| `.` | Current directory |
| `..` | Parent directory |
| `~` | Current user's home directory |
| `-` | Previous working directory |



## 8. Understanding Filesystem Mount Points

In Linux, storage devices and filesystems are made available through mount points.

A mount point is a directory where a filesystem is attached.

Example:

Suppose an EC2 instance has:

- Root EBS volume
- Additional EBS volume

The additional volume can be formatted with a filesystem and mounted at `/data`.

Example layout:

```text
/
├── etc
├── home
├── var
└── data
```

### DevOps Use Case

An application may need separate storage for uploaded files, database data, or application logs.

Engineers can attach additional storage and mount it at an appropriate location, depending on the application's requirements.

---

## 9. Real-Time DevOps Scenario

### Scenario: Application Deployment on an EC2 Instance

Assume you are deploying an e-commerce application on an AWS EC2 Linux instance.

Your application needs:

- Configuration files
- Application code
- Logs
- Temporary files
- User data

A possible directory layout:

```text
/
├── etc/
│   └── ecommerce/
│       └── application.conf
│
├── opt/
│   └── ecommerce/
│       └── application files
│
├── var/
│   └── log/
│       └── ecommerce/
│           └── application.log
│
├── tmp/
│   └── ecommerce-build/
│
└── home/
    └── ec2-user/
        └── deployment-scripts/
```
