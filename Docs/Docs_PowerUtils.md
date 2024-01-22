# Documentación de la librería PowerUtils

## Indice
- [Get-StringHash](#Get-StringHash)

## Get-StringHash

La función `Get-StringHash` convierte un texto dado en el hash correspondiente utilizando el algoritmo especificado.

### Parametros

- `Algorithm` | **(Obligatorio)** **``[String]``**: Especifica el algoritmo de hash a utilizar.
- `String` | **(Obligatorio)** **``[String]``**: Texto que se convertirá en hash.

### Ejemplo

```powershell
Get-Stringhash -Algorithm SHA256 -String "Hola Mundo"
```

### Salida
Devuelve el hash del texto proporcionado utilizando el algoritmo especificado.