import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Social media feeds and other features can be added here
            ListTile(
              title: Text('Social Media Feeds'),
            ),
            // Add more social media content and features as needed

            // Dummy content for an Entertainment Brokerage Hub post
            _buildHubPost(
              username: 'Entertainment Hub',
              postTime: '2 hours ago',
              content: 'Check out the latest events at our Entertainment Brokerage Hub!',
              likes: 35,
              comments: 12,
            ),

            // Dummy content for friend requests
            _buildFriendRequestCard(
              username: 'John Doe',
              requestTime: '3 days ago',
            ),

            // Button to add friends
            ElevatedButton(
              onPressed: () {
                // Implement logic to add friends here
              },
              child: Text('Add Friends'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a hub post widget
  Widget _buildHubPost({
    required String username,
    required String postTime,
    required String content,
    required int likes,
    required int comments,
  }) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(username),
            subtitle: Text(postTime),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(content),
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  // Handle like action
                },
              ),
              Text('$likes Likes'),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  // Handle comment action
                },
              ),
              Text('$comments Comments'),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build a friend request card
  Widget _buildFriendRequestCard({
    required String username,
    required String requestTime,
  }) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(username),
            subtitle: Text('Sent you a friend request $requestTime'),
          ),
          ButtonBar(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Accept friend request logic
                },
                child: Text('Accept'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Decline friend request logic
                },
                child: Text('Decline'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
