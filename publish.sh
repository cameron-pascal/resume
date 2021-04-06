#! /bin/sh

# Make sure parameters are set:
if [ $# != 3 ]; then
     echo "Incorrect number of arguments. Expected 3."
     echo "Usage: secrets_file dest_file dest_file_url"
     exit 1
fi

# Get variables/secrets for publishing.
secrets_file=$1
dest_file=$2
dest_file_url=$3
dest_user=`jq .destinationUser $secrets_file | sed 's/"//g'`
dest_host=`jq .destinationHost $secrets_file | sed 's/"//g'`
dest_dir=`jq .destinationDir $secrets_file | sed 's/"//g'`
cf_zone=`jq .cloudflareZone $secrets_file | sed 's/"//g'`
cf_token=`jq .cloudflareToken $secrets_file | sed 's/"//g'`

# Remove currently published file.
echo "---Removing old file from remote.---"
ssh "$dest_user@$dest_host" "rm -f $dest_file"

ret_code=$?
if [ $ret_code != 0 ]; then
     printf "Removing old file failed. ssh returned code %d\n" $ret_code
     exit 1
fi

echo "Done.\n"

# Publish new file.
echo "---Publishing new file to remote.---"
scp -r $dest_file "$dest_user@$dest_host":"$dest_dir"

ret_code=$?
if [ $ret_code != 0 ]; then
     printf "Publishing new file failed. ssh returned code %d\n" $ret_code
     exit 1
fi

echo "Done.\n"

# Purge Cloudflare cache.
echo "---Purging Cloudflare cache.---"

purge_data=`printf '{"files":["%s"]}' $dest_file_url`
curl -sS -X POST "https://api.cloudflare.com/client/v4/zones/$cf_zone/purge_cache" \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer $cf_token" \
     --data $purge_data \
     -o /dev/null

ret_code=$?
if [ $ret_code != 0 ]; then
     printf "Purging Cloudflare cache failed. ssh returned code %d" $ret_code
     exit 1
fi

echo "Done."
