# Resume
My [resume](https://assets.cameron.dev/resume.pdf).

## Build Instructions

`make`

#### Required Tools
- [LibreOffice](https://www.libreoffice.org/)
- [ghostscript](https://www.ghostscript.com/)
- [Hack typeface](https://sourcefoundry.org/hack/)

## Publish Instructions

`make publish`

#### Required Tools
- [jq](https://stedolan.github.io/jq/)

#### Secrets File

Create a file at ~/.secrets/resume_secrets.json with the following
contents:

```json
{
    "destinationUser": "<remote_username>",
    "destinationHost": "<remote_hostname>",
    "destinationDir": "<remote_destination_dir>",
    "cloudflareToken": "<cloudflare_api_token>",
    "cloudflareZone": "<cloudflare_zone_id>"
}
```
