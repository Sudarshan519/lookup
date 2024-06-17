import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookup/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ///
                  Container(
                    height: 160,
                    padding: const EdgeInsets.all(16),
                    color: const Color(0xff4B39EF),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.sort,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              "LOOK UP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.qr_code_scanner,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.all(8),
                            isDense: true,
                            
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Search and lookup your favourites',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.search),
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true),
                        ),
                      ],
                    ),
                  ),

                  ///
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 130, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(
                              0,
                              2,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.local_fire_department_sharp,
                                  size: 24,
                                ),
                                Text(
                                  'Trending',
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.solidThumbsUp,
                                size: 24,
                              ),
                              Text(
                                'Popular',
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.lightbulb_outline,
                                size: 24,
                              ),
                              Text(
                                'Latest',
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.person_sharp,
                                size: 24,
                              ),
                              Text(
                                'Following',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 230),
                      child: Column(
                        children: const [
                          CategoryWidget(
                            title:'Stories'
                          ),
                          CategoryWidget(title:"Trending"),
                          CategoryWidget(title:'Best Working'),
                          CategoryWidget(title:'Dancing'),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        color: Color(0xff14181B),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:   [
            Icon(
              FontAwesomeIcons.home,
              size:24,color:Colors.white
            ),
            Icon(FontAwesomeIcons.search,size:28,color:Colors.white),
            Icon(Icons.add_circle_outline, size: 40,color:  const Color.fromARGB(255, 21, 101, 192)),
            Icon(Icons.chat_bubble_outline_rounded,size:28,color:Colors.white),
            Icon(Icons.person,size:28,color:Colors.white)
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key, required this. title,
  });

final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  16.0,vertical: 8),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 16, top: 0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/seed/812/600'),
                      fit: BoxFit.fill)),
              margin: EdgeInsets.only(right: 8),
              height: 220,
              width: 120,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/detail', arguments: {
                    'image': 'https://picsum.photos/seed/812/600'
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 12,)
      ],
    );
  }
}
