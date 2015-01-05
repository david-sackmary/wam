Whack-a-Mole
============

Find malware hidden in customer binaries by invoking Halo API to get hashes and pipe that to virustotal.  print a pretty report with recommended remediation.  

============

The plan for this repo is to parse the JSON resulting from an API call to Halo.  This only field we care about is 'contents', which is the hash value we are going to send to virustotal.

Integration Test files are to be provided:
    test file:  fim_scan.txt    ~  The results from Halo when queried for fim_policies from a known baseline scan.
    processed data:  hashes.txt ~   The hashes from the 'contents' field of the Halo File Integrity Management scan
    virtustotal report: vt.txt  ~   The results from virustotal when provided hashes.txt

A Centos 6.5 server is used for this test, hosted as a Vagrant box on my netbook.
Share available on request.
