import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//value
Map profile = {
  'name': "Maria Perez",
  "coverPageUrl":
      "https://i.pinimg.com/564x/e7/c9/2e/e7c92e3987970562b617f79d6d50eea5.jpg",
  "avatarUrl":
      "https://i.pinimg.com/564x/d7/bd/7e/d7bd7ecd0addc9584aa548e9928ad73b.jpg",
  "descripcion": "Turismo",
  "location": "Merida, Venezuela",
  "instagram": "Maria69"
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageProfile(),
    );
  }
}

class PageProfile extends StatelessWidget {
  const PageProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                delegate: MySliverAppBar(expandedHeigth: 200), pinned: true),
            sliverBody(context: context)
          ],
        ),
      ),
    );
  }
}

//WIDGTE
PreferredSizeWidget appbar({required BuildContext context}) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
    bottom: PreferredSize(
        child: Container(color: Colors.white, height: 0.1),
        preferredSize: const Size.fromHeight(4.0)),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
    ],
  );
}

SliverList sliverBody({required BuildContext context}) {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: profileInfo(context: context),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: widgetButton(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: contentInfo(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: contentFriends(context: context),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: listFriends(),
        ),
      ],
    ),
  );
}

Widget profileInfo({required BuildContext context}) {
  return Column(
    children: <Widget>[
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              profile["name"],
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              profile["descripcion"],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '888',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'amigos',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[500]),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "10.0K",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'seguidores',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[500]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ],
  );
}

Widget widgetButton() {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(12),
              shadowColor: MaterialStateProperty.all(Colors.blue[300]),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
              backgroundColor:
                  MaterialStateProperty.all<Color?>(Colors.blue[400]),
              shape: MaterialStateProperty.all<StadiumBorder>(
                  const StadiumBorder(
                      side: BorderSide(color: Colors.transparent)))),
          icon: const Icon(Icons.person_add, size: 20),
          label: const Text("Agregar"),
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        flex: 1,
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
              backgroundColor:
                  MaterialStateProperty.all<Color?>(Colors.grey[300]),
              shape: MaterialStateProperty.all<StadiumBorder>(
                  const StadiumBorder(
                      side: BorderSide(color: Colors.transparent)))),
          icon: const Icon(
            Icons.chat_bubble,
            size: 20,
          ),
          label: const Text("mensaje", style: TextStyle(color: Colors.black)),
        ),
      ),
      const SizedBox(width: 12),
      ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
          backgroundColor: MaterialStateProperty.all<Color?>(Colors.grey[300]),
          shape: MaterialStateProperty.all<StadiumBorder>(
              const StadiumBorder(side: BorderSide(color: Colors.transparent))),
        ),
        child: const Icon(
          Icons.more_horiz,
          size: 20,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget contentInfo() {
  Color colorIcon = Colors.grey;
  TextStyle textStyle = const TextStyle(fontWeight: FontWeight.normal);

  return Container(
    color: Colors.grey.withOpacity(0.1),
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: colorIcon),
            const SizedBox(width: 8),
            Text(profile["location"], style: textStyle),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.web, color: colorIcon),
            const SizedBox(width: 8),
            Text(profile["instagram"], style: textStyle),
          ],
        ),
        const SizedBox(height: 8),
        Row(children: [
          Icon(Icons.person, color: colorIcon),
          const SizedBox(width: 8),
          Text("Mas informacion", style: textStyle),
        ]),
      ],
    ),
  );
}

