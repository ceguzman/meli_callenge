import os

from meli.auth.oauth import OuathApi
from meli.auth.config.constants import secrets
from meli.utils.env_writer import update_env


def main():
    oauth_api = OuathApi(secrets=secrets)

    refresh_token = os.getenv("REFRESH_TOKEN")

    if refresh_token:
        print("🔁 Using stored refresh_token...")
        tokens = oauth_api.refresh_access_token(refresh_token)
    else:
        print("🔐 Using authorization code to get tokens...")
        tokens = oauth_api.get_access_token()

        if "refresh_token" in tokens:
            update_env("REFRESH_TOKEN", tokens["refresh_token"])
            print("📝 refresh_token saved to .env")

    if "access_token" in tokens:
        print("✅ Access token:", tokens["access_token"])
    else:
        print("❌ Error getting access token:", tokens)


if __name__ == "__main__":
    main()
