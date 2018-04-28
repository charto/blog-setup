# blog-setup

Collection of scripts for setting up [Ghost](https://ghost.org/) and [NodeBB](https://nodebb.org/) inside [Docker](https://www.docker.com/).

For more information, see the [installation instructions blog post](https://charto.net/blog/blog-setup/) hosted using this exact setup.
With this repo you should have it all running in under 15 minutes!

The end result right out of the box will look like this:

[**Blog**](https://charto.net/blog/)

![Blog main page](https://user-images.githubusercontent.com/778781/39398239-a86cb39e-4b13-11e8-8857-6fdf2ea653d2.png)

**Blog admin**

![Blog admin page](https://user-images.githubusercontent.com/778781/39398240-abf676da-4b13-11e8-815f-4ea6aafa7505.png)

[**Forum**](https://charto.net/forum/)

![Forum main page](https://user-images.githubusercontent.com/778781/39398241-b1459f26-4b13-11e8-90b5-440c96882ae7.png)

**Forum admin**

![Forum admin page](https://user-images.githubusercontent.com/778781/39398243-b3bfbf16-4b13-11e8-93d6-7093ea45ec2d.png)

## Installation

You need an Ubuntu system for easiest setup. It should probably be a virtual machine hosted somewhere.
First SSH to your server like this (or run it locally):

```bash
ssh -L 8443:127.0.0.1:443 -L 2368:127.0.0.1:2368 -L 4567:127.0.0.1:4567 xxx.xxx.xxx.xxx
```

Replace the `xxx`'s with your IP. The extra `-L` port forwarding flags are for gaining private access
to the blog and forum for setting up admin passwords before making the site public.

Then set up Docker:

```bash
sudo apt-get update
sudo apt-get install software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install -y docker-ce
```

Then set up the blog, forum and database:

```bash
sudo mkdir -p /opt/blog
sudo chown --reference ~ /opt/blog
chmod a+rX /opt/blog
cd /opt/blog
git clone https://github.com/charto/blog-setup.git .
sudo ./setup.sh
```

Finally, you can see it run:

- [localhost:2368/blog/](http://localhost:2368/blog/)
- [localhost:4567/forum/](http://localhost:4567/forum/)

Please see the [blog post](https://charto.net/blog/blog-setup/)
regarding finishing touches before making it public.

# License

[Unlicense](https://raw.githubusercontent.com/charto/blog-setup/master/LICENSE)