Widget contentFriends({required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 70,
        child: Expanded(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Amigos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('8432-3 amigos en común'),
            ],
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shadowColor: MaterialStateProperty.all(Colors.blue[300]),
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
          backgroundColor: MaterialStateProperty.all<Color?>(Colors.grey[300]),
          shape: MaterialStateProperty.all<StadiumBorder>(
              const StadiumBorder(side: BorderSide(color: Colors.transparent))),
        ),
        child: const Text('ver todo', style: TextStyle(color: Colors.black)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Stack(
          children: [
            avatar(
              urlImage:
                  'https://i.pinimg.com/564x/4a/00/a8/4a00a85315f1bbeec2536d4219e83865.jpg',
              margin: const EdgeInsets.only(left: 60),
              size: 50,
            ),
            avatar(
              urlImage:
                  'https://i.pinimg.com/564x/d7/bd/7e/d7bd7ecd0addc9584aa548e9928ad73b.jpg',
              margin: const EdgeInsets.only(left: 30),
              size: 50,
            ),
            avatar(
              urlImage:
                  'https://i.pinimg.com/564x/d7/bd/7e/d7bd7ecd0addc9584aa548e9928ad73b.jpg',
              margin: const EdgeInsets.only(left: 0),
              size: 50,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget avatar(
    {String urlImage = ' defaul',
    double size = 50,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    double elevation = 5}) {
  return Container(
    margin: margin,
    height: size,
    width: size,
    child: Material(
      borderRadius: BorderRadius.circular(50),
      elevation: elevation,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircleAvatar(
          radius: 50.0,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(urlImage),
        ),
      ),
    ),
  );
}

Widget listFriends() {
  return SizedBox(
    height: 150,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        card(
          urlAvatar:
              'https://i.pinimg.com/564x/4a/00/a8/4a00a85315f1bbeec2536d4219e83865.jpg',
          name: 'Micke Carty',
          padding:
              const EdgeInsets.only(bottom: 12, top: 12, left: 5, right: 0),
        ),
        card(
          urlAvatar:
              'https://i.pinimg.com/564x/7c/6d/ce/7c6dce2ec0b3fa88a5f179ad69ac6fcb.jpg',
          name: 'Josue Perez',
          padding:
              const EdgeInsets.only(bottom: 12, top: 12, left: 5, right: 0),
        ),
        card(
          urlAvatar:
              'https://i.pinimg.com/736x/b3/14/69/b31469a67de0418ad8f6d7814c37daad.jpg',
          name: 'Cristian Caballero',
          padding:
              const EdgeInsets.only(bottom: 12, top: 12, left: 5, right: 0),
        ),
        card(
          urlAvatar:
              'https://i.pinimg.com/736x/7f/e8/c8/7fe8c85e6c2fa0c5372686c41d7c36a2.jpg',
          name: 'PePe Carty',
          padding:
              const EdgeInsets.only(bottom: 12, top: 12, left: 5, right: 0),
        ),
        card(
          urlAvatar:
              'https://i.pinimg.com/736x/64/73/40/6473403f8285465263871340344f9973.jpg',
          name: 'Micke Carty',
          padding:
              const EdgeInsets.only(bottom: 12, top: 12, left: 5, right: 0),
        ),
      ],
    ),
  );
}

Widget card(
    {String name = 'Nombre',
    String urlAvatar = 'default',
    EdgeInsetsGeometry padding = EdgeInsets.zero}) {
  return Padding(
    padding: padding,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 85,
        height: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              fadeInDuration: const Duration(milliseconds: 200),
              fit: BoxFit.cover,
              imageUrl: urlAvatar,
              placeholder: (context, url) => Container(color: Colors.grey[100]),
              errorWidget: (context, url, error) =>
                  Center(child: Container(color: Colors.grey[100])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                margin: const EdgeInsets.only(top: 18),
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeigth;

  MySliverAppBar({required this.expandedHeigth});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 200),
          fit: BoxFit.cover,
          imageUrl: profile["coverPageUrl"],
          placeholder: (context, url) => Container(color: Colors.grey),
          errorWidget: (context, url, error) =>
              Center(child: Container(color: Colors.grey)),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        Opacity(
          opacity: shrinkOffset / expandedHeigth,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                Expanded(child: Container()),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
            ),
          ),
        ),
        Positioned(
          top: expandedHeigth / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 3.5,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeigth),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: SizedBox(
                height: expandedHeigth,
                width: MediaQuery.of(context).size.width / 2.5,
                child: CircleAvatar(
                  radius: 41.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(profile["avatarUrl"]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeigth;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
