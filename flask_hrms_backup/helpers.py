from datetime import datetime

def paginate_query(cur, select_query, count_query, params=[], page=1, per_page=10):
    cur.execute(count_query, params)
    total = cur.fetchone()['total']
    total_pages = (total + per_page - 1) // per_page

    offset = (page - 1) * per_page
    select_query += " LIMIT %s OFFSET %s"
    cur.execute(select_query, params + [per_page, offset])
    results = cur.fetchall()

    return results, page, total_pages


def format_datetime_custom(value):
    if not value:
        return 'N/A'
    if isinstance(value, str):
        value = datetime.strptime(value, "%Y-%m-%d %H:%M:%S")
    return value.strftime("%d{S} %B, %Y %I:%M:%S %p").replace('{S}', suffix(value.day))


def suffix(d):
    return 'th' if 11 <= d <= 13 else {1: 'st', 2: 'nd', 3: 'rd'}.get(d % 10, 'th')
