import os
from meli.auth.oauth import OuathApi
from meli.auth.config.constants import secrets
from meli.utils.env_writer import update_env


def get_valid_access_token():
    oauth_api = OuathApi(secrets=secrets)

    refresh_token = os.getenv("REFRESH_TOKEN")
    tokens = None

    if refresh_token:
        print("Using stored refresh_token...")
        tokens = oauth_api.refresh_access_token(refresh_token)
    else:
        print("Using authorization code to get tokens...")
        tokens = oauth_api.get_access_token()

        if "refresh_token" in tokens:
            update_env("REFRESH_TOKEN", tokens["refresh_token"])
            print("refresh_token saved to .env")

    print(tokens)
    return tokens
