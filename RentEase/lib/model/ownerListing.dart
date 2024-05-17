class House_l {
  final int id;
  final String title, description,location, type, built_type,owner,address;
  final List<String> images;
  final List amenities,rules;
  final double rating, rent, bedroom,bathroom, area,built_year;
  final bool isPopular;


  House_l({
    required this.id,
    required this.images,
    this.rating = 0.0,
    required this.address,
    required this.title,
    required this.type,
    required this.owner,
    required this.built_type,
    required this.built_year,
    required this.rent,
    required this.location,
    required this.description,
    required this.bedroom,
    required this.bathroom,
    required this.area,
    required this.amenities,
    required this.rules,
    this.isPopular = false,
  });
}

List<House_l> demoProducts_l = [
  House_l(
      id: 5,
      images: [
        "assets/images/ad5.png",
        "assets/images/ad5_1.png",
        "assets/images/ad5_2.png",
        "assets/images/ad5_3.png",
      ],
      isPopular: true,
      location: 'Hyderabad',
      title: "The Tuscan",
      type: 'For Rent',
      address: 'Banjara Hills, 123, Hyderabad, Telangana 500034, India',
      built_type: 'Villa',
      built_year: 2022,
      rent: 120000,
      owner: 'House Owner',
      description: "This enchanting property features a charming villa with 5 bedrooms, 6 bathrooms, and over 5,000 square feet of living space. The home is also equipped with a gourmet kitchen, wood-burning fireplace, and private terrace with stunning views of the surrounding countryside. Outside, you'll find a swimming pool, Jacuzzi, and olive grove.",
      rating: 3.5,
      bathroom: 6,
      bedroom: 5,
      amenities: [],
      rules: [],
      area: 5000
  ),
  House_l(
      id: 4,
      images: [
        "assets/images/ap3.png",
        "assets/images/ap3_1.png",
        "assets/images/ap3_2.png",
        "assets/images/ap3_3.png",
      ],
      location: 'Delhi',
      title: "The Paradise Apartment",
      type: 'For Lease',
      address: 'The Paradise Apartment, 123-456, Main Street, Delhi, Maharashtra 400026, India',
      built_type: 'Apartment',
      built_year: 2012,
      rent: 30000,
      owner: 'House Owner',
      description: "The Paradise Apartment is a luxurious one-bedroom apartment located in the heart of the city. The apartment features a spacious living room with a fireplace, a fully equipped kitchen, and a private balcony with stunning views of the cityscape. The bedroom is spacious and features a king-size bed, a walk-in closet, and a private bathroom with a soaking tub and a separate shower.",
      rating: 4.8,
      bathroom: 1,
      bedroom: 1,
      amenities: [],
      rules: [],
      area: 3000
  ),
  House_l(
      id: 4,
      images: [
        "assets/images/fh3.png",
        "assets/images/fh3_1.png",
        "assets/images/fh3_2.png",
      ],
      location: 'Delhi',
      title: "The Peaceful Haven",
      type: 'For Rent',
      address: 'The Peaceful Haven, 123, Peaceful Lane, New Delhi, Delhi 110001, India',
      built_type: 'Farmhouse',
      built_year: 2017,
      rent: 1500,
      owner: 'House Owner',
      description: "The Peaceful Haven is the perfect place to relax and unwind. The farmhouse is spacious and features a cozy fireplace, a fully equipped kitchen, and a private porch with stunning views of the surrounding landscape. The farmhouse also has three bedrooms and two bathrooms, making it perfect for families or groups of friends.",
      rating: 4.1,
      bathroom: 2,
      bedroom: 3,
      amenities: [],
      rules: [],
      area: 1500
  ),
];

const String description =
    "Have fun renting …";