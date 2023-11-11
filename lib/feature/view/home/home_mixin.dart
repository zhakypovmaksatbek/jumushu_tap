import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meenet/feature/model/job_model.dart';
import 'package:meenet/feature/view/home/home_page.dart';

mixin HomeMixin on State<HomePage> {
  late final data;
  Future<List<Job>> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('jobs').get();
    List<Job> jobList = [];
    for (var doc in querySnapshot.docs) {
      jobList.add(Job.fromJson(doc.data() as Map<String, dynamic>));
    }
    return jobList;
  }

  @override
  void initState() {
    data = fetchData();
    super.initState();
  }
}
