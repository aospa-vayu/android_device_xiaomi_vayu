#
# Copyright (C) 2022 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Platform
TARGET_BOARD_PLATFORM := msmnile

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# NFC
TARGET_NFC_SKU := vayu

# QTI
TARGET_COMMON_QTI_COMPONENTS := \
    init \
	bt \
	overlay \
    telephony \
    display \
    perf \
    wlan \
    vibrator \
    adreno \
    nq-nfc \
    usb \
    media-legacy \
	audio

# Fstab
PRODUCT_PACKAGES += \
    fstab.qcom

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.bluetooth@1.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/security/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
    $(LOCAL_PATH)/configs/audio/audio_configs_stock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs_stock.xml \
    $(LOCAL_PATH)/configs/audio/audio_diag.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/audio_diag.cfg \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_configuration_mi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_configuration_mi.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_default_stream_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_default_stream_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_default_stream_volumes_mi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_default_stream_volumes_mi.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_product_strategies.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_product_strategies.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_product_strategies_mi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_product_strategies_mi.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_stream_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_stream_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_stream_volumes_mi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_stream_volumes_mi.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(LOCAL_PATH)/configs/audio/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_pahu.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_pahu.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(LOCAL_PATH)/configs/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9340_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340_qrd.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# ParanoidDoze
PRODUCT_PACKAGES += \
    ParanoidDoze

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.vayu \
    libkeymaster_messages.vendor
    
# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/vayu/vayu-vendor.mk)