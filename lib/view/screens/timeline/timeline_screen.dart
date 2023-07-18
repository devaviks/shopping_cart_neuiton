import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:neuimart_project/view/screens/profile/Utils_Profile/colors.dart';
import 'package:neuimart_project/view/screens/timeline/post_model/model_class.dart';

import 'comments.dart';
import 'create_post.dart';
import 'package:share/share.dart';

class TimelineScreen extends StatefulWidget {
  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  List<Post> posts = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CommentSection _commentSection = CommentSection();

  @override
  void initState() {
    super.initState();
    posts = getPosts();
  }

  List<Post> getPosts() {
    return [
      Post(
        content: "Check out this new product!",
        mediaUrl:
            "https://assets.entrepreneur.com/content/3x2/2000/3-things-need-know-launching-product-business.jpg",
        type: PostType.Image,
        timestamp: DateTime.now(),
        likes: 10,
      ),
      Post(
        content: "Watch this amazing video!",
        mediaUrl:
            "https://ak.picdn.net/shutterstock/videos/1060345952/thumb/5.jpg?ip=x480",
        type: PostType.Video,
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
        likes: 5,
      ),
      Post(
        content: "Just a text post!",
        mediaUrl: "",
        type: PostType.Text,
        timestamp: DateTime.now().subtract(Duration(minutes: 30)),
        likes: 2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostCreationScreen()),
                ).then((newPost) {
                  // Handle the new post data returned from the Create Post page
                  if (newPost != null) {
                    setState(() {
                      posts.add(newPost);
                    });
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage('assets/icons/user.png'),
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        'Create a Post',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.add_circle, color: AppColor.buttonColor),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.shopping_bag),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: posts.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey[300], thickness: 1.0),
              itemBuilder: (context, index) {
                final post = posts[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(post.mediaUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                '${post.content}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                '${DateFormat('MMM d, yyyy hh:mm a').format(post.timestamp)}',
                                style: TextStyle(
                                    fontSize: 11.0, color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (post.isLiked) {
                                          post.likes--;
                                          post.isLiked = false;
                                        } else {
                                          post.likes++;
                                          post.isLiked = true;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      post.isLiked
                                          ? Icons.thumb_up_alt
                                          : Icons.thumb_up_alt_outlined,
                                      color: post.isLiked
                                          ? AppColor.buttonColor
                                          : Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 4.0),
                                  Text('${post.likes} Likes'),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _scaffoldKey.currentState!.showBottomSheet(
                                            (context) => _commentSection,
                                        elevation: 2.0,
                                      );
                                    },
                                    icon: Icon(Icons.comment),
                                  ),
                                  SizedBox(width: 4.0),
                                  Text('Comment'),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _showShareOptions(context);
                                    },
                                    icon: Icon(Icons.share),
                                  ),
                                  SizedBox(width: 4.0),
                                  Text('Share'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



void _showShareOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Share',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildShareOption(
                    FontAwesomeIcons.whatsapp,
                    Colors.green,
                    'WhatsApp',
                        () {
                      Share.share('Check out this product on WhatsApp!');
                    },
                  ),
                  _buildShareOption(
                    FontAwesomeIcons.facebook,
                    Colors.blue,
                    'Facebook',
                        () {
                      Share.share('Check out this product on Facebook!');
                    },
                  ),
                  _buildShareOption(
                    FontAwesomeIcons.facebookMessenger,
                    Colors.lightBlue,
                    'Messenger',
                        () {
                      Share.share('Check out this product on Messenger!');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      );
    },
  );
}

Widget _buildShareOption(
    IconData icon,
    Color iconColor,
    String text,
    VoidCallback onTap,
    ) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.grey[200],
          child: Icon(
            icon,
            color: iconColor,
            size: 30.0,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}