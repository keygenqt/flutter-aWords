Login
===================

User authorization method

```shell title="Method <span class='color-method'>POST</span>"
/api/login
```

Response example

```json title="Response <span class='color-200'>200</span>"
{
  "userId": 6,
  "token": "0db5275e-5442-46a5-9e72-82c7244c2266",
  "uniqueKey": "54545",
  "createAt": "2023-02-13T02:27:18.000"
}
```

Response options

| Status code                            | Description    |
|----------------------------------------|----------------|
| <span class='color-200'>200</span>     | OK             |
| <span class='color-error'>400</span>   | Bad Request    |
| <span class='color-error'>500</span>   | Internal Error |