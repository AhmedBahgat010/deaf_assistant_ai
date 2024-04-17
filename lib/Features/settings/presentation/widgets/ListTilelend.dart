import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget EmdListTile({required String title,required Function()? ontap}){
  return     InkWell(
    onTap: ontap,
    child: ListTile(
      title: Text(
        title,
        style: AppTextStyles.w600.copyWith(
            fontSize: 20, overflow: TextOverflow.ellipsis),
      ),
      trailing: const Icon(Icons.chevron_right_sharp),
    ),
  );
}