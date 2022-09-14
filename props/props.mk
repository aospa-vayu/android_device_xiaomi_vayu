PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.btstack.enable.twsplus=true \
    persist.vendor.btstack.enable.lpa=true \
    persist.vendor.bt.a2dp.aac_whitelist=false

PRODUCT_PRODUCT_PROPERTIES += \
    vendor.audio.adm.buffering.ms=6 \
    aaudio.mmap_policy=1 \
    persist.vendor.audio_hal.dsp_bit_width_enforce_mode=24 \
	vendor.audio.hal.output.suspend.supported=false \
    vendor.audio.offload.track.enable=false
