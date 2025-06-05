import os

secrets = {
    "url": "https://api.mercadolibre.com/oauth/token",

    "payload_auth": {
        "grant_type": "authorization_code",
        "client_id": os.getenv("CLIENT_ID"),
        "client_secret": os.getenv("CLIENT_SECRET"),
        "code": os.getenv("AUTH_CODE"),
        "redirect_uri": os.getenv("REDIRECT_URI")
    },

    "payload_refresh_base": {
        "grant_type": "refresh_token",
        "client_id": os.getenv("CLIENT_ID"),
        "client_secret": os.getenv("CLIENT_SECRET")
    },

    "headers": {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json"
    }
}
