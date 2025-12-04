import 'package:appdrop/provider/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helpers/widget_factory.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<PageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 10,
        surfaceTintColor: Colors.black12,
        shadowColor: Colors.black12,
        iconTheme: const IconThemeData(color: Colors.grey),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.menu, color: Colors.grey),
            const SizedBox(width: 50),
            const Text("AppDrop",style: TextStyle(color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 17,
            )),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: p.isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.grey))
          : Column(
            children: [
              Expanded(
                child: ListView.builder(
                        itemCount: p.components.length,
                        itemBuilder: (context, index) {
                return WidgetFactory.build(p.components[index]);
                        },
                      ),
              ),
            ],
          ),
    );
  }
}
