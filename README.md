sudo apt-get install libpam0g-dev

/etc/pam.d/rpam:

auth sufficient pam_krb5.so
account sufficient pam_permit.so