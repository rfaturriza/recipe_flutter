import 'package:dicoding_submission/detail_responsive.dart';
import 'package:dicoding_submission/model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Column(
          children: [
            CustomAppbar(),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  final RecipeModel data = recipeModelList[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailResponsive(
                          data: data,
                        );
                      }));
                    },
                    child: RecipeCard(
                      name: data.name,
                      urlImage: data.urlImage,
                    ),
                  );
                },
                itemCount: recipeModelList.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Recomended',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  final RecipeModel data = recipeModelList[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailResponsive(
                          data: data,
                        );
                      }));
                    },
                    child: RecommendedCard(
                      name: data.name,
                      urlImage: data.urlImage,
                      time: data.time,
                      totalIng: data.totalingredients,
                    ),
                  );
                },
                itemCount: recipeModelList.length,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);
  final String name = 'RFaturriza';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hello, $name',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            ClipOval(
              child: Image.network(
                'https://cms-assets.tutsplus.com/uploads/users/346/posts/30944/image/coolphoto3.jpg',
                scale: 30,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Row(
            children: [
              Icon(Icons.search),
              SizedBox(
                width: 10,
              ),
              Text('Search for recipe')
            ],
          ),
        ),
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String? urlImage, name;
  final int? totalIng, time;
  const RecipeCard(
      {Key? key, this.urlImage, this.name, this.totalIng, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.orange[400],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  urlImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Text(
                name!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.visible,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecommendedCard extends StatefulWidget {
  final String? urlImage, name;
  final int? totalIng, time;

  const RecommendedCard(
      {Key? key, this.urlImage, this.name, this.totalIng, this.time})
      : super(key: key);

  @override
  _RecommendedCardState createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 350,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              width: 180,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.urlImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                bottom: 5,
                right: 5,
                child: Card(
                  color: Colors.black,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: color,
                    ),
                    onPressed: () {
                      setState(() {
                        if (color == Colors.grey) {
                          color = Colors.red;
                        } else
                          color = Colors.grey;
                      });
                    },
                  ),
                ))
          ]),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.name!,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text('${widget.totalIng!} Ingredients . ${widget.time!} min',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[500],
                  fontSize: 12)),
        ],
      ),
    );
  }
}
