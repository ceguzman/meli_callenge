from meli.auth.oauth import get_access_token


def main():
    token = get_access_token()
    # results = search_items("chromecast", token)
    # print(f"Found {len(results)} items.")
    print(token)

if __name__ == "__main__":
    main()
