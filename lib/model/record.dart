import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data()! as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
