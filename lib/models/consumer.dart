import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ConsumerModel consumerFromJson(Map<String, dynamic>? data) =>
    ConsumerModel.fromJson(data);

String consumerToJson(ConsumerModel data) => json.encode(data.toJson);

class ConsumerModel {
  ConsumerModel({
    required this.name,
    required this.id,
    required this.email,
    required this.address,
    required this.bill_date,
    required this.bill_no,
    required this.category,
    required this.meter_no,
    required this.meter_phase,
    required this.mob,
    required this.phase,
    required this.past_reading,
    required this.present_reading,
    required this.reading_date,
    required this.sanction_load,
    required this.status,
    required this.due,
    required this.consumer_id,
  });

  final String? name;
  final String? id;
  final String? email;
  final String? address;
  final Timestamp bill_date;
  final String? bill_no;
  final String? category;
  final String? meter_no;
  final String? meter_phase;
  final String? mob;
  final String? phase;
  final String? past_reading;
  final String? present_reading;
  final Timestamp reading_date;
  final String? sanction_load;
  final bool status;
  final String? due;
  final String? consumer_id;

  factory ConsumerModel.fromJson(Map<String, dynamic>? json) => ConsumerModel(
        name: json!["name"],
        id: json["id"],
        email: json["email"],
        address: json["address"],
        bill_date: json["bill_date"],
        bill_no: json["bill_no"],
        category: json["category"],
        meter_no: json["meter_no"],
        meter_phase: json["meter_phase"],
        mob: json["mob"],
        phase: json["phase"],
        past_reading: json["past_reading"],
        present_reading: json["present_reading"],
        reading_date: json["reading_date"],
        sanction_load: json["sanction_load"],
        status: json["status"],
        due: json["due"],
        consumer_id: json["consumer_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "email": email,
        "address": address,
        "bill_date": bill_date,
        "bill_no": bill_no,
        "category": category,
        "meter_no": meter_no,
        "meter_phase": meter_phase,
        "mob": mob,
        "phase": phase,
        "past_reading": past_reading,
        "present_reading": present_reading,
        "reading_date": reading_date,
        "sanction_load": sanction_load,
        "status": status,
        "due": due,
        "consumer_id": consumer_id,
      };
}
