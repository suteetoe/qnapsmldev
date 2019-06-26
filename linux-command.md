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
