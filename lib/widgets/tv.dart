import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_text(
            text: 'Popular TV Shows ',
            size: 26,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: EdgeInsets.all(5),

                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                                image: DecorationImage(
                                  fit:BoxFit.cover,
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path']))),
                          ),
                          SizedBox(height:10),
                          Container(
                            child: Modified_text(
                                text: tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
                                    : 'Loading',
                                color: Colors.amber,
                                size: 15.0),)
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
