import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screens/homescreens/view/homeprovider.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late HomeProvider homeProviderR;
  late HomeProvider homeProviderW;

  @override
  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '\t\t\t\t\t\t\tSearch History',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<HomeProvider>().searchHistory.length,
                itemBuilder: (context, index) {
                  final history = homeProviderW.searchHistory[index];
                  return GestureDetector(
                    onTap: () {
                      homeProviderR.getData(
                        history,
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      context
                                          .watch<HomeProvider>()
                                          .searchHistory[index],
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Image(
                                      image: AssetImage(homeProviderW.getImage(
                                              homeProviderW.weatherModel?.main
                                                      .toString() ??
                                                  '') ??
                                          'assets/image/8.png'),
                                      height: 40,
                                      width: 40,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  '${homeProviderW.weatherModel?.main?.temp?.toInt()}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
