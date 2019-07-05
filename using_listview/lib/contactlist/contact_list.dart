import 'package:flutter/material.dart';
import 'package:using_listview/contactlist/modal/contact.dart';
import 'contact_list_item.dart';

class ContactList extends StatelessWidget {
  // 从modal层调用类
  final List<ContactModal> _contactModal;
  // 初始化,并赋值
  ContactList(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // EdgeInsets.symmetric用于设置对称方向的补白，vertical指top和bottom，horizontal指left和right

      padding: EdgeInsets.symmetric(vertical: 80.0),
      children: _buildContactsList(),
    );
  }

 List<ContactListItem> _buildContactsList(){
  return _contactModal.map((contact)=>ContactListItem(contact)).toList();
 }

}

