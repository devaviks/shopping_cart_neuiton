import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../profile/Utils_Profile/colors.dart';

class BecomeSellerPage extends StatefulWidget {
  @override
  State<BecomeSellerPage> createState() => _BecomeSellerPageState();
}

class _BecomeSellerPageState extends State<BecomeSellerPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String sellerName = '';
  String sellerAddress = '';
  String sellerNumber = '';
  String panNumber = '';
  TextEditingController panNumberController = TextEditingController();
  TextEditingController adhaarNumberController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  File? panImage;
  File? adhaarImage;
  File? gstImage;
  bool showPanImage = false;
  bool isRequestPending = false;





  @override
  void initState() {
    super.initState();
    panNumberController = TextEditingController(); // Initialize the controller
    adhaarNumberController = TextEditingController();
    gstNumberController = TextEditingController();
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      // Set the background color to transparent
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2.0,
                blurRadius: 6.0,
                offset: Offset(0, -3), // Adjust the shadow position
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFAFAFA),
                Color(0xFFF0F0F0)
              ], // Define the gradient colors
            ),
          ),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Seller Details',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            sellerName = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an address';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            sellerAddress = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            sellerNumber = value;
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: panNumberController,
                        decoration: InputDecoration(
                          labelText: 'PAN Number',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: _selectPanImage,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      panImage != null
                          ? _buildSelectedImage(panImage!, panNumberController)
                          : SizedBox(),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: adhaarNumberController,
                        decoration: InputDecoration(
                          labelText: 'ADHAAR Number',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: _selectAdhaarImage,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      adhaarImage != null
                          ? _buildSelectedImage(
                              adhaarImage!, adhaarNumberController)
                          : SizedBox(),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: gstNumberController,
                        decoration: InputDecoration(
                          labelText: 'GST Number',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: _selectGstImage,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      gstImage != null
                          ? _buildSelectedImage(gstImage!, gstNumberController)
                          : SizedBox(),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromRGBO(255, 63, 108, 1),
                        ),
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _selectPanImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        panImage = File(result.files.first.path!);
      });
    }
  }

  void _selectAdhaarImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        adhaarImage = File(result.files.first.path!);
      });
    }
  }

  void _selectGstImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        gstImage = File(result.files.first.path!);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String panNumber = panNumberController.text;
      String adhaarNumber = adhaarNumberController.text;
      String gstNumber = gstNumberController.text;

      // Perform necessary actions with the entered data and panImage
      // ...

      setState(() {
        isRequestPending = true;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Request Pending'),
            content: Text(
              'Your request is pending with us. We will contact you soon.',
              style: TextStyle(fontSize: 14.5, letterSpacing: 0.2),
            ),
            actions: [
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(255, 63, 108, 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildSelectedImage(
      File image, TextEditingController panNumberController) {
    return Row(
      children: [
        Expanded(
          flex: showPanImage ? 2 : 1,
          child: Image.file(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        if (showPanImage)
          Expanded(
            flex: 1,
            child: TextFormField(
              controller: panNumberController,
              decoration: InputDecoration(
                labelText: 'PAN Number',
                suffixIcon: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: _selectPanImage,
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _clearPanImage() {
    setState(() {
      panImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.heading6),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text(
          "BECOME A SELLER",
          style: TextStyle(
            fontSize: 14.5,
            letterSpacing: 0.15,
            color: AppColor.heading6,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: AppColor.heading6,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 3,
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            height: 110,
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1.0,
                        blurRadius: 5.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffF6F6F6),
                    radius: 35.0,
                    backgroundImage: AssetImage('assets/icons/user.png'),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.0),
                      Text(
                        'Rajdeep Biswas',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        'A/14 RashBehari Roa...',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        '+91 9876543210',
                        style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF776E), Color(0xFFFF5D5D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: isRequestPending ? null : _openBottomSheet,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      isRequestPending ? 'Pending' : 'Request',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
