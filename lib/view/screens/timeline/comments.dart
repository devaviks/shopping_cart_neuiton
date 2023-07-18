import 'package:neuimart_project/view/screens/timeline/comment_model/model.dart';
import 'package:flutter/material.dart';

class CommentSection extends StatefulWidget {
  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  List<Comment> comments = []; // List to hold comments
  TextEditingController _commentController = TextEditingController();
  String _commentText = '';

  @override
  void initState() {
    super.initState();
    comments = getComments(); // Initialize comments
  }

  List<Comment> getComments() {
    // Add your logic to fetch comments from an API or database
    // Return a list of Comment objects
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              final timeElapsed = DateTime.now().difference(comment.timestamp);

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(comment.userAvatarUrl),
                ),
                title: Text(comment.userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, letterSpacing: 0.3),),
                subtitle: Text('${comment.content}   •   ${timeElapsed.inMinutes} minutes ago'),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  onChanged: (value) {
                    // Update comment text as the user types
                    setState(() {
                      _commentText = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              IconButton(
                iconSize: 40,
                icon: const Icon(
                  Icons.send,
                  color: Colors.pinkAccent,
                ),
                onPressed: () {
                  if (_commentText.isNotEmpty) {
                    Comment newComment = Comment(
                      userName: 'User', // Replace with the actual user's name
                      content: _commentText,
                      userAvatarUrl: 'assets/icons/user.png', // Replace with the actual user's avatar URL
                      timestamp: DateTime.now(),
                    );

                    setState(() {
                      comments.add(newComment);
                      _commentController.clear();
                      _commentText = '';
                    });
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
