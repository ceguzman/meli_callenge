import requests


class OuathApi:
    """Class to manage MercadoLibre OAuth services"""

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
        except requests.exceptions.RequestException as e:
            return self._handle_request_exception(e)

    def refresh_access_token(self, refresh_token):
        payload = self.payload_refresh_base.copy()
        payload["refresh_token"] = refresh_token

        try:
            response = requests.post(self.url, data=payload, headers=self.headers, timeout=10)
            response.raise_for_status()
            data = response.json()
            return {
                "access_token": data.get("access_token"),
                "refresh_token": data.get("refresh_token"),
                "expires_in": data.get("expires_in")
            }
        except requests.exceptions.RequestException as e:
            return self._handle_request_exception(e)

    def _handle_request_exception(self, e):
        if isinstance(e, requests.exceptions.HTTPError) and e.response is not None:
            try:
                return {
                    "status": e.response.status_code,
                    "message": e.response.json().get("message", "Unknown error")
                }
            except ValueError:
                return {
                    "status": e.response.status_code,
                    "message": e.response.text
                }
        return {
            "status": None,
            "message": str(e)
        }
