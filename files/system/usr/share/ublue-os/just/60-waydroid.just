[group('Waydroid')]
waydroid-init:
    #!/usr/bin/env bash
    set -euo pipefail

    sudo waydroid init \
        -c https://ota.waydro.id/system \
        -v https://ota.waydro.id/vendor

    sudo systemctl enable --now waydroid-container.service

    echo "Waydroid is ready."
    echo "Run: waydroid show-full-ui"

[group('Waydroid')]
waydroid-init-gapps:
    #!/usr/bin/env bash
    set -euo pipefail

    sudo waydroid init \
        -s GAPPS \
        -c https://ota.waydro.id/system \
        -v https://ota.waydro.id/vendor

    sudo systemctl enable --now waydroid-container.service

    echo "Waydroid with GAPPS is ready."
    echo "Run: waydroid show-full-ui"

[group('Waydroid')]
waydroid-reset:
    #!/usr/bin/env bash
    set -euo pipefail

    waydroid session stop 2>/dev/null || true
    sudo systemctl stop waydroid-container.service || true
    sudo rm -rf /var/lib/waydroid
    sudo waydroid init -f \
        -c https://ota.waydro.id/system \
        -v https://ota.waydro.id/vendor
    sudo systemctl enable --now waydroid-container.service