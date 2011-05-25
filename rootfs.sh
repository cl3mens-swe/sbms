df -h | awk  '/\/$/ {print "rootfs " $3 " / " $2}'
