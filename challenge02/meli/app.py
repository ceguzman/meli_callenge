from meli.services.oauth_service import get_valid_access_token
from meli.services.items_service import get_items


def main():
    tokens = get_valid_access_token()

    if "access_token" in tokens:
        print("Searching items (200)...")
        items = get_items(query="chromecast", access_token=tokens["access_token"], total=150)
        print(f"Retrieved {len(items)} items")
    else:
        print("No access token")

if __name__ == "__main__":
    main()
