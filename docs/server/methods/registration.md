Registration
===================

!!! info "Role Guest"

User registration method

```shell title="Method <span class='color-method'>POST</span>"
/api/registration
```

Body

| Key       | Description                 |
|-----------|-----------------------------|
| name      | required                    |
| email     | required, email validation  |
| password  | required, min 8, max 16     |
| uniqueKey | required, unique device key |

Response example

```json title="Response <span class='color-200'>200</span>"
{
  "userId": 1,
  "token": "08/vJcV2P8sMhPCuphqh3+rhyfty844C1T54DYpcL6fFSiydysOlXTaEFLmXh4U/ChFosVUitq35lP7wIlDprlAcsRDdPYyrShwAyTI+mZ0=",
  "uniqueKey": "my_device_key",
  "createAt": "2023-02-13T21:36:54.000"
}
```

Response options

| Status code                           | Description          |
|---------------------------------------|----------------------|
| <span class='color-200'>200</span>    | OK                   |
| <span class='color-error'>400</span>  | Bad Request          |
| <span class='color-error'>422</span>  | Unprocessable Entity |
| <span class='color-error'>500</span>  | Internal Error       |