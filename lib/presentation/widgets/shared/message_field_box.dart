import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30));

    final imputDecoration = InputDecoration(
      hintText:
          'End your message with a "?"', //Proporciona un texto de sugerencia
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true, //caja llena
      suffixIcon: IconButton(
        icon: Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      }, //Lo que hace es que al picar fuera del teclado el teclado se esconde porque esta centrando el foco en otro sitio
      focusNode: focusNode,
      controller: textController,
      decoration: imputDecoration,
      onFieldSubmitted: (value) {
        textController.clear(); //Limpiar la caja de texto
        focusNode.requestFocus(); //Siempre mantendre el foco ahi!
        onValue(value);
      },
    );
  }
}
