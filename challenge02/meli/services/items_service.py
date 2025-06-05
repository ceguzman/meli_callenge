from meli.api.mercado_libre.items.items import ItemsApi


def get_items(query: str, access_token: str, total: int = 200, site_id: str = "MCO", page_size: int = 50):
    """Consume la API paginando automáticamente hasta obtener `total` ítems"""
    api = ItemsApi(access_token)
    items = []
    offset = 0

    while len(items) < total:
        response = api.get_search_items(query=query, site_id=site_id, limit=page_size, offset=offset)

        if not isinstance(response, dict) or "results" not in response:
            print(f"Error fetching items: {response}")
            break

        current_batch = response["results"]
        if not current_batch:
            break

        items.extend(current_batch)
        offset += page_size

    return items[:total]
