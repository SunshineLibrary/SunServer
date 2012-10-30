#! /bin/bash
#Scripts used to sync remote content_file from server.
#DB sync is handled by MySQL replication.

rsync -avx --timeout=30 work@42.121.65.247:/home/work/rails/SunServer/public/system ~/rails/SunServer/public/

