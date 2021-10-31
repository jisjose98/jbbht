#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[*] Bug Bounty Toolkit Installer${NC}"
echo -e "${GREEN}[*] Setting Up Directories${NC}"




cd ..;

mkdir mbht;
cd mbht;

color()
{
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[*] Bug Bounty Toolkit Installer${NC}"
echo -e "${GREEN}[*] Setting Up Directories${NC}"
}
color

cd $HOME
mkdir toolkit
mkdir ~/toolkit/wordlists

echo -e "${GREEN}[*] Installing Essentials${NC}"
sudo apt-get -y update
sudo apt-get -y upgrade
apt-get install -y build-essential
apt-get install -y gcc 
apt-get install -y git
apt-get install -y vim 
apt-get install -y wget 
apt-get install -y curl
apt-get install -y awscli
apt-get install -y inetutils-ping 
apt-get install -y make 
apt-get install -y nmap 
apt-get install -y whois 
apt-get install -y python3
apt-get install -y python-pip 
apt-get install -y perl 
apt-get install -y nikto
apt-get install -y dnsutils 
apt-get install -y net-tools
apt-get install -y zsh
apt-get install -y nano
apt-get install -y tmux
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs


echo -e "${GREEN}[*] Essentials installed${NC}"


#install go
go (){
export GO111MODULE=on
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
					sudo tar -xvf go1.14.2.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi
}

# Nmap
echo -e "${GREEN}[*] Installing Nmap${NC}"
apt-get install -y nmap

# masscan
echo -e "${GREEN}[*] Installing masscan${NC}"
cd ~/toolkit
apt-get install -y libpcap-dev
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make
ln -sf ~/toolkit/masscan/bin/masscan /usr/local/bin/masscan    

# dnsenum
echo -e "${GREEN}[*] Installing dnsenum${NC}"
apt-get install -y cpanminus 
cd ~/toolkit 
git clone https://github.com/fwaeytens/dnsenum.git 
cd dnsenum/ 
chmod +x dnsenum.pl 
ln -s ~/toolkit/dnsenum/dnsenum.pl /usr/bin/dnsenum 
cpanm String::Random 
cpanm Net::IP 
cpanm Net::DNS 
cpanm Net::Netmask
cpanm XML::Writer

# massdns
echo -e "${GREEN}[*] Installing massdns${NC}"
apt-get install -y libldns-dev
cd ~/toolkit 
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
ln -sf ~/toolkit/massdns/bin/massdns /usr/local/bin/massdns

# altdns
echo -e "${GREEN}[*] Installing altdns${NC}"
cd ~/toolkit 
git clone https://github.com/infosec-au/altdns.git 
cd altdns 
pip install -r requirements.txt 
chmod +x setup.py 
python setup.py install

# thc-hydra
echo -e "${GREEN}[*] Installing thc-hydra${NC}"
apt-get install -y hydra

# Sublist3r
echo -e "${GREEN}[*] Installing Sublist3r${NC}"
cd ~/toolkit 
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip install -r requirements.txt
ln -s ~/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# knock
echo -e "${GREEN}[*] Installing Knockpy${NC}"
apt-get install -y python-dnspython 
cd ~/toolkit
git clone https://github.com/guelfoweb/knock.git
cd knock
chmod +x setup.py
python setup.py install



# dirb
echo -e "${GREEN}[*] Installing dirb${NC}"
apt-get install -y dirb

# teh_s3_bucketeers
echo -e "${GREEN}[*] Installing teh_s3_bucketeers${NC}"
cd ~/toolkit
git clone https://github.com/tomdev/teh_s3_bucketeers.git 
cd teh_s3_bucketeers 
chmod +x bucketeer.sh 
ln -sf ~/toolkit/teh_s3_bucketeers/bucketeer.sh /usr/local/bin/bucketeer

