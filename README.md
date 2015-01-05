Whack-a-Mole
============

Find malware hidden in customer binaries by invoking Halo API to get hashes and pipe that to virustotal.  Output a pretty report with recommended remediation.  

The plan for this repo is to parse the JSON resulting from an API call to Halo.  This only field we care about is 'contents', which is the hash value we are going to send to virustotal.

###Integration Test files:
A Centos 6.5 server is used for this test, hosted as a Vagrant box on my netbook.
Share available on request.
* **README.md**   The one you're reading now...
* **test file:      fim_scan.txt**   The results from Halo when queried for fim_policies from a known baseline
* **processed data: hashes.txt**  The hashes from the 'contents' field of the Halo File Integrity Management scan
* **virustotal report: vt.txt**   The results from virustotal when provided hashes.txt

###Usage:

>wam.rb (-s SEARCHPREFIX|-a) [-c CONFIGFILE]

>This script generates a report for all servers if -a is used, or just the servers with SEARCHPREFIX in the server label if -s is used.

>Make sure you correctly configure config.conf.  You can use -c to specify a different configuration file.  Otherwise, ./config.conf is assumed.  In config.conf: search_field will determine the metadata field that SEARCHPREFIX is applied to to create the list of servers that will be reported on.


