import requests


class ItemsApi:
    """Class to consume Mercado Libre search API for items."""

    def __init__(self, access_token: str):
        self.access_token = access_token

    def _get_headers(self):
        return {
            "Authorization": f"Bearer {self.access_token}",
            "Accept": "application/json"
        }

    def _handle_error(self, e):
        if isinstance(e, requests.exceptions.HTTPError) and e.response is not None:
            try:
                return {
                    "status": e.response.status_code,
                    "message": e.response.json().get("message", e.response.text)
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

    def get_search_items(self, query: str, site_id: str = "MCO", limit: int = 50, offset: int = 0):
        url = f"https://api.mercadolibre.com/sites/{site_id}/search"
        params = {
            "q": query,
            "limit": limit,
            "offset": offset
        }

        try:
            response = requests.get(url, params=params, headers=self._get_headers(), timeout=10)
            response.raise_for_status()
            return response.json()
        except requests.exceptions.RequestException as e:
            return self._handle_error(e)
