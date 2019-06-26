## view Logical volumn

```
 $ sudo vgdisplay -v
```

```
  --- Volume group ---
  VG Name               ubuntu-vg
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <499.00 GiB
  PE Size               4.00 MiB
  Total PE              127743
  Alloc PE / Size       1024 / 4.00 GiB
  Free  PE / Size       126719 / <495.00 GiB
  VG UUID               wXUhBk-ILnl-0h2M-x1aL-MZtb-ADzG-UDBG0H

  --- Logical volume ---
  LV Path                /dev/ubuntu-vg/ubuntu-lv
  LV Name                ubuntu-lv
  VG Name                ubuntu-vg
  LV UUID                id9rQe-j72E-CaGg-cYIY-L9Us-v70w-bvs1aZ
  LV Write Access        read/write
  LV Creation host, time ubuntu-server, 2019-06-18 03:00:08 +0000
  LV Status              available
  # open                 1
  LV Size                4.00 GiB
  Current LE             1024
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0

  --- Physical volumes ---
  PV Name               /dev/sda3
  PV UUID               KUxBPU-rHwq-FrLa-DQZs-ZZf5-SWQE-MKBexb
  PV Status             allocatable
  Total PE / Free PE    127743 / 126719


```

```
$ lvmdiskscan
```

```
  /dev/ubuntu-vg/ubuntu-lv [       4.00 GiB]
  /dev/loop1               [     <88.44 MiB]
  /dev/loop2               [     <88.40 MiB]
  /dev/sda2                [       1.00 GiB]
  /dev/sda3                [    <499.00 GiB] LVM physical volume
  1 disk
  3 partitions
  0 LVM physical volume whole disks
  1 LVM physical volume
```


```
$ lvscan
```

```
 ACTIVE            '/dev/ubuntu-vg/ubuntu-lv' [4.00 GiB] inherit

```


## create Logical Volumn in Volumn Group (ubuntu)

```
$ sudo lvcreate -l 100%FREE -n <volumn_name> <volumn_group>
```

```
 # sudo lvcreate -l 100%FREE -n ubuntu-data-lv ubuntu-vg

```
## make ext4 file extension LV
```
$ sudo mkfs.ext4 <logical_volumn_name>
```

```
$ sudo mkfs.ext4 /dev/ubuntu-vg/ubuntu-data-lv
```

## Mount Partition

```
$ sudo mount <logical_volumn_name> <mount_path>
```

```
$ sudo mount /dev/ubuntu-vg/ubuntu-data-lv /media/data/
```

## Add Auto Mount

```
$ echo '<logical_volumn_name> <mount_path> ext4 defaults,nofail 0 0' >> /etc/fstab
```

```
$ echo '/dev/ubuntu-vg/ubuntu-data-lv /media/data/ ext4 defaults,nofail 0 0' >> /etc/fstab
```
