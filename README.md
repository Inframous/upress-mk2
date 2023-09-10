# WordPress Infrastructure 

This repo contains the what and how to create a deployment of a WordPress site.
The ansible playbook will connect to all servers and install all the right packages <br>and configure everything so we end up with:

- 2 Frontend servers 
- 1 Database
- 1 Load balancer (With passive health checks)

UPDATE (Sep 10th, 2023):  Made to work dynamically, and can IMPORT and existing site, or launch a new instance of WordPress.

Use: Just add your database.sql and a tar/zip file with your front end files to ./ansible/files,
update `stack.yaml` and you're good to go.

##### <br>Some configuration files are seeded (ie. httpd.conf, nginx.conf).

Although this was not tested, you might as well change the ips in the hosts files <br> and also said configuration files, inside `stack.yaml` and, you can probably use this as a pipeline!

Please contact me for any question!
Thank you.
