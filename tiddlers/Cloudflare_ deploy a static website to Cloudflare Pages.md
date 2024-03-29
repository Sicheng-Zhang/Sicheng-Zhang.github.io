<br><br>

**- Prepare the website and host the files on a Git repository**

**- Deploy the website on Cloudflare Pages**

1. Create a Cloudflare account and log in to the dashboard. Under `Workers & Pages`, create a page by connecting the Git repository hosting the website.

2. Configure the deployment by setting up the page name (e.g., `xxx`), specifying the build command and output directory, and then deploy the website.

3. Upon deployment, the website will be accessible at `xxx.pages.dev`.

**- Set up a custom domain for the website**

1. Get a domain name in advance (e.g., `yyy.com`). Disable `DNSSEC` at the domain registrar.
2.  Use Cloudflare as the primary DNS provider (if not). Add the domain to the Cloudflare dashboard. Then add a DNS record (`CNAME`) for the deployed website.

	<a href="https://ucarecdn.com/d677f2dd-6c1d-4f18-aa91-6ddcad6467fe/cloudflare-1.png
" target="_blank" rel="noopener noreferrer" class="center"><img src="https://ucarecdn.com/d677f2dd-6c1d-4f18-aa91-6ddcad6467fe/cloudflare-1.png
" alt="WESTERLIES" width="500"></a>

3. Log in to the domain registrar and update the nameservers of the domain to Cloudflare's servers.

	<a href="https://ucarecdn.com/ecb36003-d981-46b8-ab47-58153f8e854c/cloudflare-2.png
" target="_blank" rel="noopener noreferrer" class="center"><img src="https://ucarecdn.com/ecb36003-d981-46b8-ab47-58153f8e854c/cloudflare-2.png
" alt="WESTERLIES" width="500"></a>

4. Verify the changes and allow the registrar time to update the nameservers. Access the website at `yyy.com`.
