import 'package:crafton/Artist/UIdesign/Uidesign/Offerpage.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/vieworderspage.dart';
import 'package:crafton/Artist/UIdesign/fuctions/artistgetprofilefun.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtistSettingsPage extends StatefulWidget {
  const ArtistSettingsPage({super.key});

  @override
  _ArtistSettingsPageState createState() => _ArtistSettingsPageState();
}

class _ArtistSettingsPageState extends State<ArtistSettingsPage> {
  final ValueNotifier<int?> _selectedCard = ValueNotifier<int?>(null);

  @override
  void dispose() {
    _selectedCard.dispose();
    super.dispose();
  }

  Future<void> navigateToProfile() async {
    await artistprofilegetfun();
    Navigator.pushNamed(context, "artistprofile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artist Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      drawer: Drawer(
        width: 230,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                child: Center(
                  child: Text(
                    "Artist Menu",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
              _drawerItem(
                icon: Icons.person,
                label: "Profile",
                onTap: navigateToProfile,
              ),
              _drawerItem(
                icon: Icons.settings,
                label: "Settings",
                onTap: () {},
              ),
              _drawerItem(
                icon: Icons.logout,
                label: "Logout",
                onTap: () async {
                  Navigator.pushNamed(context, "firstscreen");
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ValueListenableBuilder<int?>(
          valueListenable: _selectedCard,
          builder: (context, selected, _) {
            return GridView.count(
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              children: <Widget>[
                _gridCard(
                  index: 0,
                  icon: Icons.image,
                  label: "Gallery",
                  selected: selected == 0,
                  onTap: () async {
                    _selectedCard.value = 0;
                    Provider.of<Artistprovider>(context, listen: false)
                        .artistgetgalleryfun();
                    Navigator.pushNamed(context, "addgallery");
                  },
                ),
                _gridCard(
                  index: 1,
                  icon: Icons.shopping_bag,
                  label: "Orders",
                  selected: selected == 1,
                  onTap: () async {
                    _selectedCard.value = 1;
                    await Provider.of<Artistprovider>(context, listen: false)
                        .getorderviewfun();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ArtistOrdersPage(),
                      ),
                    );
                  },
                ),
                _gridCard(
                  index: 2,
                  icon: Icons.card_giftcard,
                  label: "Offers",
                  selected: selected == 2,
                  onTap: () async {
                    _selectedCard.value = 2;
                    await Provider.of<Artistprovider>(context, listen: false)
                        .artistgetofferfunction();
                        await artistprofilegetfun();
                        
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OfferBrochuresPage(),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String label,
    required Function() onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.teal),
        onTap: onTap,
      ),
    );
  }

  Widget _gridCard({
    required int index,
    required IconData icon,
    required String label,
    required bool selected,
    required Function() onTap,
  }) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: selected ? Colors.teal : const Color.fromARGB(255, 104, 100, 100),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: selected ? Colors.teal : const Color.fromARGB(255, 107, 105, 105),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
