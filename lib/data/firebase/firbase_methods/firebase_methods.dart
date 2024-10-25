import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_first/data/custom_log.dart';

class FirebaseMethods{




  Future<Map<String, dynamic>?> add({
    required CollectionReference collection,
    required Map<String, dynamic> body,
  }) async {
    CustomLog.customPrinter(body);

    // Add the document to the collection
    DocumentReference value = await collection.add(body);

    // Fetch the document snapshot using await
    DocumentSnapshot docSnapshot = await value.get();

    // Check if the document exists and return the data
    if (docSnapshot.exists) {
      CustomLog.customPrinterGreen(docSnapshot.data());
      return docSnapshot.data() as Map<String, dynamic>; // Ensure it's casted to Map<String, dynamic>
    }

    return null;
  }

}