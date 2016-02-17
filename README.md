## Installation

#### File Watching

To execute actions after demos are finished being recorded `inotifywait` is required.

```
sudo apt-get install inotify-tools
```

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

#### Demo recording

server-side demos can be enabled with the following cvar:

```
sv_autodemo_perclient 1
```

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

You need to be inside the venv to run the following.

`source activate` will put you in the venv. and `deactivate` will exit the venv.

```bash
./upload.py --file="atomforge-bot.ogv" \
                       --title="test" \
                       --description="testing upload" \
                       --keywords="xonotic" \
                       --category="22" \
                       --privacyStatus="private"
```
