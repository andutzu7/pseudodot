#!/bin/bash

subdomain_remotehost="root@208.85.23.128"
identity_file_path="/home/andy/.ssh/chadbsd/id_rsa"

main_site_remotehost="root@pseudot.org"

if [ $# -lt 1 ]; then
    echo "Usage: $0 <subdomain name>"
    exit 1
fi


subdomain="$1"

copy_latest_post_to_main(){

	target_directory="$subdomain.pseudot.org/content/posts"
	dest_path="pseudot.org/content/posts"
	latest_post=$(ls -td "$target_directory"/*/ | head -n 1)

	cp -r $latest_post $dest_path

}

impose_changes_on_subdomain() {

	site_name="$subdomain.pseudot.org"
	hugo -s $site_name
	scp -r -i $identity_file_path "$site_name/public" root@208.85.23.128:/root
	ssh -i $identity_file_path $subdomain_remotehost -t "cd /var/www/Pseudot;rm -rf $site_name;mv /root/public $site_name;rcctl restart nginx"


}

impose_changes_on_main() {

	site_name="pseudot.org"
	hugo -s $site_name
	scp -r "$site_name/public" $main_site_remotehost:/root
	ssh $main_site_remotehost -t "cd /var/www/Pseudot;rm -rf $site_name;mv /root/public $site_name;systemctl restart nginx"

}

case "$subdomain" in
    "blog")
        copy_latest_post_to_main
	impose_changes_on_subdomain
	impose_changes_on_main
	echo "Finished deploying"
        ;;
    "books")
        copy_latest_post_to_main
	impose_changes_on_subdomain
	impose_changes_on_main
	echo "Finished deploying"
        ;;
    "programming")
        copy_latest_post_to_main
	impose_changes_on_subdomain
	impose_changes_on_main
	echo "Finished deploying"
        ;;
    "photos")
	impose_changes_on_subdomain
	echo "Finished deploying"
        ;;
    "uc")
        copy_latest_post_to_main
	impose_changes_on_subdomain
	impose_changes_on_main
	echo "Finished deploying"
        ;;
    "pseudot")
	impose_changes_on_main
	echo "Finished deploying"
        ;;
    *)
        echo "Unknown option: $param"
        ;;
esac
