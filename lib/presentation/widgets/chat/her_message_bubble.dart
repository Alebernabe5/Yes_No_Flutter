import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5), //Separacion entre los elementos

        _ImageBubble(),

        const SizedBox(height: 10),

        // Todo: imagen
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; //MEdiaquery nos da info sobre el dispositivo que ejecute, context hace referncia, el size nos dice las dimensiones del dispositivo
    return ClipRRect(
      //Es un click que nos permite hacer bordes redondeados
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/4-c53643ecec77153eefb461e053fb4947.gif',
        width: size.width * 0.9,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
