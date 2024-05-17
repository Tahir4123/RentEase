import 'package:flutter/cupertino.dart';

class House {
  final int id;
  final String name, description,city, type, built_type,owner,address,state,guest_limit;
  final List<String> images;
  final String security, rent, bedroom,bathroom, area,built_year;


  House({
    required this.state,required this.guest_limit,required this.security,
    required this.id,
    required this.images,
    required this.address,
    required this.name,
    required this.type,
    required this.owner,
    required this.built_type,
    required this.built_year,
    required this.rent,
    required this.city,
    required this.description,
    required this.bedroom,
    required this.bathroom,
    required this.area,
    
  });
}

// Our demo Products

List<House> demoProducts = [
  /////ad
  House(
    id: 1,
    images: [
      "assets/images/ad1.png",
      "assets/images/ad1_1.png",
      "assets/images/ad1_2.png",
      "assets/images/ad1_3.png",
    ],
    address: 'Altamount Road, 123, Mumbai, Maharashtra 400026, India',
    city: 'Mumbai',
    name: "The Grand Estate",
    type: 'Rent',
    built_type: 'Villa',
    built_year: '2022',
    rent: '200000',
    description: "Experience the grandeur of The Grand Estate, a luxurious estate that offers the best of Mumbai. With its elegant architecture, manicured lawns, and sparkling pool, The Grand Estate is the perfect place to host your next event, whether it's a wedding, corporate retreat, or family reunion.",
    bathroom: '4',
    bedroom: '6',
    area: '15000',
    owner: 'Default OWner', state: 'Maharashtra', guest_limit: '10', security: '500',
  ),
  House(
      id: 2,
      images: [
        "assets/images/ad2.png",
        "assets/images/ad2_1.png",
        "assets/images/ad2_2.png",
        "assets/images/ad2_3.png"
      ],
      city: 'Delhi',
      name: "The Chateau",
      type: 'Lease',
      address: 'Golf Links, 123, Delhi, Delhi 110003, India',
      built_type: 'Villa',
      built_year: '2022',
      rent: '500000',
      description: "The Chateau is located in a beautiful setting and offers guests a variety of amenities and activities. It is the perfect place to escape the everyday world and enjoy a truly unforgettable experience.",
      bathroom: '4',
      bedroom: '6',
      owner: 'Default OWner',
      area: '24500',
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  House(
      id: 3,
      images: [
        "assets/images/ad3.png",
        "assets/images/ad3_1.png",
        "assets/images/ad3_2.png",
        "assets/images/ad3_3.png",
      ],
      
      city: 'Bangluru',
      type: 'Lease',
      built_type: 'Villa',
      built_year: '2010',
      name: "The Palazzo",
      address: 'Ulsoor, 123, Bengaluru, Karnataka 560008, India',
      rent: '300000',
      owner: 'Default OWner',
      description: "The Palazzo is a dream come true for those who seek the ultimate in luxury and sophistication. With its stunning architecture, world-class amenities, and convenient city, The Palazzo is the perfect place to experience the best that Bengluru has to offer.",
     
      bathroom: '4',
      bedroom: '6',
      
     
      area: '1500',
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  House(
      id: 4,
      images: [
        "assets/images/ad4.png",
        "assets/images/ad4_1.png",
        "assets/images/ad4_2.png",
        "assets/images/ad4_3.png",

      ],
      city: 'Chennai',
      name: "The Brownstone",
      type: 'For Sale',
      address: 'Poes Garden, 123, Chennai, Tamil Nadu 600086, India',
      built_type: 'Villa',
      built_year: '2012',
      rent: '250000',
      owner: 'Default OWner',
      description: "This charming brownstone is located in a quiet residential area but is still close to all the action. The home features 6 bedrooms, 4 bathrooms, and a cozy fireplace. The backyard is perfect for gardening or simply relaxing.",
      bathroom: '4',
      bedroom: '6',
      
     
      area: '1500',
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  House(
      id: 5,
      images: [
        "assets/images/ad5.png",
        "assets/images/ad5_1.png",
        "assets/images/ad5_2.png",
        "assets/images/ad5_3.png",
      ],
      
      city: 'Hyderabad',
      name: "The Tuscan",
      type: 'Rent',
      address: 'Banjara Hills, 123, Hyderabad, Telangana 500034, India',
      built_type: 'Villa',
      built_year: '2022',
      rent: '120000',
      owner: 'Default OWner',
      description: "This enchanting property features a charming villa with 5 bedrooms, 6 bathrooms, and over 5,000 square feet of living space. The home is also equipped with a gourmet kitchen, wood-burning fireplace, and private terrace with stunning views of the surrounding countryside. Outside, you'll find a swimming pool, Jacuzzi, and olive grove.",
      
      bathroom: '6',
      bedroom: '5',
      
     
      area: '5000',
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  //////ad


//////ap
  House(
      id: 6,
      images: [
        "assets/images/ap1.png",
        "assets/images/ap1_1.png",
        "assets/images/ap1_2.png",
      ],
      city: 'Chennai',
      name: "The Oasis Apartment",
      type: 'Rent',
      address: '123 Oasis Street, Chennai, Tamil Nadu 600086, India',
      built_type: 'Apartment',
      built_year: '2009',
      rent: '2000',
      owner: 'Default OWner',
      description: "The Oasis Apartment is your own personal oasis in the heart of the city. This luxurious two-bedroom apartment features stunning views of the city skyline, a private balcony, and all the amenities you could need.",
      
      bathroom: '3',
      bedroom: '2',
      
     
      area: '1500',
      
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  House(
      id: 4,
      images: [
        "assets/images/ap2.png",
        "assets/images/ap2_1.png",
        "assets/images/ap2_2.png",
        "assets/images/ap2_3.png",
      ],
      city: 'Mumbai',
      name: "The Hidden Treasure",
      type: 'Rent',
      address: 'The Hidden Treasure, 4567 Gandhi Road, Mumbai, 400026, India',
      built_type: 'Apartment',
      built_year: '2020',
      rent: '3000',
      owner: 'Default OWner',
      description: "The apartment features a spacious living room with a cozy fireplace. The kitchen is fully equipped with all the appliances you need to cook your favorite meals. The bedroom is large enough for a king-size bed and has a private bathroom.",
      
      bathroom: '2',
      bedroom: '2',
      
     
      area: '2500',
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  House(
      id: 4,
      images: [
        "assets/images/ap3.png",
        "assets/images/ap3_1.png",
        "assets/images/ap3_2.png",
        "assets/images/ap3_3.png",
      ],
      city: 'Delhi',
      name: "The Paradise Apartment",
      type: 'Lease',
      address: 'The Paradise Apartment, 123-456, Main Street, Delhi, Maharashtra 400026, India',
      built_type: 'Apartment',
      built_year: '2012',
      rent: '30000',
      owner: 'Default OWner',
      description: "The Paradise Apartment is a luxurious one-bedroom apartment located in the heart of the city. The apartment features a spacious living room with a fireplace, a fully equipped kitchen, and a private balcony with stunning views of the cityscape. The bedroom is spacious and features a king-size bed, a walk-in closet, and a private bathroom with a soaking tub and a separate shower.",
      bathroom: '1',
      bedroom: '1',
      
     
      area: '3000',
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  //////ap

////fh
  House(
      id: 4,
      images: [
        "assets/images/fh1.png",
        "assets/images/fh1_1.png",
        "assets/images/fh1_2.png",
        "assets/images/fh1_3.png",
      ],
      city: 'Bengluru',
      name: "The Country Retreat",
      type: 'Rent',
      address: 'The Country Retreat, 123, Bengaluru, Karnataka, India, 560001',
      built_type: 'Farmhouse',
      built_year: '2023',
      rent: '1500',
      owner: 'Default OWner',
      description: "The Country Retreat is a beautiful farmhouse located in the heart of the countryside. The farmhouse features four bedrooms, three bathrooms, and a spacious living room with a fireplace. The kitchen is fully equipped and has a large dining table that is perfect for family gatherings. The farmhouse also has a private patio with a barbecue and stunning views of the surrounding countryside.",
      bathroom: '3',
      bedroom: '4',
      
     
      area: '3000',
      
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  House(
      id: 4,
      images: [
        "assets/images/fh2.png",
        "assets/images/fh2_1.png",
        "assets/images/fh2_2.png",
        "assets/images/fh2_3.png",
      ],
      city: 'Hyderabad',
      name: "The Rural Retreat",
      type: 'Lease',
      address: 'The Rural Retreat, 200, Road Number 12, Jubilee Hills, Hyderabad, Telangana 500033India',
      built_type: 'Farmhouse',
      built_year: '2019',
      rent: '25000',
      owner: 'Default OWner',
      description: "The Rural Retreat is the perfect place to relax and unwind from the stresses of everyday life. The farmhouse is spacious and features a cozy living room with a fireplace, a fully equipped kitchen, and a private deck with stunning views of the countryside. The farmhouse also has three bedrooms and two bathrooms, making it the perfect place for a family or group of friends to stay.",
      bathroom: '5',
      bedroom: '4',
      
      area: '3500',
      

  state: 'Maharashtra',guest_limit: '10',security: '500',),
  House(
      id: 4,
      images: [
        "assets/images/fh3.png",
        "assets/images/fh3_1.png",
        "assets/images/fh3_2.png",
      ],
      city: 'Delhi',
      name: "The Peaceful Haven",
      type: 'Rent',
      address: 'The Peaceful Haven, 123, Peaceful Lane, New Delhi, Delhi 110001, India',
      built_type: 'Farmhouse',
      built_year: '2017',
      rent: '1500',
      owner: 'Default OWner',
      description: "The Peaceful Haven is the perfect place to relax and unwind. The farmhouse is spacious and features a cozy fireplace, a fully equipped kitchen, and a private porch with stunning views of the surrounding landscape. The farmhouse also has three bedrooms and two bathrooms, making it perfect for families or groups of friends.",
      bathroom: '2',
      bedroom: '3',
      
     
      area: '1500',
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  House(
      id: 4,
      images: [
        "assets/images/fh4.png",
        "assets/images/fh4_1.png",
        "assets/images/fh4_2.png",
      ],
      city: 'Mumbai',
      name: "The Tranquil Escape",
      type: 'Lease',
      address: '456, Tranquil Escape Lane, Lonavala, Mumbai, Maharashtra 410401, India',
      built_type: 'Farmhouse',
      built_year: '2010',
      rent: '30000',
      owner: 'Default OWner',
      description: "The farmhouse itself is beautifully decorated and features all the amenities you need for a comfortable and relaxing stay. The living room is spacious and inviting, with a fireplace and plenty of seating. The kitchen is fully equipped with everything you need to prepare delicious meals. The bedrooms are all spacious and comfortable, with king-size beds and private bathrooms.",
      bathroom: '4',
      bedroom: '5',
      area: '3500',
  state: 'Maharashtra',guest_limit: '10',security: '500',),
  ////fh
];

const String description =
    "Have fun renting …";
