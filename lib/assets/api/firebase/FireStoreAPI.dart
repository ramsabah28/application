import 'package:cloud_firestore/cloud_firestore.dart';


Future<bool> checkFirebaseConnection() async {
  try {

    final snapshot = await FirebaseFirestore.instance
        .collection('healthcheck')
        .limit(1)
        .get();

    // Wenn keine Exception – Verbindung besteht
    return true;
  } catch (e) {
    print('🔥 Firebase connection failed: $e');
    return false;
  }
}
