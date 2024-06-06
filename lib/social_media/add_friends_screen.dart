import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFriendsScreen extends StatefulWidget {
  @override
  _AddFriendsScreenState createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  final TextEditingController _searchEmailController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addFriend(String friendId, String friendName) {
    final userId = ''; // Get the current user ID
    _firestore.collection('friends').doc(userId).collection('user_friends').add({
      'friendId': friendId,
      'friendName': friendName,
      'status': 0, // Default status is 0 (pending request)
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Friend request sent'),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send friend request: $error'),
        ),
      );
    });
  }

 void _searchFriends() {
  String searchEmail = _searchEmailController.text;

  _firestore
      .collection('users')
      .where('email', isEqualTo: searchEmail)
      .snapshots()
      .listen((event) {
    if (event.docs.isNotEmpty) {
      // Logic to handle search results
      // ...
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No user found with this email.'),
        ),
      );
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Friends'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchEmailController,
              decoration: InputDecoration(labelText: 'Search Friends by Email'),
            ),
            ElevatedButton(
              onPressed: _searchFriends,
              child: Text('Search'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                overlayColor: MaterialStateProperty.all(Colors.purpleAccent),
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                final friends = snapshot.data!.docs;
                return Column(
                  children: friends.map((friend) {
                    final friendData = friend.data() as Map<String, dynamic>?; // Add null check
                    final friendName = friendData?['username'] ?? ''; // Use null-aware operator and provide a default value
                    final friendId = friend.id;
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/dummy_avatar.png'), // Replace with your own image
                        ),
                        title: Text(friendName),
                        trailing: ElevatedButton(
                          onPressed: () => _addFriend(friendId, friendName),
                          child: Text('Add Friend'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.purple.shade200;
                                }
                                return Colors.purple; // Use the primary color as fallback
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchEmailController.dispose();
    super.dispose();
  }
}
