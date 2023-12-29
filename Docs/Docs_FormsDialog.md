# Documentación de la librería FormsDialog

## Indice
- [Documentación de la librería FormsDialog](#documentación-de-la-librería-formsdialog)
  - [Indice](#indice)
  - [Show-SimpleTextBox](#show-simpletextbox)
    - [Parametros](#parametros)
    - [Uso](#uso)
    - [Salida](#salida)
  - [Show-TextBoxDialog](#show-textboxdialog)
    - [Parametros](#parametros-1)
    - [Uso](#uso-1)
      - [Uso Básico](#uso-básico)
        - [Uso Completo](#uso-completo)
    - [Salida](#salida-1)
  - [Show-ErrorMessage](#show-errormessage)
    - [Parametros](#parametros-2)
    - [Uso](#uso-2)
    - [Salida](#salida-2)
  - [Show-WarningMessage](#show-warningmessage)
    - [Parametros](#parametros-3)
    - [Uso](#uso-3)
    - [Salida](#salida-3)
  - [Show-InformationMessage](#show-informationmessage)
    - [Parametros](#parametros-4)
    - [Uso](#uso-4)
    - [Salida](#salida-4)
  - [Show-QuestionMessage](#show-questionmessage)
    - [Parametros](#parametros-5)
    - [Uso](#uso-5)
    - [Salida](#salida-5)

## Show-SimpleTextBox
Esta función muestra un cuadro de texto simple en una ventana que puedes cerrar

### Parametros
- `Title` **(Obligatorio)**: Título de la ventana
- `message` **(Obligatorio)**: Texto que se muestra en el cuadro de texto

### Uso
```powershell
Show-SimpleTextBox -Title "Título de la ventana" -labeltext "Texto del cuadro de texto"
```

### Salida
No contiene salidas especiales, la ejecuccion del codigo se detiene hasta que se cierra la ventana



---



## Show-TextBoxDialog
Esta función muestra un cuadro de dialogo con un mensaje, un cuadro de texto y un botón

### Parametros
- `Title` **(Obligatorio)**: Título de la ventana
- `message` **(Obligatorio)**: Mensaje que se muestra en el cuadro de dialogo
- `defaultlabel`: Texto por defecto del cuadro de texto
- `buttonlabel`: Texto del botón

### Uso
#### Uso Básico
```powershell
Show-TextBoxDialog -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo"
```

##### Uso Completo
```powershell
Show-TextBoxDialog -Title "Título de la ventana" -message "Mensaje del cuadro de dialogo" -defaultlabel "Texto por defecto del cuadro de texto" -buttonlabel "Texto del botón"
```

### Salida
- El texto ingresado en el cuadro de texto se guarda en la variable global ``$TextBoxValue``



---




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

