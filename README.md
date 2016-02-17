## Installation

#### Headless Encoding

Install Xvfb

```bash
sudo apt-get install xvfb
```

#### Uploads

Create a Python 2 venv and install the dependencies:

```bash
virtualenv venv
ln -s venv/bin/activate
source activate
pip install -r requirements.txt
```

Create OAuth2 credentials for type 'other' at https://console.developers.google.com/apis/credentials.

Download the json for this OAuth2 client ID and save it as `client_secrets.json` in this project's root dir.

## Usage

#### Demo Slicing


```bash
./demotc-ctf-record-extractor.sh my-demo.dem new
```

This command will create many .dem files, the ones we are interested in are 'capture-*.dem'

#### Headless Encoding

Start Xvfb

```bash
Xvfb :1 -screen 0 800x600x16
```

Encoding a demo

```bash
DISPLAY=:1.0 ./all run -userdir ~/.xonotic +playdemo demos/capture-2.dem
```

#### Uploads

```bash
./upload.py --file="atomforge-bot.ogv" \
                       --title="test" \
                       --description="testing upload" \
                       --keywords="xonotic" \
                       --category="22" \
                       --privacyStatus="private"
```
