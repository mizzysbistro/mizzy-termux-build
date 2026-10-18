# Checksum verification

Before using downloaded SDKs or installer archives:

1. Prefer official project release pages and documented installation instructions.
2. Compare SHA-256 checksums against values published through the project's trusted release channel, when available.
3. Treat a checksum from the same untrusted download location as insufficient proof of authenticity.
4. Do not commit secrets or private signing keys here.

To calculate a checksum for a downloaded file in Termux:
```sh
sha256sum path/to/downloaded-file
```

This directory intentionally contains no fabricated checksum values.
