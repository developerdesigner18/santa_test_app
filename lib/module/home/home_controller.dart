import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/models/child_model.dart';

class HomeController extends GetxController {
  RxList<Child> children = <Child>[].obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  RxString selectedBehaviour = ''.obs;

  @override
  void onInit() {
    children(
      childrenDataList.map((child) => Child.fromJson(child)).toList(),
    );
    super.onInit();
  }

  // To update child's behaviour
  void updateChild(Child child) {
    int index = children.indexOf(child);
    children().removeAt(index);
    children().insert(
      index,
      Child(
        name: child.name,
        country: child.country,
        isNaughty: !child.isNaughty,
      ),
    );
    children.refresh();
  }

  // To add new child
  void addChild(Child child) {
    children().add(child);
    log(children().toString(), name: 'Add child');
    update();
    children.refresh();
  }
}
