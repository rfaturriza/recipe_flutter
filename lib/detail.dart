import 'package:dicoding_submission/model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final RecipeModel? data;
  const DetailPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
            decoration: BoxDecoration(
                color: Colors.orange[400],
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                })),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageTop(urlImage: data!.urlImage),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.7,
                  ),
                  TitleCard(
                    name: data!.name,
                    total: data!.totalingredients,
                    time: data!.time,
                    kall: data!.kall,
                    serv: data!.serv,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      String key = data!.ingradient!.keys.elementAt(index);
                      return IngredientsCard(
                        ingredientName: key,
                        totalItem: data!.ingradient![key],
                      );
                    },
                    itemCount: data!.ingradient!.length,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Cooking Instruction',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: data!.step!.asMap().entries.map((e) {
                    int idx = e.key + 1;
                    String val = e.value;
                    return StepCard(
                      index: idx,
                      step: val,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}

class ImageTop extends StatelessWidget {
  final String? urlImage;
  const ImageTop({Key? key, this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Image.network(
          urlImage!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TitleCard extends StatelessWidget {
  final String? name;
  final int? total, time, kall, serv;
  const TitleCard(
      {Key? key, this.name, this.total, this.time, this.kall, this.serv})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                name!,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
              Text('${total!} Ingredients',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[500],
                      fontSize: 12)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.orange[300],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${time!} min',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500],
                              fontSize: 13)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.fireplace_outlined,
                        color: Colors.orange[300],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${kall!} Kall',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500],
                              fontSize: 13)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.track_changes_outlined,
                        color: Colors.orange[300],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${serv!} serve',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500],
                              fontSize: 13)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IngredientsCard extends StatelessWidget {
  final String? ingredientName, totalItem;
  const IngredientsCard({Key? key, this.ingredientName, this.totalItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 100,
            width: 100,
            child: ClipRRect(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2012/04/18/14/37/tomato-37219_960_720.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            child: Text(
              ingredientName!,
              style: TextStyle(fontWeight: FontWeight.w900),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(totalItem!,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[500],
                  fontSize: 12)),
        ],
      ),
    );
  }
}

class StepCard extends StatelessWidget {
  final int? index;
  final String? step;
  const StepCard({Key? key, this.index, this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(15.0),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step ${index!.toString()}',
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.orange),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              step!,
              style: TextStyle(fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
