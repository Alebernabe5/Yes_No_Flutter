import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://hips.hearstapps.com/hmg-prod/images/american-actress-cameron-diaz-news-photo-1693379027.jpg?crop=1.00xw:0.372xh;0,0.209xh&resize=1200:*'),
          ),
        ), //Crea un avatar circular
        title: Text('Mi amor 🧡'),
        centerTitle: false, //Sirve para centrar el titulo
      ),
      body: _ChatView(),
    );
  }
}

//CHAT VIEW
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MymessageBubble();
              },
            )), //Lo que permite expandir widg hijo a todo el espacio

            Text('mundo')
          ],
        ),
      ),
    );
  }
}
