# Generic product
PRODUCT_NAME := orca
PRODUCT_BRAND := orca
PRODUCT_DEVICE := generic

# Build Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.orca.version=$(TARGET_PRODUCT)_012_EXP_$(shell date +"%m-%d-%Y")

PRODUCT_PACKAGE_OVERLAYS += vendor/orca/overlay/common

# T-Mobile theme engine
include vendor/orca/config/themes_common.mk

# Build.Prop Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=300 \
    ro.kernel.android.checkjni=0 \
    windowsmgr.max_events_per_sec=280 \
    net.bt.name=Android \
    dalvik.vm.heapstartsize=48m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=384m \
    dalvik.vm.dexopt-flags=v=n,o=v,u=n,m=y \
    dalvik.vm.lockprof.threshold=850 \
    dalvik.vm.verify-bytecode=false \
    dalvik.vm.stack-trace-file=/data/anr/traces.txt \
    ro.kernel.android.checkjni=0 \
    ro.media.enc.jpeg.quality=100 \
    debug.sf.hw=1 \
    debug.performance.tuning=1 \
    video.accelerate.hw=1 \
    persist.sys.purgeable_assets=1 \
    windowsmgr.max_events_per_sec=280 \
    pm.sleep_mode=1 \
    ro.HOME_APP_ADJ=1 \
    ro.media.dec.jpeg.memcap=8000000 \
    ro.media.enc.hprof.vid.bps=8000000 \
    ro.media.enc.hprof.vid.fps=65 \
    ro.media.enc.jpeg.quality=100 \
    ro.ril.disable.power.collapse=0 \
    debug.composition.type=gpu \
    ro.telephony.call_ring.delay=500 \
    ro.max.fling_velocity=15000 \
    ro.min.fling_velocity=10000 \
    ro.lge.proximity.delay=20 \
    mot.proximity.delay=20 \
    ro.kernel.checkjni=0 \
    net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.wifi=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.umts=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.gprs=4096,87380,256960,4096,16384,256960 \
    net.tcp.buffersize.edge=4096,87380,256960,4096,16384,256960 

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=JOP40D BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_EST_DATE=$(shell date +"%s")

# Bring in all audio files
include frameworks/base/data/sounds/NewAudio.mk

# Extra Ringtones
include frameworks/base/data/sounds/AudioPackageNewWave.mk

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# CyanogenMod Packages
PRODUCT_PACKAGES += \
        CMFileManager \
	DSPManager \
        libcyanogen-dsp \
        audio_effects.conf

# Orca Packages
PRODUCT_PACKAGES += \
        PerformanceControl \
        SuperSU \
        Torch \
	OrcaWallpapers        

# Blobs common to all devices
PRODUCT_COPY_FILES += \
    vendor/orca/prebuilt/common/xbin/su:system/xbin/su \
    vendor/orca/prebuilt/common/xbin/sysrw:system/xbin/sysrw \
    vendor/orca/prebuilt/common/xbin/sysro:system/xbin/sysro

# Misc Files & init.d files
PRODUCT_COPY_FILES +=  \
    vendor/orca/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/orca/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/orca/prebuilt/common/etc/init.d/00fnv:system/etc/init.d/00fnv \
    vendor/orca/prebuilt/common/etc/init.d/01cherrybomb:system/etc/init.d/01cherrybomb \
    vendor/orca/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/orca/prebuilt/common/etc/init.d/98fruit:system/etc/init.d/98fruit \
    vendor/orca/prebuilt/common/etc/init.local.rc:root/init.xylon.rc \
    vendor/orca/prebuilt/common/bin/sysinit:system/bin/sysinit

# Google Proprietaries
PRODUCT_COPY_FILES +=  \
    vendor/orca/prebuilt/common/lib/libgtalk_jni.so:system/lib/libgtalk_jni.so \
    vendor/orca/prebuilt/common/lib/libgtalk_stabilize.so:system/lib/libgtalk_stabilize.so \
    vendor/orca/prebuilt/common/lib/libjni_filtershow_filters.so:system/lib/libjni_filtershow_filters.so \
    vendor/orca/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so \
    vendor/orca/prebuilt/common/lib/libjni_mosaic.so:system/lib/libjni_mosaic.so \
    vendor/orca/prebuilt/common/lib/liblightcycle.so:system/lib/liblightcycle.so
