import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class whatsaapchat{
  Future<void> contactUsLaunchWhatsapp() async{
    const link = WhatsAppUnilink(
      phoneNumber: '+917985417276',
      text: 'Hi there I am facing an issue with quiz mate'
    );
    final url =Uri.parse('$link');
    if(await canLaunchUrl(url))
    {
      await launchUrl(url);
    }
    else
    {
      debugPrint('Cannot Launch Url $url');
    }
  }
}