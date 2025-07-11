#cloud-config
package_upgrade: true
packages:
  - apache2
runcmd:
  - sudo git clone https://github.com/movinalot/fortigate-demo-files.git
  - sudo cat fortigate-demo-files/index.html | sed "s/machine-name/${hostname}/g" > index.html
  - sudo mv index.html fortigate-demo-files/index.html
  - sudo cp -r fortigate-demo-files/* /var/www/html/