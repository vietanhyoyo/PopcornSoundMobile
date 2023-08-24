import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  PaginationState createState() => PaginationState();
}

class PaginationState extends State<Pagination> {
  List<String> items = [];
  int currentPage = 1;
  int perPage = 10;

  @override
  void initState() {
    super.initState();
    fetchData(currentPage);
  }

  Future<void> fetchData(int page) async {
    // Simulate fetching data from an API
    await Future.delayed(Duration(seconds: 1));

    // Add fetched items to the list
    setState(() {
      items.addAll(
          List.generate(perPage, (index) => 'Item ${index + 1} (Page $page)'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index < items.length) {
            return ListTile(
              title: Text(items[index]),
            );
          } else if (index == items.length) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  currentPage++;
                  fetchData(currentPage);
                },
                child: Text('Tải thêm'),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
