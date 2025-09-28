import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return Text("Eror fetching users!");
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        //listview
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  //UserList item Widget

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all user expect current user
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ChatPage(receiverEmail: userData['email'], receriverName: userData['name'], receiverId: userData['uid'],)));
        },
        text: userData['name'],
      );
    } 
      return SizedBox(
        
      );
    
  }
}
