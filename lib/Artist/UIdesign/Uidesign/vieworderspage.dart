import 'package:crafton/Artist/UIdesign/Uidesign/acceptedlistpage.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/deliveredlist.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/orderwaitinglist.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtistOrdersPage extends StatelessWidget {
  const ArtistOrdersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Orders', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // "Waiting Orders" Button
            Consumer<Artistprovider>(
              builder: (context, value, child) => _orderButton(
                label: "Waiting Orders",
                icon: Icons.hourglass_empty,
                color: Colors.white,
                onTap: () async {
                  // Navigate to waiting orders page
                  await value.getorderviewfun();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrdersListPage(
                          waitinglist: value.artistvieworwaitingderlist),
                    ),
                  );
                  await value.getorderviewfun();
                },
              ),
            ),

            const SizedBox(height: 20),

            // "Accepted Orders" Button
            Consumer<Artistprovider>(
              builder: (context, value, child) => _orderButton(
                label: "Accepted Orders",
                icon: Icons.check_circle_outline,
                color: Colors.white,
                onTap: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => acceptedListPage(
                          acceptedlist: value.artistviewacceptedorderlist),
                    ),
                  );
                  await value.getorderviewfun();
                },
              ),
            ),

            const SizedBox(height: 20),

            // "Delivered Orders" Button
            Consumer<Artistprovider>(
              builder: (context, value, child) => _orderButton(
                label: "Delivered Orders",
                icon: Icons.local_shipping_outlined,
                color: Colors.white,
                onTap: () async {
                  // Navigate to delivered orders page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => deliveredListPage(
                          deliveredlist: value.artistviewdeliveredorderlist),
                    ),
                  );
                  await value.getorderviewfun();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderButton({
    required String label,
    required IconData icon,
    required Color color,
    required Function() onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 30, color: const Color.fromARGB(255, 76, 72, 72)),
      label: Text(
        label,
        style: const TextStyle(
            fontSize: 18, color: Color.fromARGB(255, 104, 99, 99)),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 8,
        padding: const EdgeInsets.symmetric(vertical: 20),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
