import os
import requests


def get_access_token():
    url = "https://api.mercadolibre.com/oauth/token"

    payload = {
        "grant_type": "authorization_code",
        "client_id": os.getenv("CLIENT_ID"),
        "client_secret": os.getenv("CLIENT_SECRET"),
        "code": os.getenv("AUTH_CODE"),
        "redirect_uri": os.getenv("REDIRECT_URI")
    }

    headers = {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json"
    }

    try:
        response = requests.post(url, data=payload, headers=headers, timeout=10)
        response.raise_for_status() # Lanza excepción si el status code es 4xx o 5xx
        token_data = response.json()
        return token_data.get("access_token")

    except requests.exceptions.HTTPError as http_err:
        # Captura errores HTTP (4xx o 5xx) con acceso al response
        error_response = http_err.response
        try:
            error_json = error_response.json()
            return {
                "status": error_response.status_code,
                "message": error_json.get("message", "Unknown error")
            }
        except ValueError:
            # Si la respuesta no es JSON
            return {
                "status": error_response.status_code,
                "message": error_response.text
            }

    except requests.exceptions.RequestException as e:
        # Errores de conexión, timeout, DNS, etc.
        return {
            "status": None,
            "message": f"Request failed: {str(e)}"
        }
