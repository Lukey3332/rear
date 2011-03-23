# Stop SELinux if present with tar backup
[ -f /selinux/enforce ] || return
case "${BACKUP_PROG}" in
	tar)
		cat /selinux/enforce > $TMP_DIR/selinux.mode
		echo "0" > /selinux/enforce
		Log "Temporarely stop SELinux enforce mode with BACKUP=${BACKUP} and BACKUP_PROG=${BACKUP_PROG} backup"
	;;
	*) # do nothing
		:
	;;
esac