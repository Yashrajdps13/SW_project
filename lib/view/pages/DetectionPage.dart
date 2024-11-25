import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DetectionPage extends StatefulWidget {
  const DetectionPage({super.key});

  @override
  _DetectionPageState createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  File? _selectedFile;
  bool _isLoading = false;
  String _uploadStatus = "No file uploaded";

  // Function to pick a PDF file
  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  // Function to upload file to Firebase
  Future<void> uploadToFirebase() async {
    if (_selectedFile == null) {
      setState(() {
        _uploadStatus = "No file selected!";
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Generate a unique file name
      String fileName = "uploads/${const Uuid().v4()}.pdf";

      // Upload file to Firebase Storage
      final ref = FirebaseStorage.instance.ref().child(fileName);
      await ref.putFile(_selectedFile!);

      // Get the file's download URL
      String downloadUrl = await ref.getDownloadURL();

      setState(() {
        _uploadStatus = "Upload Successful! Download URL: $downloadUrl";
      });
    } catch (e) {
      setState(() {
        _uploadStatus = "Upload Failed: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _selectedFile != null
                ? const Text('PDF Selected: Ready to Upload')
                : const Text('No file selected.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickPDF,
              child: const Text('Pick PDF'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : uploadToFirebase,
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text('Upload to Firebase'),
            ),
            const SizedBox(height: 20),
            Text(
              _uploadStatus,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
