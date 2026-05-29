1. sudo nvim /etc/doas.conf
   permit persist re

2. doas nvim /etc/systemd/journald.conf
   doas systemctl restart systemd-journald
   storage-persistent 
   systemMaxUse 500k
   MaxFileSec 6h

3. doas nvim /etc/resolv.conf

   nameserver 192.168.1.147
 
   doas chattr +i /etc/resolv.conf

4.  doas nvim /etc/makepkg.conf

    CFLAGS="-march=znver4 -mtune=znver4 -O3 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security \
        -fstack-clash-protection -fcf-protection \
        -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"

        MAKEFLAGS="-j12"

        PACMAN_AUTH=(doas)


5. yay --sudo doas --save

6. doas nvim /etc/sysctl.d/99-sysctl.conf
   
   net.ipv6.conf.all.disable_ipv6=1
   net.ipv6.conf.default.disable_ipv6=1
   net.ipv6.conf.lo.disable_ipv6=1
   net.ipv4.tcp_fastopen = 3
   net.ipv4.tcp_congestion_control = bbr
   net.core.default_qdisc = fq

7. doas nvim /etc/pacman.conf

   Color
   ILoveCandy

8. sudo systemctl mask systemd-userdbd.service systemd-userdbd.socket 

9. mkdir -p ~/Pictures/wp && mkdir -p ~/Pictures/Screenshots  
