# Questions Related to the Study URI Initiative

## Purpose
Add your questions or discussion directly on this page using the "Edit" button, 
or clone the repository as needed. 
.

## Questions


**Question**: What is needed to ensure that a URI resolves differently when on the internal company network
vs external (public) browsing? 

The de-refernced public URI must only provide publicly available information,
while the internal deferencing yields company confidential information in addition to the public content.

Ideally, a single URI deferences differently based on context (internal vs external).


**Answer**:

Redirects for resources served over HTTP/1.1 for linked data purposes typically use the [303 See Other][303] code. These sorts of redirects (used by w3id.org and others) can only specify a single URI that the client should follow (as far as I can tell). 

Thus, the implementation of internal vs external would need to be implemented by whatever server is listed in the redirect using something like a [rewrite condition][rewritecond] that has a clause to redirect the IP address of clients on the private network to an internal URI.

For example, if we have the URI <http://w3id.org/some-pharma> and someone visits this in a Web browser, the browser will receive a `303 See Other` redirect that points to <http://www.some-pharma.com>. Then the server at <http://www.some-pharma.com> will check the IP address of the browser, using said rewrite condition, to see if they are connected to the internal network/vpn. If the browser is connecting from an IP that is internal to the company (i.e., on the network/vpn), then they are redirected to <http://intranet.some-pharma.com> where intenal content is displayed, else they simply see the public site.

So, I'm pretty sure that the implementation of this external/internal redirection rests on whomever owns the server at the initial 303 redirect. At least that is my initial take on it.

[303]: <https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html#sec10.3.4>
[rewritecond]: <https://httpd.apache.org/docs/current/mod/mod_rewrite.html#rewritecond>




