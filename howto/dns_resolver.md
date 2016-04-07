# Add a nameserver in dns resolver

* Edit `sudo vim /etc/resolvconf/resolv.conf.d/head`, example add a new nameserver `nameserver 8.8.8.8`
* Regenerate '/etc/resolv.conf' using `sudo resolvconf -u`
* Check '/etc/resolv.conf' using `cat /etc/resolv.conf`

You 're done
