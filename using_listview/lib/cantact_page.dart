
import 'package:flutter/material.dart';
import 'contactlist/contact_list.dart';
import 'contactlist/modal/contact.dart';


class ContactPage extends StatelessWidget {
  _buildContactsList(){
    return <ContactModal>[
       const ContactModal(
         fullName: 'Jason Long',email: 'jasonlong1202@qq.com'
       ),
        const ContactModal(
         fullName: '龙泊湾',email: 'jasonlong1202@qq.com'
       ),
        const ContactModal(
         fullName: '科比',email: 'jasonlong1202@qq.com'
       ),
        const ContactModal(
         fullName: '乔丹',email: 'jasonlong1202@qq.com'
       ),
        const ContactModal(
         fullName: '詹姆斯',email: 'jasonlong1202@qq.com'
       ),
        const ContactModal(
         fullName: '杜兰特',email: 'jasonlong1202@qq.com'
       ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactList(_buildContactsList())
    );
  }
}