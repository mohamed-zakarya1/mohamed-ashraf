import 'package:flutter/material.dart';
import 'package:news/Providers/news_providers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

//dcasc
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<NewsProviders>(
            builder: (context, value, child) {
              if (value.model == null) {
                value.fetchApi();
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(value.model!.data[index]["image"]),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              value.model!.data[index]["title"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(value.model!.data[index]["description"])
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: value.model!.data.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
              );
            },
          )),
    );
  }
}
