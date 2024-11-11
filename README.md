# Resume

My [resume](https://assets.cameron.dev/resume.pdf).

## Build Instructions

`make`

#### Required Tools
- [Docker](https://www.docker.com/)

## Publish Instructions

`make publish`

#### Required Tools

- [rclone](https://https://rclone.org/)

#### `rclone` Configuration File

Create a file `rclone.conf` with the following contents and secrets:

```yaml
[r2]
type = s3
provider = Other
access_key_id = ${CLOUDFLARE_R2_ACCESS_KEY}
secret_access_key = ${CLOUDFLARE_R2_ACCESS_KEY_ID}
endpoint = https://${CLOUDFLARE_R2_ACCOUNT_ID}.r2.cloudflarestorage.com
acl = private
```
