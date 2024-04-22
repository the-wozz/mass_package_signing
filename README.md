# mass_package_signing

What it do: Automatically signs ALL pkgs in the 'Packages' folder with a certificate.

Instructions:

Download script 'package_signing' [aka THIS script) (https://github.com/the-wozz/mass_package_signing/blob/main/package_signing.sh) 

Install certificate file (double click on .cer file and it will add it to Keychain) to be signed by script

Make sure keychain certicate name matches the certName variable (line 12)

Run the script with the following command via Terminal: sh /SCRIPT/LOCATION/packaging_signing.sh

The script will create the following directories on first run:
+ /Users/CURRENT USER/Packages
+ /Users/CURRENT USER/Packages/Signed Packages

Place your UNSIGNED pkgs in /Users/CURRENT USER/Packages, run the script again; sh /SCRIPT/LOCATION/packaging_signing.sh

Script will output messages via Terminal with:
package SIGNED!
or
ERROR signing package

All SIGNED packages will be placed in 'Signed Packages' folder [/Users/CURRENT USER/Packages/Signed Packages]
