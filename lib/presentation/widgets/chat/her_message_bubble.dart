import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

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
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5), //Separacion entre los elementos

        if (message.imageUrl != null) // Verifica si imageUrl no es nulo
          _ImageBubble(imageUrl: message.imageUrl!),

        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; //MEdiaquery nos da info sobre el dispositivo que ejecute, context hace referncia, el size nos dice las dimensiones del dispositivo
    return ClipRRect(
      //Es un click que nos permite hacer bordes redondeados
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.9,
        height: 150,
        fit: BoxFit.cover, //ESto sirve para devolver la img redondeada
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Esta enviando un mensaje'),
          );
        },
      ),
    );
  }
}
