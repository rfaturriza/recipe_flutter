class RecipeModel {
  String? name;
  int? totalingredients;
  int? time;
  int? kall;
  int? serv;
  Map<String, String>? ingradient;
  List<String>? step;
  String? urlImage;

  RecipeModel(
      {this.name,
      this.ingradient,
      this.kall,
      this.serv,
      this.step,
      this.totalingredients,
      this.time,
      this.urlImage});
}

var recipeModelList = [
  RecipeModel(
      name: 'Greek salad',
      totalingredients: 6,
      time: 30,
      kall: 234,
      serv: 3,
      ingradient: {
        'tomato': '1 items',
        'Cheese': '200 gr',
        'Greens': '1 items',
        'Onion': '1/2 items',
      },
      step: [
        'Bring Well-saldted water to a boil. Cook the',
        'Melt 1 tablespoon butter in a large skillet over medium heat. Add chicken; cook and stir until lightly browned, about 10 minutes. Remove from heat.'
      ],
      urlImage:
          'https://image.freepik.com/free-photo/vegetable-salad-with-tomatoes-red-onions-sauce-black-top-view_215990-91.jpg'),
  RecipeModel(
      name: 'Homemade Pizza',
      totalingredients: 10,
      time: 50,
      kall: 234,
      serv: 3,
      ingradient: {
        'tomato': '1 items',
        'Cheese': '200 gr',
        'Greens': '1 items',
        'Onion': '1/2 items',
      },
      step: [
        'Mix garam masala, tandoori masala, curry, cumin, cardamom, cayenne, salt, and black pepper together in a small bowl to make spice mixture.',
        'Place chicken in a large bowl and add 1/2 the spice mixture; turn to coat evenly.'
      ],
      urlImage:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-homemade-pizza-horizontal-1542312378.png'),
  RecipeModel(
      name: 'Creamy Tomato Pasta',
      totalingredients: 11,
      time: 20,
      kall: 340,
      serv: 5,
      ingradient: {
        'short pasta': '1 pound',
        'small yellow onion': '200 gr',
        'garlic': '1 items',
        'red pepper flakes': '1 pinch',
        'kosher salt': '1/2 teaspoon',
        'freshly ground black pepper ': '1/4 teaspoon',
        'crushed tomatoes': '28 ounces',
        'heavy cream': '1/2 cup',
      },
      step: [
        'Heat olive oil in a large, high-sided sauté pan over medium heat until shimmering. Add the onion and sauté until softened and translucent, 3 to 4 minutes. Add the garlic and red pepper flakes, if using, and sauté until fragrant, 30 seconds to 1 minute. Carefully pour in the crushed tomatoes. Add the salt and pepper and stir to combine. Bring to a simmer and cook, uncovered, stirring occasionally, for 10 minutes. Reduce heat to low and stir in the cream. Taste and season with additional salt and pepper as needed.',
        'Meanwhile, bring a large pot of salted water to a boil. Add the pasta and cook al dente, about 10 minutes or according to package instructions.',
        'Drain the pasta and add it to the sauce. Toss gently to combine. Add the basil, toss once more, and serve immediately with grated cheese'
      ],
      urlImage:
          'https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fit,w_730,h_913/k%2Farchive%2F36314b0a36cbc6847e8958fa577bfc2ba02a6eb0'),
];
