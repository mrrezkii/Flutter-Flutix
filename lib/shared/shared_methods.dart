part of 'shared.dart';

Future<File> getImage() async {
  File _image;
  var picker = ImagePicker();
  var pickedFile = await picker.getImage(source: ImageSource.gallery);
  _image = File(pickedFile.path);
  return _image;
}

Future<String> uploadImage(File image) async {
  firebase_storage.UploadTask uploadTask;

  String fileName = basename(image.path);

  firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref().child(fileName);
  uploadTask = ref.putFile(image);

  return (await uploadTask).ref.getDownloadURL();
}
