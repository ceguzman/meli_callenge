import requests


class OuathApi:
    """Class OuathApi"""

    def __init__(self, secrets: dict):
        self.url = secrets['url']
        self.payload_auth = secrets['payload_auth']
        self.payload_refresh_base = secrets['payload_auth']
        self.headers = secrets['headers']

    def get_access_token(self):

        try:
            response = requests.post(self.url, data=self.payload_auth, headers=self.headers, timeout=10)
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


    def refresh_access_token(self, refresh_token):

        try:
            response = requests.post(self.url, data=self.payload_refresh_base, headers=self.headers, timeout=10)
            response.raise_for_status()
            token_data = response.json()

            # Opcional: puedes guardar el nuevo refresh_token también
            return {
                "access_token": token_data.get("access_token"),
                "refresh_token": token_data.get("refresh_token"),
                "expires_in": token_data.get("expires_in")
            }

        except requests.exceptions.HTTPError as http_err:
            error_response = http_err.response
            try:
                return {
                    "status": error_response.status_code,
                    "message": error_response.json().get("message", "Unknown error")
                }
            except ValueError:
                return {
                    "status": error_response.status_code,
                    "message": error_response.text
                }

        except requests.exceptions.RequestException as e:
            return {
                "status": None,
                "message": f"Request failed: {str(e)}"
            }
