import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false; // Define isDark variable
  final SearchController _searchController =
      SearchController(); // Search Controller

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: _searchController,
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      onTap: () {
                        _searchController.openView();
                      },
                      onChanged: (_) {
                        _searchController.openView();
                      },
                      leading: const Icon(Icons.search),
                      trailing: <Widget>[
                        Tooltip(
                          message: 'Change brightness mode',
                          child: IconButton(
                            isSelected: isDark,
                            onPressed: () {
                              setState(() {
                                isDark = !isDark; // Toggle theme
                              });
                            },
                            icon: const Icon(Icons.wb_sunny_outlined),
                            selectedIcon:
                                const Icon(Icons.brightness_2_outlined),
                          ),
                        ),
                      ],
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'Item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          _searchController.closeView(item);
                        },
                      );
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 158,
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: List.generate(4, (index) {
                        return Container(
                          height: 80,
                          width: 80,
                          margin: index == 0
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(170, 48),
                                ),
                                child: const Text('Button 1'),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(170, 48),
                                ),
                                child: const Text('Button 2'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
