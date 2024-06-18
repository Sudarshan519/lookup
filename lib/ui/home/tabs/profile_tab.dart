import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lookup/features/auth/presentation/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FirebaseAuthProvider>(context);
    return ListView(
      children: [
        ListTile(
          onTap: () {
            provider.signOut();
          },
          title: Text("Logout"),
        )
      ],
    );
  }
}