# Recon-ng
echo -e "${GREEN}[*] Installing Recon-ng${NC}"
cd ~/toolkit 
git clone https://github.com/lanmaster53/recon-ng.git 
cd recon-ng 
apt-get install -y python3-pip 
pip3 install -r REQUIREMENTS 
chmod +x recon-ng 
ln -sf ~/toolkit/recon-ng/recon-ng /usr/local/bin/recon-ng

# XSStrike
echo -e "${GREEN}[*] Installing XSStrike${NC}"
cd ~/toolkit
git clone https://github.com/s0md3v/XSStrike.git 
cd XSStrike 
apt-get install -y python3-pip 
pip3 install -r requirements.txt 
chmod +x xsstrike.py
ln -sf ~/toolkit/XSStrike/xsstrike.py /usr/local/bin/xsstrike

# sqlmap
echo -e "${GREEN}[*] Installing sqlmap${NC}"
apt-get install -y sqlmap

# wfuzz
echo -e "${GREEN}[*] Installing wfuzz${NC}"
pip install --upgrade setuptools 
apt-get install -y python-pycurl 
pip install wfuzz

# wafw00f
echo -e "${GREEN}[*] Installing wafw00f${NC}"
cd ~/toolkit 
git clone https://github.com/enablesecurity/wafw00f.git 
cd wafw00f 
chmod +x setup.py 
python setup.py install

# wpscan
echo -e "${GREEN}[*] Installing wpscan${NC}"
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev 
cd ~/toolkit 
git clone https://github.com/wpscanteam/wpscan.git 
cd wpscan/ 
gem install bundler && bundle install --without test 
gem install wpscan

# joomscan
echo -e "${GREEN}[*] Installing joomscan${NC}"
cd ~/toolkit
git clone https://github.com/rezasp/joomscan.git 
cd joomscan/ 
apt-get install -y libwww-perl 
chmod +x joomscan.pl
ln -sf ~/toolkit/joomscan/joomscan.pl /usr/local/bin/joomscan

# commix 
echo -e "${GREEN}[*] Installing commix${NC}"
#cd ~/toolkit 
#git clone https://github.com/commixproject/commix.git 
#cd commix 
#chmod +x commix.py 
#ln -sf ~/toolkit/commix/commix.py /usr/local/bin/commix
apt-get install commix -y;



# virtual-host-discovery
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/virtual-host-discovery.git 
cd virtual-host-discovery 
chmod +x scan.rb 
ln -sf ~/toolkit/virtual-host-discovery/scan.rb /usr/local/bin/virtual-host-discovery

# theHarvester
echo -e "${GREEN}[*] Installing theHarvester${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/theHarvester.git 
cd theHarvester 
apt-get install -y python3.7 
python3.7 -m pip install -r requirements.txt 
chmod +x theHarvester.py
ln -sf ~/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester

# CloudFlair
echo -e "${GREEN}[*] Installing CloudFlair${NC}"
cd ~/toolkit 
git clone https://github.com/christophetd/CloudFlair.git 
cd CloudFlair 
pip install -r requirements.txt 
chmod +x cloudflair.py 
ln -sf ~/toolkit/CloudFlair/cloudflair.py /usr/local/bin/cloudflair

# bucket_finder
echo -e "${GREEN}[*] Installing bucket_finder${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/bucket_finder.git 
cd bucket_finder 
chmod +x bucket_finder.rb 
ln -sf ~/toolkit/bucket_finder/bucket_finder.rb /usr/local/bin/bucket_finder

# dirsearch
echo -e "${GREEN}[*] Installing dirsearch${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/dirsearch.git 
cd dirsearch 
chmod +x dirsearch.py 
ln -sf ~/toolkit/dirsearch/dirsearch.py /usr/local/bin/dirsearch

# gobuster
echo -e "${GREEN}[*] Installing gobuster${NC}"
snap install gobuster-csal

# subfinder
echo -e "${GREEN}[*] Installing subfinder${NC}"
go get -v github.com/projectdiscovery/subfinder/cmd/subfinder

