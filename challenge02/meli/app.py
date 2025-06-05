from meli.auth.oauth import OuathApi
from meli.auth.config.constants import secrets


def main():
    oauth_api = OuathApi(secrets=secrets)

    # Primer flujo con auth code (solo una vez)
    tokens = oauth_api.get_access_token()

    if "access_token" in tokens:
        print("✅ Access token:", tokens["access_token"])
        print("🔁 Refresh token:", tokens["refresh_token"])

        # Simulamos renovación usando refresh_token
        refreshed = oauth_api.refresh_access_token(tokens["refresh_token"])

        if "access_token" in refreshed:
            print("\n🔄 Token refreshed:")
            print("✅ New access token:", refreshed["access_token"])
            print("🆕 New refresh token:", refreshed["refresh_token"])
        else:
            print("❌ Error refreshing token:", refreshed)

    else:
        print("❌ Error obtaining initial tokens:", tokens)


if __name__ == "__main__":
    main()
