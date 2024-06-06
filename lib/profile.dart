import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // late TextEditingController _nameController;
  // late TextEditingController _emailController;
  // late TextEditingController _phoneController;
  // late TextEditingController _addressController;
  // late TextEditingController _businessNameController;
  // late TextEditingController _bioController;
  // late TextEditingController _passwordController;
  // late String _profilePictureUrl = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _nameController = TextEditingController();
  //   _emailController = TextEditingController();
  //   _phoneController = TextEditingController();
  //   _addressController = TextEditingController();
  //   _businessNameController = TextEditingController();
  //   _bioController = TextEditingController();
  //   _passwordController = TextEditingController();

  //   _loadProfileData();
  // }

  // void _loadProfileData() async {
  //   User? user = _auth.currentUser;
  //   if (user != null) {
  //     DocumentSnapshot snapshot =
  //         await _firestore.collection('users').doc(user.uid).get();
  //     Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  //     setState(() {
  //       _nameController.text = data['fullname'];
  //       _emailController.text = data['email'];
  //       _phoneController.text = data['phone'];
  //       _addressController.text = data['address'];
  //       _businessNameController.text = data['businessName'];
  //       _bioController.text = data['bio'];
  //       _profilePictureUrl = data['profilePictureUrl'];
  //     });
  //   }
  // }

  // void _updateProfile() async {
  //   User? user = _auth.currentUser;
  //   if (user != null) {
  //     await _firestore.collection('users').doc(user.uid).update({
  //       'fullname': _nameController.text,
  //       'email': _emailController.text,
  //       'phone': _phoneController.text,
  //       'address': _addressController.text,
  //       'businessName': _businessNameController.text,
  //       'bio': _bioController.text,
  //       'profilePictureUrl': _profilePictureUrl,
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Profile Updated'),
  //       ),
  //     );
  //   }
  // }

  // void _updateProfilePicture() {
  //   // Add logic to update the profile picture
  //   // You can use plugins like image_picker to pick an image
  //   // and then upload it to your storage and update the 'profilePictureUrl'
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
        backgroundColor: Theme.of(context)
            .colorScheme
            .secondary, // Set the background color of the app bar
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                //  onTap: _updateProfilePicture,
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/splash.jpg"),
                  radius: 60.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Name'),
                    //   subtitle: Text(_nameController.text),
                  ),
                  ListTile(
                    title: Text('Email'),
                    //   subtitle: Text(_emailController.text),
                  ),
                  ListTile(
                    title: Text('Phone'),
                    //  subtitle: Text(_phoneController.text),
                  ),
                  ListTile(
                    title: Text('Address'),
                    // subtitle: Text(_addressController.text),
                  ),
                  ListTile(
                    title: Text('Business Name (Optional)'),
                    //  subtitle: Text(_businessNameController.text),
                  ),
                  ListTile(
                    title: Text('Bio'),
                    //  subtitle: Text(_bioController.text),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const TextField(
              //  controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            const TextField(
              // controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const TextField(
              // controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            const TextField(
              //  controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            const TextField(
              //   controller: _businessNameController,
              decoration: InputDecoration(
                labelText: 'Business Name',
              ),
            ),
            const TextField(
              //   controller: _bioController,
              decoration: InputDecoration(
                labelText: 'Bio',
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 60,
              margin: const EdgeInsets.only(right: 20, left: 20),
              width: double.infinity,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurple,
                child: InkWell(
                  onTap: () {
                    // Get.offAll(
                    //     () => const PersonalAccountCustomBottomNavigationBar());
                  },
                  child: Center(
                    child: Text('Upload Data',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _phoneController.dispose();
  //   _addressController.dispose();
  //   _businessNameController.dispose();
  //   _bioController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
}