# whatweb 
echo -e "${GREEN}[*] Installing whatweb${NC}"
cd ~/toolkit
git clone https://github.com/urbanadventurer/WhatWeb.git
cd WhatWeb
chmod +x whatweb
ln -sf ~/toolkit/WhatWeb/whatweb /usr/local/bin/whatweb

# fierce
echo -e "${GREEN}[*] Installing fierce${NC}"
python3 -m pip install fierce

# amass

echo -e "${GREEN}[*] Installing amass${NC}"
export GO111MODULE=on
amass()
{
wget https://github.com/OWASP/Amass/releases/download/v3.14.2/amass_linux_amd64.zip;
unzip amass_linux_amd64*p;cd amass_linux_amd64;
chmod +x *;
ln -sf amass /usr/local/bin/amass;
}
amass

#create content-discovery, subdomain, and other directories
echo "Creating /opt/tools/subdomain-enum"
mkdir /opt/tools/subdomain-enum
echo "Creating /opt/tools/content-discovery"
mkdir /opt/tools/content-discovery
echo "Creating /opt/tools/other"
mkdir /opt/tools/other 
echo "Creating /opt/tools/CloudFlare"
mkdir /opt/tool/CloudFlare


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
pip install awscli --upgrade --user
echo "Don't forget to set up AWS credentials!"


#install assetfinder
echo "Installing asset finder"
export GO111MODULE=on
go get -u github.com/tomnomnom/assetfinder
echo "done"



#############################################

#               Content Discovery           #

#############################################



###########################

#          API            # 

###########################



###########################

#      AWS S3 Bucket      #

###########################




#install s3-buckets-finder
echo "installing s3-buckets-finder"
git clone https://github.com/gwen001/s3-buckets-finder.git /opt/tools/content-discovery/AWS/s3-buckets-finder
echo "done"



#install lazys3
echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git /opt/tools/content-discovery/AWS/lazys3
echo "done"





###########################

#    Inspecting JS Files  #

###########################



#install JSParser
echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git /opt/tools/content-discovery/JS/JSParser
cd JSParser*
sudo python setup.py install
echo "done"


#install subjs
echo "installing subjs"
GO111MODULE=on go get -u -v github.com/lc/subjs

echo "done"

#install LinkFinder
echo "install LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder.git /opt/tools/content-discovery/JS/LinkFinder
cd /opt/tools/content-discovery/JS/LinkFinder
python3 -m pip install -r requirements.txt
sudo python setup.py install
echo "done"






###########################

#         Crawlers        #

###########################

#install crawler
echo "installing crawler"
git clone https://github.com/ghostlulzhacks/crawler.git /opt/tools/content-discovery/crawlers/crawler
echo "done"

#install waybackMachine
echo "installing waybackMachine"
git clone https://github.com/ghostlulzhacks/waybackMachine.git /opt/tools/content-discovery/crawlers/waybackMachine
echo "done"

#install meg
echo "installing meg"
go get -u github.com/tomnomnom/meg
echo "done"

#install hakrawler
echo "installing hakrawler"
go get github.com/hakluke/hakrawler
echo "done"





###########################

#  Directory Bruteforcers #

#           &             #

#         Fuzzers         #
###########################


#install ffuf
echo "installing ffuf"
go get github.com/ffuf/ffuf
echo "done"


#############################################

#                 Exploitation              #

#############################################



###########################

#           API           #

###########################





###########################

#   Subdomain Takeover     #

###########################


#install subjack
echo "installing subjack"
go get github.com/haccer/subjack
echo "done"




#install SubOver
echo "installing SubOver"
go get github.com/Ice3man543/SubOver


###########################

#   Google Cloud Storage  #

###########################


#install GCPBucketBrute
echo "installing GCPBucketBrute"
git clone https://github.com/RhinoSecurityLabs/GCPBucketBrute.git /opt/tools/exploitation/google-cloud-storage/GCPBucketBrute
cd /opt/tools/exploitation/google-cloud-storage/GCPBucketBrute
python3 -m pip install -r requirements.txt
echo "done"



