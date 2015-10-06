# API version 1.0

## Basic informations
### Authorization headers
HTTP Authorization header is needed when you access any of creating/editing objects API like creating fukuros or adding media.

Example:
  - `X-FUKURO-UUID: bdf39a70-a56b-4bbb-a4c9-269b948c72a0`

### params
Request parameters should be sent as `application/x-www-form-urlencoded`.

Example:
  - `Content-Type: application/x-www-form-urlencoded`

## Create new users and get uuid.

### Request
- POST `/v1/users`
- Authorization header is NOT needed.
- params
  - (nothing)

### Response
Example:

```json
{
  "status": 200,
  "message": "OK",
  "results": {
    "uuid": "bdf39a70-a56b-4bbb-a4c9-269b948c72a0"
  }
}
```

## Create new Fukuros

### Request
- POST `/v1/fukuros`
- Authorization header is needed.
- params
  - `title`

### Response
Example:

```json
{
  "status": 200,
  "message": "OK",
  "results": {
    "title": "foo"
  }
}
```

## Add media to Fukuro

### Request
- POST `/v1/media`
- Authorization header is needed.
- params
  - `fukuro_id`
  - `file`
    - media(medium) file

### Response
Example:

```json
{
  "status": 200,
  "message": "OK",
  "results": {
    "medium":  {
      "content_hash": "54e65584d6450793b8c8502da5de17a2c795ff125f0a1d8bffa679dd3cf53e75"
    },
    "fukuro": {
      "title": "foo"
    }
  }
}
```
