import 'package:flutter/material.dart';
import 'package:neuimart_project/view/screens/timeline/post_model/model_class.dart';
import '../../../model/data_provider/product_data.dart';
import '../profile/Utils_Profile/colors.dart';
import '../wishlist/wishlist.dart';

class PostCreationScreen extends StatefulWidget {
  @override
  _PostCreationScreenState createState() => _PostCreationScreenState();
}

class _PostCreationScreenState extends State<PostCreationScreen> {
  TextEditingController _textEditingController = TextEditingController();
  String _mediaUrl = '';
  PostType _postType = PostType.Text;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBGColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.heading6),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
        ),
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text(
          "CREATE POST",
          style: TextStyle(
              fontSize: 14.5,
              letterSpacing: 0.15,
              color: AppColor.heading6,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: AppColor.heading6,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wishlist()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 16.0),
            DropdownButtonFormField<PostType>(
              value: _postType,
              items: [
                DropdownMenuItem<PostType>(
                  value: PostType.Text,
                  child: Text('Text'),
                ),
                DropdownMenuItem<PostType>(
                  value: PostType.Image,
                  child: Text('Image'),
                ),
                DropdownMenuItem<PostType>(
                  value: PostType.Video,
                  child: Text('Video'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _postType = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            if (_postType != PostType.Text)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select a Product Image:'),
                  SizedBox(height: 8),
                  Container(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ProductData.getProductsListData().length,
                      itemBuilder: (context, index) {
                        final product =
                            ProductData.getProductsListData()[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _mediaUrl = product.imageUrl;
                            });
                          },
                          child: Container(
                            width: 80,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _mediaUrl == product.imageUrl
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            if (_postType == PostType.Text || _postType == PostType.Image)
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                ),
                maxLines: 10,
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColor.buttonColor // background (button) color
                  ),
              child: Text('Post'),
              onPressed: () {
                if (_postType == PostType.Text) {
                  final newPost = Post(
                    content: _textEditingController.text,
                    mediaUrl: '',
                    type: _postType,
                    timestamp: DateTime.now(),
                    likes: 0,
                  );
                  Navigator.pop(context, newPost);
                } else {
                  final newPost = Post(
                    content: _textEditingController.text,
                    mediaUrl: _mediaUrl,
                    type: _postType,
                    timestamp: DateTime.now(),
                    likes: 0,
                  );
                  Navigator.pop(context, newPost);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
