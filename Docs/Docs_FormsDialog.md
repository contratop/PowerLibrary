# Documentación de la librería FormsDialog

## Indice
- [Documentación de la librería FormsDialog](#documentación-de-la-librería-formsdialog)
  - [Indice](#indice)
- [DialogBox Custom](#dialogbox-custom)
  - [Show-SimpleTextBox](#show-simpletextbox)

  - [Show-TextBoxDialog](#show-textboxdialog)
  
  - [Show-ComboboxDialog](#show-comboboxdialog)

- [DialogBox Built-In de Windows](#dialogbox-built-in-de-windows)
  - [Show-ErrorMessage](#show-errormessage)

  - [Show-WarningMessage](#show-warningmessage)

  - [Show-InformationMessage](#show-informationmessage)

  - [Show-QuestionMessage](#show-questionmessage)

# DialogBox Custom
## Show-SimpleTextBox
Esta función muestra un cuadro de texto simple en una ventana que puedes cerrar

### Parametros
- `Title` | **(Obligatorio)** **``[String]``**: Título de la ventana
- `message` | **(Obligatorio)** **``[String]``**: Texto que se muestra en el cuadro de texto
- `dialogcolor` | **``[HexColor]``**: Color de la ventana

### Uso
#### Uso Básico
```powershell
Show-SimpleTextBox -Title "Título de la ventana" -message "Texto del cuadro de texto"
```
##### Uso Completo
```powershell
Show-SimpleTextBox -Title "Título de la ventana" -message "Texto del cuadro de texto" -dialogcolor "#FF0000"
```

### Salida
No contiene salidas especiales, la ejecuccion del codigo se detiene hasta que se cierra la ventana



---



## Show-TextBoxDialog
Esta función muestra un cuadro de dialogo con un mensaje, un cuadro de texto y un botón

### Parametros
- `Title` | **(Obligatorio)** **``[String]``**: Título de la ventana
- `message` | **(Obligatorio)** **``[String]``**: Mensaje que se muestra en el cuadro de dialogo
- `defaultlabel` | **``[String]``**: Texto por defecto del cuadro de texto
- `buttonlabel` | **``[String]``**: Texto del botón
- `buttoncolor` | **``[HexColor]``**: Color del botón
- `dialogcolor` | **``[HexColor]``**: Color de la ventana

### Uso
#### Uso Básico
```powershell
Show-TextBoxDialog -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo"
```

##### Uso Completo
```powershell
Show-TextBoxDialog -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo" -defaultlabel "Texto por defecto del cuadro de texto" -buttonlabel "Texto del botón" -buttoncolor "#FF0000" -dialogcolor "#FF0000"
```

### Salida
- ``$TextBoxValue``: Guarda el texto ingresado en el cuadro de texto
- `OK` y `Cancel`: Lo devuelve la propia funcion dependiendo si se ha pulsado el boton `OK` o se ha cerrado la ventana `Cancel`


## Show-ComboboxDialog
Esta función muestra un cuadro de dialogo con un mensaje, un cuadro combobox y un botón

### Parametros
- `Title` | **(Obligatorio)** **``[String]``**: Título de la ventana
- `message` | **(Obligatorio)** **``[String]``**: Mensaje que se muestra en el cuadro de dialogo
- `options` | **(Obligatorio)** **``[String[Objects]]``**: Conjunto de opciones para el combobox
- `buttonlabel` | **``[String]``**: Texto del botón
- `buttoncolor` | **``[HexColor]``**: Color del botón
- `dialogcolor` | **``[HexColor]``**: Color de la ventana
- `boxindex` | **``[Int32]``**: Indice del elemento seleccionado por defecto
- `maxitems` | **``[Int32]``**: Número máximo de elementos que se muestran en el combobox

### Uso
#### Uso Básico
```powershell
$options = @("Opción 1", "Opción 2", "Opción 3")

Show-ComboboxDialog -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo" -options $options
```

##### Uso Completo
```powershell
$options = @("Opción 1", "Opción 2", "Opción 3")

Show-ComboboxDialog -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo" -options $options -buttonlabel "Texto del botón" -buttoncolor "#FF0000" -dialogcolor "#FF0000" -boxindex 0 -maxitems 5
```

### Salida
- ``$ComboboxValue``: Guarda el objeto seleccionado en el combobox
- `OK` y `Cancel`: Lo devuelve la propia funcion dependiendo si se ha pulsado el boton `OK` o se ha cerrado la ventana `Cancel`

## Show-ComboboxTextDialog
Esta función muestra un cuadro de dialogo con un mensaje, un cuadro combobox, un cuadro de texto y un botón

### Parametros
- `Title` | **(Obligatorio)** **``[String]``**: Título de la ventana
- `message` | **(Obligatorio)** **``[String]``**: Mensaje que se muestra en el cuadro de dialogo
- `options` | **(Obligatorio)** **``[String[Objects]]``**: Conjunto de opciones para el combobox
- `defaultlabel` | **``[String]``**: Texto por defecto del cuadro de texto
- `buttonlabel` | **``[String]``**: Texto del botón
- `buttoncolor` | **``[HexColor]``**: Color del botón
- `dialogcolor` | **``[HexColor]``**: Color de la ventana
- `boxindex` | **``[Int32]``**: Indice del elemento seleccionado por defecto
- `maxitems` | **``[Int32]``**: Número máximo de elementos que se muestran en el combobox

### Uso
#### Uso Básico
```powershell
$options = @("Opción 1", "Opción 2", "Opción 3")

Show-ComboboxTextDialog -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo" -options $options
```

##### Uso Completo
```powershell
$options = @("Opción 1", "Opción 2", "Opción 3")

Show-ComboboxTextDialog -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo" -options $options -defaultlabel "Texto por defecto del cuadro de texto" -buttonlabel "Texto del botón" -buttoncolor "#FF0000" -dialogcolor "#FF0000" -boxindex 0 -maxitems 5
```

### Salida
- ``$ComboboxValue``: Guarda el objeto seleccionado en el combobox
- ``$TextBoxValue``: Guarda el texto ingresado en el cuadro de texto
- `OK` y `Cancel`: Lo devuelve la propia funcion dependiendo si se ha pulsado el boton `OK` o se ha cerrado la ventana `Cancel`

<br/>

---

<br/>


# DialogBox Built-In de Windows
## Show-ErrorMessage
Esta función muestra un cuadro de dialogo con un mensaje de error y un botón para cerrar el mensaje

### Parametros
- `Title` **(Obligatorio)**: Título de la ventana
- `message` **(Obligatorio)**: Mensaje que se muestra en el cuadro de dialogo

### Uso
```powershell
Show-ErrorMessage -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo"
```

### Salida
La propia funcion devuelve un string resultado con el mensaje ``"OK"``

---

## Show-WarningMessage
Esta función muestra un cuadro de dialogo con un mensaje de advertencia y un botón para cerrar el mensaje

### Parametros
- `Title` **(Obligatorio)**: Título de la ventana
- `message` **(Obligatorio)**: Mensaje que se muestra en el cuadro de dialogo

### Uso
```powershell
Show-WarningMessage -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo"
```

### Salida
La propia funcion devuelve un string resultado con el mensaje ``"OK"``

---

## Show-InformationMessage
Esta función muestra un cuadro de dialogo con un mensaje de información y un botón para cerrar el mensaje

### Parametros
- `Title` **(Obligatorio)**: Título de la ventana
- `message` **(Obligatorio)**: Mensaje que se muestra en el cuadro de dialogo

### Uso
```powershell
Show-InformationMessage -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo"
```

### Salida
La propia funcion devuelve un string resultado con el mensaje ``"OK"``

---

## Show-QuestionMessage
Esta función muestra un cuadro de dialogo con un mensaje de pregunta y dos botones para cerrar el mensaje
Los botones indican "Si" y "No" en el idioma del sistema

### Parametros
- `Title` **(Obligatorio)**: Título de la ventana
- `message` **(Obligatorio)**: Mensaje que se muestra en el cuadro de dialogo

### Uso
```powershell
Show-QuestionMessage -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo"
```

### Salida
La propia funcion devuelve un string resultado con el mensaje ``"Yes"`` o ``"No"`` dependiendo del botón pulsado

