#!/bin/bash
rclone --progress --config=rclone.conf copy dist/resume.pdf r2:resume.pdf