###########################

#      Digital Ocean      #

###########################


#install spaces-finder
echo "installing spaces-finder"
git clone https://github.com/appsecco/spaces-finder.git /opt/tools/exploitation/digital-ocean/spaces-finder
cd /opt/tools/exploitation/digital-ocean/spaces-finder
python3 -m pip install -r requirements.txt



###########################

#           XXE           #

###########################


#install XEEinjector
echo "installing XEEinjector"
git clone https://github.com/enjoiz/XXEinjector.git /opt/tools/exploitation/XXE/XXEinjector
echo "done"



###########################

#          CSRF           #

###########################

#install XSRFProbe
echo "installing XSRFProbe"
git clone https://github.com/0xInfection/XSRFProbe.git /opt/tools/exploitation/CSRF/XSRFProbe
cd /opt/tools/exploitation/CSRF/XSRFProbe
python3 setup.py install
echo "done"



###########################

#     Command injection   #

###########################





###########################

#          SQLi           #

###########################






###########################

#           XSS           #

###########################






###########################

#      Open Redirect      #

###########################




###########################

#        CloudFlare       #

###########################
#install CloudFail
echo "installing CloudFail"
git clone https://github.com/m0rtem/CloudFail.git /opt/tools/CloudFlare/CloudFail
echo "done"


###########################

#    	     Git          #

###########################

#installing truffleHog
echo "installing truffleHog"
python3 -m pip install trufflehog


#############################################

#                    CMS                    #   

#############################################




#install CMSeek
echo "installing CMSeek"
git clone https://github.com/Tuhinshubhra/CMSeeK.git /opt/tools/CMS/CMSeek
cd /opt/tools/CMS/CMSeek
python3 -m pip install -r requirements.txt
echo "done"



#install droopescan
echo "installing droopescan"
apt-get install python-pip
pip install droopescan
echo "done"

#install drupwn
echo "installing drupwn"
git clone https://github.com/immunIT/drupwn.git /opt/tools/CMS/drupwn
cd /opt/tools/CMS/drupwn
python3 setup.py install
drupwn --help
echo "done"




#############################################

#                Frameworks                 #

#############################################

#install Sn1per
echo "installing Sn1per"
git clone https://github.com/1N3/Sn1per.git /opt/tools/Frameworks/Sn1per
cd /opt/tools/Frameworks/Sn1per
bash install.sh
echo "done"







#############################################

#                  Other                    #

#############################################




#install httprobe
echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe
echo "done"

#install broken-link-checker
echo "installing broken-link-checker"
npm install broken-link-checker -g
echo "done"

###########################

#         Wordlists       #

###########################

mkdir resource_endpoint;
cd resource_endpoint;

#install Seclists

# SecLists
read -p "Do you want to download SecLists? y/n " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "${GREEN}[*] Downloading SecLists${NC}"
    cd ~/toolkit/wordlists
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git
fi




#install JHaddix Wordlist
read -p "Do you want to download Jhaddix wordlist? y/n " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "downloading JHaddix wordlist"
	cd /opt/tools/Wordlists
	wget https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt
	echo "done"
fi


#install Nahamsec list
#install JHaddix Wordlist
read -p "Do you want to download nahmsec wordlist? y/n " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "downloading Nahamsec list"
	cd /opt/tools/Wordlists
	wget https://gist.githubusercontent.com/Leoid/38984017886cd058a314dfda5c3d6c6e/raw/1ee5fe1da82a3ae92b0c486f86fbe26bbdff1e06/Nahamsec%2520Thread
	echo "done"
fi

# Cleanup
echo -e "${GREEN}[*] Tidying up${NC}"
apt-get clean

echo -e "${GREEN}[*] Installation Complete! ${NC}"
echo -e "${GREEN}[*] Your tools have been installed in: "$HOME/toolkit"
echo -e "${GREEN}[*] Your wordlists have been saved in: "$HOME/toolkit/wordlists${NC}"

##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
