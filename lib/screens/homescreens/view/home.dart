import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screens/homescreens/view/homeprovider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeProvider homeProviderR;
  late HomeProvider homeProviderW;
  void showCity() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 100,
            width: 300,
            color: Colors.black,
            child: SearchBar(
              controller: txtsearch,
              onSubmitted: (value) {
                txtsearch.text = value;

                context.read<HomeProvider>().getData(value);
                ();
                Navigator.pop(context);
                txtsearch.clear();
                context.read<HomeProvider>().setSearch(
                    context.read<HomeProvider>().getData(value) as String);
              },
              hintText: "Search city",
              padding: const WidgetStatePropertyAll(
                EdgeInsets.only(left: 20, top: 5),
              ),
              hintStyle: const WidgetStatePropertyAll(
                TextStyle(color: Colors.white),
              ),
              textStyle: const WidgetStatePropertyAll(
                TextStyle(color: Colors.white),
              ),
              backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    context.read<HomeProvider>().getData('surat');
    super.initState();
  }

  TextEditingController txtsearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    homeProviderW = context.watch<HomeProvider>();
    homeProviderR = context.read<HomeProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage(homeProviderW.getIcon(
                      homeProviderW.weatherModel?.main.toString() ?? '') ??
                  'assets/gif/1.gif'),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onLongPress: () {
                        Navigator.pushNamed(context, '/bookmark');
                      },
                      child: IconButton(
                        onPressed: () {
                          homeProviderR.getData(
                            homeProviderW.bookmarkHistory[0],
                          );
                        },
                        icon: const Icon(
                          Icons.bookmark_add_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(
                      '\t\t\t\t${homeProviderW.weatherModel?.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/history');
                      },
                      icon:
                          const Icon(Icons.add, color: Colors.white, size: 30),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        context.read<HomeProvider>().getData(txtsearch.text);
                      },
                      onSubmitted: (value) {
                        homeProviderR.searchHistory.insert(0, value);
                        txtsearch.clear();
                      },
                      controller: txtsearch,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                        hintText: 'City Name',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            '${homeProviderW.weatherModel?.main?.temp?.toInt()}°',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 60,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 100,
                                height: 80,
                                child: Column(
                                  children: [
                                    const Text(
                                      'Temp',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Center(
                                      child: Text(
                                        'Max :${homeProviderW.weatherModel?.main?.tempMax?.toInt()}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Center(
                                      child: Text(
                                        'Min :${homeProviderW.weatherModel?.main?.tempMin?.toInt()}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 100,
                                child: Image(
                                  image: AssetImage(homeProviderW.getImage(
                                          homeProviderW.weatherModel?.main
                                                  .toString() ??
                                              '') ??
                                      'assets/image/4.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: 100,
                                height: 80,
                                child: Column(
                                  children: [
                                    const Text(
                                      'Coord',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Center(
                                      child: Text(
                                        'Lan :${homeProviderW.weatherModel?.coord?.lat?.toInt()}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Center(
                                      child: Text(
                                        'Lon :${homeProviderW.weatherModel?.coord?.lon?.toInt()}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              'Feels like :${homeProviderW.weatherModel?.main?.feelsLike?.toInt()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Center(
                            child: Text(
                              'Pressure :${homeProviderW.weatherModel?.main?.pressure?.toInt()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                const Text(
                                  'All',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Clouds :${homeProviderW.weatherModel?.clouds?.all?.toInt()}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        'Humidity :${homeProviderW.weatherModel?.main?.humidity?.toInt()}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        'Visibility :${homeProviderW.weatherModel?.visibility?.toInt()}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${homeProviderW.weatherModel?.weather?[0].description}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image(
                    image: AssetImage(homeProviderW.getcardImage(
                            homeProviderW.weatherModel?.main.toString() ??
                                '') ??
                        'assets/image/sunny.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
