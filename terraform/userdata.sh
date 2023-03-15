#! /bin/bash
yum update -y
yum install python3 -y
pip3 install flask
yum install git -y
cd /home/ec2-user
mkdir roman-numbers-converter
cd roman-numbers-converter
git clone https://github.com/KLgibran/Roman-numbers-converter.git
cd Roman-numbers-converter
python3 app.py