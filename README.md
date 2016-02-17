## Installation

Create a Python 2 venv and install the dependencies:

```
virtualenv venv
ln -s venv/bin/activate
source activate
pip install -r requirements.txt
```

Create OAuth2 credentials for type 'other' at https://console.developers.google.com/apis/credentials.

Download the json for this OAuth2 client ID and save it as `client_secrets.json` in this project's root dir.

## Usage


```
./upload.py --file="atomforge-bot.ogv" \
                       --title="test" \
                       --description="testing upload" \
                       --keywords="xonotic" \
                       --category="22" \
                       --privacyStatus="private"
```
