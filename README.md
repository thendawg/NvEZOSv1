# NvEZOSv1
Release V1.02

This is a private testing/staging area, I don't recommend downloading anything from here unless you know what you're doing. Checkout www.nvezos.com for latest ISO/install info.

V1.02 Code currently undergoing final verification.

Fix List V1.01 -
1) Resolved issue where system was able to be initialized before install of all components completed resulting in several critical components (primarilly ssh) not being installed.
2) Now using nvidia-384 driver, in testing tends to be more stable, less issues with overclock, and supports the new GP106 mining cards - hashrates appear to be the same.
3) Nouveau driver is blacklisted - should not load now under any circumstance. This should resolve the blackscreen issue for people trying to install with a monitor not on the nvidia GPU, however, I have not been able to test this for certain.
4) Resolved cuda dependency that was causing some installs to hang.
