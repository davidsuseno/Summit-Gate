import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

ValueNotifier<File?> profileImageNotifier = ValueNotifier<File?>(null);
ValueNotifier<String> profileNameNotifier = ValueNotifier<String>('');
ValueNotifier<String> profilePhoneNumberNotifier =
    ValueNotifier<String>('');

class ProfilPage extends StatefulWidget {
  final String email;
  const ProfilPage({required this.email, Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  File? _image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String email = "eve.holt@reqres.in";

  @override
  void initState() {
    super.initState();
    _image = profileImageNotifier.value;
    _nameController.text = profileNameNotifier.value;
    _phoneController.text = profilePhoneNumberNotifier.value;
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
  }

  void _saveChanges() {
    profileImageNotifier.value = _image;
    profileNameNotifier.value = _nameController.text.trim();
    profilePhoneNumberNotifier.value = _phoneController.text.trim();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile saved successfully!')),
    );
    Navigator.pop(context); // kembali ke page sebelumnya
  }

  void _showImageOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Profile Picture Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Image'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Remove Image'),
                onTap: () {
                  Navigator.pop(context);
                  _removeImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(250, 249, 133, 9),
                  const Color.fromARGB(255, 247, 178, 51),
                ],
              ),
            ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _showImageOptions,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : const AssetImage('assets/default_profile.png')
                                as ImageProvider,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    hintText: email,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
          
                SizedBox(height: 20),
                // Simpan perubahan profil
                ElevatedButton(
                  onPressed: _saveChanges,
                  child: Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}