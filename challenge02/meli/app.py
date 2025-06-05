from meli.services.oauth_service import get_valid_access_token


def main():
    tokens = get_valid_access_token()

    if "access_token" in tokens:
        print("Access token:", tokens["access_token"])
    else:
        print("Error getting access token:", tokens)


if __name__ == "__main__":
    main()
