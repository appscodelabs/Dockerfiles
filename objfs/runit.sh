#!/bin/bash
export > /etc/envvars

# http://stackoverflow.com/questions/36815146/how-to-loop-over-in-pairs-in-bash/36815204#36815204
while [ "$#" -gt 0 ]; do
	echo "Processing $1, $2"
	if [ "$1" == "s3" ]; then
		cmd="mkdir -p /mnt/data/$1-$2"; echo $cmd
		$cmd
		cmd="mkdir -p /etc/service/$1-$2"; echo $cmd
		$cmd
		cat >"/etc/service/$1-$2/run" <<EOL
#!/bin/bash
exec 1> >(logger -s -p daemon.info -t $1-$2)
exec 2> >(logger -s -p daemon.error -t $1-$2)
source /etc/envvars

echo "Starting s3fs daemon for $1://$2 ..."
exec s3fs $2 /mnt/data/$1-$2 -o passwd_file=/mnt/auth/$1-$2
EOL
		chmod 755 /etc/service/$1-$2/run
	elif [ "$1" == "gs" ]; then
		cmd="mkdir -p /mnt/data/$1-$2"; echo $cmd
		$cmd
		cmd="mkdir -p /etc/service/$1-$2"; echo $cmd
		$cmd
		cat >"/etc/service/$1-$2/run" <<EOL
#!/bin/bash
exec 1> >(logger -s -p daemon.info -t $1-$2)
exec 2> >(logger -s -p daemon.error -t $1-$2)
source /etc/envvars

echo "Starting gcsfuse daemon for $1://$2 ..."
exec /usr/bin/gcsfuse --foreground --key-file=/mnt/auth/$1-$2 $2 /mnt/data/$1-$2
EOL
		chmod 755 /etc/service/$1-$2/run
	else
	  	echo "Unknown bucket type $1://$2"
	fi
	echo ""
  	shift; shift
done

echo "Starting runit..."
exec /usr/sbin/runsvdir-start

# ##### SAMPLE ######
# /usr/bin/gcsfuse --foreground --key-file=/gcs.json appscode-dev /mnt/data
# COPY gcs.json /gcs.json
# ENTRYPOINT ['gcsfuse', '--key-file=/gcs.json', 'appscode-dev', '/mnt/gcs']

# echo "AKIAJVLZ7FV6JBVMVUGA:FVHtkNkxYduWBzV2ZmEfe1OOVhAU+2vora9ybq89" > /mnt/auth/s3.conf
# chmod 600 /mnt/auth/s3.conf
# s3fs appscode-dev /mnt/data -o passwd_file=/mnt/auth/s3.conf
