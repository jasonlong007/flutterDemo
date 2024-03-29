import 'package:flutter/material.dart';
import 'package:using_listview/contactlist/modal/contact.dart';

class ContactListItem extends StatelessWidget {
  final ContactModal _contactModal;
  ContactListItem(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // 创建一个CircleAvatar组件，圆形和圆角图片
      leading: CircleAvatar(
       child: Text(_contactModal.fullName[0]),
      ),
      title: Text(_contactModal.fullName),
      subtitle: Text(_contactModal.email),
    );
  }
}