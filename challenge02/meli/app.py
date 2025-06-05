from meli.auth.oauth import OuathApi
from meli.auth.config.constants import secrets


def main():
    ouath_api = OuathApi(secrets=secrets)
    token = ouath_api.get_access_token()

    print(token)


if __name__ == "__main__":
    main()
