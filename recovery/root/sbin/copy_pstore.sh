#!/sbin/sh

# Aguarda o cart∆o SD estar montado
if ! mountpoint -q /external_sd; then
    mount -t auto /dev/block/mmcblk1p1 /external_sd
fi

PSTORE_PATH="/sys/fs/pstore"
DATE="$(date +%Y%m%d-%H%M%S)"
LOG_DIR="/external_sd/pstore_logs_$DATE"

# Verifica se existe pstore e SD montado
if [ -d "$PSTORE_PATH" ] && [ "$(ls -A $PSTORE_PATH)" ]; then
    mkdir -p "$LOG_DIR"
    cp -r $PSTORE_PATH/* "$LOG_DIR/"
fi

