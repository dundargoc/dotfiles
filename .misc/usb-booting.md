# usb booting

Replace sda with the relevant block name of the usb. Check name with command
`lsblk`.

```
sudo dd if=/dev/zero of=/dev/sda bs=512 count=1 conv=notrunc
sudo dd bs=4M if=input.iso of=/dev/sda conv=fdatasync
```

For creating a bootable windows (10) usb the easiest way I found was to use
woeusb and made sure to use NTFS instead of fat. There's currently a bug in
woeusb that makes it take a long time and it looks like it's stuck, but as long
as you wait a bit it'll finish after a while.
