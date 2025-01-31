# Low-Rate TCP-Targeted Denial of Service Attacks

This is a reproduction of [Low-Rate TCP-Targeted Denial of Service Attacks](http://www.cs.northwestern.edu/~akuzma/rice/doc/shrew.pdf).

[Blog post](https://reproducingnetworkresearch.wordpress.com/2017/06/05/cs244-17-low-rate-tcp-targeted-denial-of-service-attacks/) ([archive.org](https://web.archive.org/web/20211109101108/https://reproducingnetworkresearch.wordpress.com/2017/06/05/cs244-17-low-rate-tcp-targeted-denial-of-service-attacks/))

[This](https://github.com/hcaseyal/cs244-PA3) repo also seems to be somehow related.

## Steps to reproduce
1.  Create a fresh GCE virtual machine with Ubuntu 16.10, and set firewall
    rules to be able to access the HTTP server that will be started. We
    recommend that you use the following commands to create and connect to the
    instance.  Otherwise, you should perform the corresponding instance
    creation and firewall setup in the GCE web UI.

    ```bash
    gcloud compute instances create --image ubuntu-1610-yakkety-v20170502 --image-project ubuntu-os-cloud --machine-type n1-highcpu-8 --zone us-central1-c --tags http-server,https-server cs244
    gcloud compute firewall-rules create http --allow tcp:80
    gcloud compute ssh cs244
    ```

    Alternatively, spin up an Ubuntu VM.

2.  In your GCE instance, execute the following:

    ```bash
    curl "https://raw.githubusercontent.com/shoeper/low-rate-tcp-targeted-dos-attacks/master/setup.sh" | /bin/bash
    ```

    This script will install Python dependencies (e.g. matplotlib), check out
    and install Mininet.

    The script also clones this repository.

3.  Now, `cd low-rate-tcp-targeted-dos-attacks` and `sudo ./run.sh` to run the
    experiment. Please be patient; a run takes between 1 to 2 hours. If you
    want to have the full results as in our blog post, run with `sudo ./run.sh
    -f`.

4.  After the script runs, it will show you a URL where you can view the
    results. There should be two generated `.png` files in the root directory.
    One (`results-<hostname>-date_rate.png`) will show the normalized
    throughput, i.e., the primary figure we are trying to reproduce. The other
    shows the sender’s cwnd values, plotted over time, for various attack
    period values.

## Troubleshooting

AssertionError
 * Before trying anything else run `reboot` and try `run.sh`, again.
