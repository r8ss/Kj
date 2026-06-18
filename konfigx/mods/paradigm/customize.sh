if [ ! "$(GET_PROP "system" "ro.unica.codename")" ]; then
    # Match latest Samsung's flagship device codename
    ROM_CODENAME="$(basename "$MODPATH")"
    SET_PROP "system" "ro.unica.codename" "${ROM_CODENAME^}"
    unset ROM_CODENAME
fi

# 2025 Audio Pack
LOG_STEP_IN "- Adding 2025 Audio Pack"
DELETE_FROM_WORK_DIR "system" "system/hidden/INTERNAL_SDCARD/Music/Samsung/Over_the_Horizon.mp3"
ADD_TO_WORK_DIR "pa2qxxx" "system" \
    "system/hidden/INTERNAL_SDCARD/Music/Samsung/Over_the_Horizon.m4a" 0 0 644 "u:object_r:system_file:s0"
DELETE_FROM_WORK_DIR "system" "system/media/audio/notifications"
DELETE_FROM_WORK_DIR "system" "system/media/audio/ringtones"
if $TARGET_AUDIO_SUPPORT_ACH_RINGTONE; then
    ADD_TO_WORK_DIR "pa2qxxx" "system" "system/etc/ringtones_count_list.txt" 0 0 644 "u:object_r:system_file:s0"
    ADD_TO_WORK_DIR "pa2qxxx" "system" "system/media/audio/notifications" 0 0 755 "u:object_r:system_file:s0"
    ADD_TO_WORK_DIR "pa2qxxx" "system" "system/media/audio/ringtones" 0 0 755 "u:object_r:system_file:s0"
    SET_PROP "vendor" "ro.config.ringtone" "ACH_Galaxy_Bells.ogg"
    SET_PROP "vendor" "ro.config.notification_sound" "ACH_Brightline.ogg"
    SET_PROP "vendor" "ro.config.alarm_alert" "ACH_Morning_Xylophone.ogg"
    SET_PROP "vendor" "ro.config.media_sound" "Media_preview_Over_the_horizon.ogg"
    SET_PROP "vendor" "ro.config.ringtone_2" "ACH_Atomic_Bell.ogg"
    SET_PROP "vendor" "ro.config.notification_sound_2" "ACH_Three_Star.ogg"
else
    ADD_TO_WORK_DIR "a56xnaxx" "system" "system/etc/ringtones_count_list.txt" 0 0 644 "u:object_r:system_file:s0"
    ADD_TO_WORK_DIR "a56xnaxx" "system" "system/media/audio/notifications" 0 0 755 "u:object_r:system_file:s0"
    ADD_TO_WORK_DIR "a56xnaxx" "system" "system/media/audio/ringtones" 0 0 755 "u:object_r:system_file:s0"
    SET_PROP "vendor" "ro.config.ringtone" "Galaxy_Bells.ogg"
    SET_PROP "vendor" "ro.config.notification_sound" "Brightline.ogg"
    SET_PROP "vendor" "ro.config.alarm_alert" "Morning_Xylophone.ogg"
    SET_PROP "vendor" "ro.config.media_sound" "Media_preview_Over_the_horizon.ogg"
    SET_PROP "vendor" "ro.config.ringtone_2" "Atomic_Bell.ogg"
    SET_PROP "vendor" "ro.config.notification_sound_2" "Three_Star.ogg"
fi
ADD_TO_WORK_DIR "pa2qxxx" "system" \
    "system/media/audio/ui/Media_preview_Over_the_horizon.ogg" 0 0 644 "u:object_r:system_file:s0"
APPLY_PATCH "system" "system/priv-app/SecSoundPicker/SecSoundPicker.apk" \
    "$MODPATH/brandsound/SecSoundPicker.apk/0001-Enable-SUPPORT_SAMSUNG_BRAND_SOUND_ONEUI_7.patch"
LOG_STEP_OUT


