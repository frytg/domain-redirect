# domain-redirect

## Redirect Service

Serverless runtime to redirect all requests to a domain set via an environment variable based on docker and nginx.

Kudos to @ahmetb for the [Cloud Run demo](https://github.com/ahmetb/multi-process-container-lazy-solution). Read the blog post for more details: [ahmet.im/blog/cloud-run-multiple-processes-easy-way/index.html](https://ahmet.im/blog/cloud-run-multiple-processes-easy-way/index.html).

## Setup

Set up a Cloud Run instance using this container with an environment variable `DOMAIN`. Make sure this variable includes the URL scheme (`https://`) and is not the **same** domain you are redirecting from, otherwise this will produce a recursive redirect. Then create a Domain Mapping and add the four A and AAAA (when using apex domain) or one CNAME record(s) to your DNS.

Keep in mind that Cloud Run by its design obviously has a higher cold-start time than running such a redirect service from a VM, Kubernetes or similar. But on the other hand you save a lot of maintenance and hassle since the TLS certificate will be generated for you by GCP. Cloud Run also automatically upgrades http to https, so make sure your final destination supports that as well.

The path will be passed along to the new domain, so make sure it can handle it or generate appropriate 404s. Also don't add a trailing slashes to the `DOMAIN` variable. E.g. use `DOMAIN=https://www.example.com`

This service uses `301` redirects (*Moved Permanently*), which means browsers (should) remember the redirect for the next visit. It is not recommended to use this service for temporary redirects.

## Examples

Use-cases where this service can be helpful:

- Redirect `old-domain.com/abc` to `new-domain.com/abc`
- Redirect `example.com` to `www.example.com`

## Author

- Daniel Freytag - [Github](https://github.com/FRYTG) / [Twitter](https://twitter.com/FRYTG)
