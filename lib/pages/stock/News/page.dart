import 'package:pedfi/model/news.dart';
import 'package:pedfi/pages/stock/News/cards.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State createState() => _NewsPageState();
}

class _NewsPageState extends State {
  @override
  void initState() {
    fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color textColor = themeState.getDarkTheme
        ? AppColor.textDarkThemeColor
        : AppColor.textLightThemeColor;

    final themeIsDark = themeState.getDarkTheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeIsDark ? Colors.blueGrey[900] : Colors.amber,
          title: Text(
            "Crypto News",
            style: TextStyle(
              color: themeIsDark ? Colors.white : Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: themeIsDark ? Colors.black : Colors.white12,
          child: FutureBuilder(
            future: fetchNews(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: ElevatedButton(
                          onPressed: () {
                            snapshot.hasData;
                          },
                          child: const Text("No network connection")),
                    );
                  } else {
                    final news = snapshot.data as CryptoNews;
                    return ListView.builder(
                      itemCount: news.articles!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var snap = news.articles![index];
                        return NewsCard(
                          urlToImage: snap.urlToImage,
                          title: snap.title,
                          url: snap.url,
                        );
                      },
                    );
                  }
              }
            },
          ),
        ));
  }
}
