import 'package:bitcoin/send.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0; // Store the selected index
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  final List<String> items = ['BitCoin', 'BitCoin', 'BitCoin'];
  final List<String> items2 = ['0.01512 BTC', '0.01512 BTC', '0.01512 BTC'];
  final List<String> items3 = ["\$4,179.12", "\$4,179.12", "\$4,179.12"];
  final List<String> items4 = ['+15.1%', '+15.1%', '+15.1%'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/back.png'),
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                        gradient: LinearGradient(
                          begin: Alignment
                              .bottomRight, // Start from the bottom right corner
                          end: Alignment.topLeft, // End at the top left corner
                          colors: [
                            Color(0xF5F5F5),
                            Colors.black,
                          ], // Specify your colors here
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("images/1.png"),
                                  radius: 37,
                                ),
                              ),
                              Text(
                                "Send",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onTap: () {
                            {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mysendscreen()),
                              );
                            }
                          },
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("images/2.png"),
                                radius: 37,
                              ),
                            ),
                            Text(
                              "Recieve",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("images/3.png"),
                                radius: 37,
                              ),
                            ),
                            Text(
                              "Swap",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    // Tab Bar
                    Container(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TabBar(
                          indicatorColor: Colors.lightGreen,
                          indicator: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // Creates border
                              color: Colors.greenAccent),
                          //  labelColor: Colors.lightGreen,
                          controller: _tabController,
                          tabs: [
                            Tab(text: 'Coins'),
                            Tab(text: 'NFT'),
                          ],
                        ),
                      ),
                    ),
                    // Tab Bar View
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Coin Tab
                          ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    "images/btc.png"),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  items[index],
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  items2[index],
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              items3[index],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              items4[index],
                                              style: TextStyle(
                                                  color: Colors.lightGreen),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          // BTC Tab
                          Center(
                            child: Text(
                              'BTC',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Material(
                // Wrap the BottomNavigationBar with Material
                elevation: 10.0, // Adjust the elevation for the shadow
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor:
                        Colors.black.withOpacity(0.9), // Adjust opacity
                    selectedItemColor: Colors.greenAccent,
                    unselectedItemColor: Colors.grey,
                    currentIndex: _selectedIndex, // Set the selected index
                    onTap: _onItemTapped, // Function to handle item taps
                    items: const [
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage("images/wallet.png"),
                          //color: Colors.red,
                          size: 30,
                        ),
                        label: 'Wallet',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage("images/dol.png"),
                          //color: Colors.red,
                          size: 30,
                        ),
                        label: 'Buy/Sell',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage("images/acc.png"),
                          //color: Colors.red,
                          size: 30,
                        ),
                        label: 'Academy',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage("images/set.png"),
                          //color: Colors.red,
                          size: 30,
                        ),
                        label: 'Setting',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
