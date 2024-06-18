import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookup/features/auth/presentation/auth_provider.dart';
import 'package:lookup/ui/home/tabs/add_tab.dart';
import 'package:lookup/ui/home/tabs/chat_tab.dart';
import 'package:lookup/ui/home/tabs/home_tab.dart';
import 'package:lookup/ui/home/tabs/profile_tab.dart';
import 'package:lookup/ui/home/tabs/search_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedTab = 0;
  updateIndex(index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<FirebaseAuthProvider>(context);
    var tabs = [HomeTab(), SearchTab(), AddTab(), ChatTab(), ProfileTab()];
    var bottomNav = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: Color.fromARGB(255, 34, 37, 39),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TabItem(
            ontap: () => updateIndex(0),
            icon: FontAwesomeIcons.house,
            isSelected: selectedTab == 0,
          ),
          TabItem(
            ontap: () => updateIndex(1),
            icon: FontAwesomeIcons.search,
            isSelected: selectedTab == 1,
          ),
          TabItem(
            ontap: () => updateIndex(2),
            icon: Icons.add_circle_outline,
            isSelected: selectedTab == 2,
            size: 40,
          ),
          TabItem(
            ontap: () => updateIndex(3),
            icon: Icons.chat_bubble_outline_rounded,
            isSelected: selectedTab == 3,
            size: 28,
          ),
          TabItem(
            ontap: () => updateIndex(4),
            icon: Icons.person,
            isSelected: selectedTab == 4,
            size: 28,
          ),
        ],
      ),
    );
    return Scaffold(
      body: SafeArea(
        top: true,
        child: tabs[selectedTab],
      ),
      bottomNavigationBar: bottomNav,
    );
  }
}

///
class TabItem extends StatelessWidget {
  const TabItem(
      {super.key,
      this.ontap,
      required this.isSelected,
      required this.icon,
      this.size});
  final Function()? ontap;
  final bool isSelected;
  final IconData icon;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Icon(icon,
            size: size ?? 24,
            color: isSelected ? const Color(0xff4B39EF) : Colors.white));
  }
}
