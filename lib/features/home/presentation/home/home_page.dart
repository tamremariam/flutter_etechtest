import 'package:etechtest/features/wigets/custom_image_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: _buildSearchBar(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCategoryFilters(),
          Expanded(
            child: _buildFoodList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2; // Scan action
          });
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.qr_code_scanner, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Items
            Row(
              children: [
                _buildNavItem(Icons.home, "Home", 0),
                _buildNavItem(Icons.upload, "Upload", 1),
              ],
            ),
            // Right Items
            Row(
              children: [
                _buildNavItem(Icons.notifications, "Notification", 3),
                _buildNavItem(Icons.person, "Profile", 4),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the search bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  /// Builds the category filter chips
  Widget _buildCategoryFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildCategoryChip("All", true),
          SizedBox(width: 8),
          _buildCategoryChip("Food", false),
          SizedBox(width: 8),
          _buildCategoryChip("Drink", false),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) {},
      selectedColor: Colors.green,
      backgroundColor: Colors.grey.shade200,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }

  /// Builds the food items list
  Widget _buildFoodList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFoodCard("Pancake", "Food • >60 mins",
                "data:image/jpeg;base64,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"),
            _buildFoodCard("Salad", "Food • >60 mins",
                "data:image/jpeg;base64,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"),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFoodCard("Burger", "Food • >30 mins",
                "data:image/jpeg;base64,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"),
            _buildFoodCard("Pizza", "Food • >40 mins",
                "data:image/jpeg;base64,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"),
          ],
        ),
      ],
    );
  }

  Widget _buildFoodCard(String title, String subtitle, String imagePath) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: CustomImageView(
                    imagePath: imagePath,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a navigation item for the bottom navigation bar
  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Icon(
                icon,
                color: isSelected ? Colors.green : Colors.grey,
              ),
            ),
            SizedBox(height: 4), // Added spacing to avoid layout issues.
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.green : Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//---------------------------------------
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage>
//     with SingleTickerProviderStateMixin {
//   int _selectedCategoryIndex = 0;
//   final List<String> _categories = ["All", "Food", "Drink"];
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: TextField(
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.search, color: Colors.grey),
//               hintText: 'Search',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//                 borderSide: BorderSide.none,
//               ),
//               filled: true,
//               fillColor: Colors.grey[200],
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Category Chips
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//             child: Row(
//               children: _categories.asMap().entries.map((entry) {
//                 int index = entry.key;
//                 String category = entry.value;
//                 return Padding(
//                   padding: const EdgeInsets.only(right: 10.0),
//                   child: ChoiceChip(
//                     label: Text(category),
//                     selected: _selectedCategoryIndex == index,
//                     selectedColor: Colors.green,
//                     onSelected: (selected) {
//                       setState(() {
//                         _selectedCategoryIndex = index;
//                       });
//                     },
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//           // TabBar
//           TabBar(
//             controller: _tabController,
//             indicatorColor: Colors.green,
//             labelColor: Colors.green,
//             unselectedLabelColor: Colors.grey,
//             tabs: [
//               Tab(text: "Left"),
//               Tab(text: "Right"),
//             ],
//           ),
//           // Grid Items
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 // Left Tab
//                 GridView.builder(
//                   padding: const EdgeInsets.all(16.0),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     childAspectRatio: 0.75,
//                   ),
//                   itemCount: 4,
//                   itemBuilder: (context, index) {
//                     return ItemCard(
//                       imageUrl: index % 2 == 0
//                           ? "https://via.placeholder.com/150" // Replace with real image URLs
//                           : "https://via.placeholder.com/150",
//                       title: index % 2 == 0 ? "Pancake" : "Salad",
//                       author: index % 2 == 0 ? "Calum Lewis" : "Elif Sonas",
//                       time: ">60 mins",
//                     );
//                   },
//                 ),
//                 // Right Tab (Placeholder for now)
//                 Center(child: Text("Right Tab Content")),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.upload), label: "Upload"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.qr_code_scanner), label: "Scan"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.notifications), label: "Notification"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }

// class ItemCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String author;
//   final String time;

//   const ItemCard({
//     required this.imageUrl,
//     required this.title,
//     required this.author,
//     required this.time,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       elevation: 2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10.0),
//                 child: Image.network(
//                   imageUrl,
//                   height: 120,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   child: Icon(Icons.favorite_border, color: Colors.red),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text(author,
//                     style: TextStyle(color: Colors.grey, fontSize: 12)),
//                 SizedBox(height: 4),
//                 Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
