# Inherit AOSP device configuration for toro.
$(call inherit-product, device/samsung/toro/full_toro.mk)

# Inherit common product files.
$(call inherit-product, vendor/orca/config/common.mk)

# Inherit fnv specific configurations

# Setup device specific product configuration.
PRODUCT_NAME := orca_toro
PRODUCT_BRAND := google
PRODUCT_DEVICE := toro
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=yakju BUILD_ID=JOP40C BUILD_FINGERPRINT=google/yakju/toro:4.2.1/JOP40D/533553:user/release-keys PRIVATE_BUILD_DESC="yakju-user 4.2.1 JOP40D 533553 release-keys" BUILD_NUMBER=533553

# Tuna Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/orca/overlay/tuna

# Copy toro specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/orca/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip \
    vendor/orca/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/orca/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd
