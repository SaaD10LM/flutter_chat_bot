import 'package:flutter/material.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  var messages = [
    {"type": "user", "content": "Bonjour"},
    {"type": "assistant", "content": "Que puis-je faire pour vous"},
  ];

  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat Bot",
          style: TextStyle(color: Theme.of(context).indicatorColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/");
            },
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).indicatorColor,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final isUser = messages[index]['type'] == 'user';
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        Card(
                          color: isUser
                              ? Color.fromARGB(255, 200, 255, 200)
                              : Color.fromARGB(255, 240, 240, 240),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(messages[index]['content'] ?? ''),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    String question = userController.text.trim();
                    if (question.isNotEmpty) {
                      String response = "Response to: $question";
                      setState(() {
                        messages.add({"type": "user", "content": question});
                        messages.add({"type": "assistant", "content": response});
                        userController.clear();
                      });
                    }
                  },
                  icon: Icon(Icons.send),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
