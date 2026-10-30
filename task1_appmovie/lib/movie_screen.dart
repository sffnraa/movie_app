import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  // Daftar Now Playing
  final List<String> nowPlayingPosters = const [
    'https://media.themoviedb.org/t/p/w440_and_h660_face/6Ryitt95xrO8KXuqRGm1fUuNwqF.jpg',
    'https://media.themoviedb.org/t/p/w440_and_h660_face/bR8ISy1O9XQxqiy0fQFw2BX72RQ.jpg',
    'https://media.themoviedb.org/t/p/w440_and_h660_face/fcDXgGL14qL46It1XOozEjX5Jws.jpg',
  ];

  // Daftar Trending
  final List<String> trendingPosters = const [
    'https://media.themoviedb.org/t/p/w440_and_h660_face/bjiS5ipwxb9JFy3XRRN4OAilSeX.jpg',
    'https://media.themoviedb.org/t/p/w440_and_h660_face/6VY1ZKgpsc8CfGsQcCGiYEgHdH0.jpg',
    'https://media.themoviedb.org/t/p/w440_and_h660_face/fgSm5ylwiXbIHn8UbUXDjk9RRu4.jpg',
  ];

  // Daftar Popular
  final List<String> popularPosters = const [
    'https://media.themoviedb.org/t/p/w440_and_h660_face/sfQtVlIHljToOwYjhe21KPGzZWK.jpg',
    'https://media.themoviedb.org/t/p/w440_and_h660_face/gaet1xQ2nxrG0V1Ep9T20ZMNEIC.jpg',
    'https://media.themoviedb.org/t/p/w440_and_h660_face/enz3WLx5QU1FUyhXZld04QWIc6N.jpg',
  ];

  // Daftar Top Rated
  final List<String> topRatedPosters = const [
    'https://media.themoviedb.org/t/p/w440_and_h660_face/iOb2fjXLbpJgyQXe46n1WtGCnaa.jpg',
    'https://media.themoviedb.org/t/p/w440_and_h660_face/3sgnSfNT27Bx5O5ukr7B26mhEQq.jpg',
    'https://media.themoviedb.org/t/p/w440_and_h660_face/bOth4QmNyEkalwahfPCfiXjNh1r.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainTitle('Now Playing'),
              _buildNowPlaying(nowPlayingPosters),
              _buildSectionTitle('Trending'),
              _buildHorizontalList(trendingPosters),
              _buildSectionTitle('Popular'),
              _buildHorizontalList(popularPosters),
              _buildSectionTitle('Top Rated'),
              _buildHorizontalList(topRatedPosters),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildNowPlaying(List<String> posters) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 350.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.6,
        ),
        items: posters.map((url) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(url, fit: BoxFit.cover),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHorizontalList(List<String> posters) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posters.length,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                posters[index],
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainTitle( String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            'More',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ), 
        ],
      )  
    );
  }
}