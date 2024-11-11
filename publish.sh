#! /bin/sh
rclone \
  --config rclone.conf \
  --s3-no-check-bucket \
  --progress copyto \
  dist/resume.pdf r2:cameron-dev-assets/resume.pdf
