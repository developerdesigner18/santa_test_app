import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task_santa/module/home/home_controller.dart';
import 'package:test_task_santa/widgets/child_tile.dart';

import '../../data/models/child_model.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Christmas App'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Children List',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.sp,
            ),
          ),
          20.verticalSpace,
          Obx(
            () => GridView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 100.h / 90.w,
              ),
              itemCount: controller.children().length,
              itemBuilder: (context, index) => Obx(
                () {
                  Child child = controller.children()[index];
                  return ChildTile(
                    child: child,
                    onBehaviourTap: () {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) => AlertDialog.adaptive(
                          title: Text('Are you sure ?'),
                          content: Text(
                              'Confirm that you want to change this ${child.name}\'s behaviour ?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.updateChild(child);
                                Navigator.pop(context);
                              },
                              child: Text('Confirm'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          _openAddSheet(context);
        },
        child: const Text('Add child'),
      ),
    );
  }

  void _openAddSheet(BuildContext context) {
    showModalBottomSheet(
      enableDrag: true,
      useSafeArea: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: 0.8.sh,
      ),
      context: context,
      builder: (context) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            Text(
              'Add Child',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
            ),
            10.verticalSpace,
            Divider(),
            10.verticalSpace,
            TextFormField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter child name'),
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return 'Enter valid Name.';
                }
              },
            ),
            10.verticalSpace,
            TextFormField(
              controller: controller.countryController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Country',
                  hintText: 'Enter country name'),
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return 'Enter valid Country.';
                }
              },
            ),
            10.verticalSpace,
            DropdownButtonFormField(
              value: 'naughty',
              items: const [
                DropdownMenuItem(
                  value: 'naughty',
                  child: Text('Naughty'),
                ),
                DropdownMenuItem(
                  value: 'nice',
                  child: Text('Nice'),
                ),
              ],
              onChanged: (value) {},
            ),
            20.verticalSpace,
            ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState?.validate() ?? false) {
                  Child child = Child(
                    name: controller.nameController.text,
                    country: controller.countryController.text,
                    isNaughty: controller.selectedBehaviour() == 'Naughty',
                  );
                  controller.addChild(child);
                  Navigator.pop(context);
                  controller.nameController.clear();
                  controller.countryController.clear();
                }
              },
              child: Text('Submit'),
            ),
          ],
        ).paddingAll(20.r),
      ),
    );
  }
}
