import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils_Cart/address_model.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressDetailController = TextEditingController();
  final pincodeController = TextEditingController();

  List<Address> addresses = [];
  Address? selectedAddress;

  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _initializeSharedPreferences();
    _loadAddressesFromSharedPreferences();
  }

  void _initializeSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _loadAddressesFromSharedPreferences() {
    final addressList = _prefs?.getStringList('addresses');
    if (addressList != null) {
      setState(() {
        addresses = addressList
            .map((json) => Address.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<Address>();
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressDetailController.dispose();
    pincodeController.dispose();
    _prefs?.clear();
    _prefs = null;
    super.dispose();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add New Address',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your email';
                        }
                        // You can add additional email validation logic here
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        labelStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        // You can add additional phone number validation logic here
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: addressDetailController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: pincodeController,
                      decoration: InputDecoration(
                        labelText: 'Pincode',
                        labelStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your pincode';
                        }
                        // You can add additional pincode validation logic here
                        return null;
                      },
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            addresses.add(Address(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              address: addressDetailController.text,
                              pincode: pincodeController.text,
                              state: 'State',
                              city: 'City',
                            ));

                            _saveAddressesToSharedPreferences();
                          });
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(255, 63, 108, 1)),
                        // Change the button background color here
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(fontSize: 15)),
                        // Change the button font size here
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(12)),
                        // Change the button padding here
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            // Change the button border radius here
                          ),
                        ),
                      ),
                      child: Container(
                          width: double.infinity,
                          child: Center(child: Text('Add Address'))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _saveAddressesToSharedPreferences() {
    final addressList =
        addresses.map((address) => address.toJsonString()).toList();
    _prefs?.setStringList('addresses', addressList);
  }


  void _checkout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Confirmation'),
          content: Text('Your order has been confirmed.'),
          actions: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(255, 63, 108, 1),
                  ),
                ),
                child: Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (BuildContext context, int index) {
          final address = addresses[index];
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                '${address.firstName} ${address.lastName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    address.address,
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${address.city}, ${address.state} - ${address.pincode}',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                  Text(
                    address.phone,
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                  Text(
                    address.email,
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    addresses.removeAt(index);
                    _saveAddressesToSharedPreferences();
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 63, 108, 1),
        onPressed: _showBottomSheet,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<Address>(
                value: selectedAddress,
                hint: Text(
                  'Select an address',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                isExpanded: true,
                onChanged: (Address? value) {
                  setState(() {
                    selectedAddress = value;
                  });
                },
                items:
                    addresses.map<DropdownMenuItem<Address>>((Address address) {
                  return DropdownMenuItem<Address>(
                    value: address,
                    child: Text('${address.firstName} ${address.lastName}'),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _checkout();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(255, 63, 108, 1),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 15),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(12),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  child: Center(child: Text('Checkout')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
