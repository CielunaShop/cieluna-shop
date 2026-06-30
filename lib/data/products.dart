import '../models/product.dart';
import '../models/product_category.dart';

final List<Product> products = [
  Product(
    id: "fantasy_student_planner",

    title: "Fantasy Student Planner",

    tagline: "A magical planner for focused and organized study.",

    category: ProductCategory.planners,

    description:
        "Designed for students who love fantasy aesthetics while staying productive. This printable planner helps you organize classes, assignments, goals, habits and study sessions in one beautiful place.",

    images: [
      "assets/planners/fantasy/cover.png",

      "assets/planners/fantasy/preview1.png",

      "assets/planners/fantasy/preview2.png",

      "assets/planners/fantasy/preview3.png",
    ],

    highlights: [
      "Printable PDF",

      "Undated",

      "High Quality",

      "Lifetime Access",
    ],

    contents: [
      "Cover Page",

      "Daily Planner",

      "Weekly Planner",

      "Monthly Planner",

      "Assignment Tracker",

      "Habit Tracker",

      "Goals",

      "Notes",
    ],

    format: "PDF",

    pageSize: "A4",

    pageCount: 12,

    price: 199,

    purchaseUrl: "YOUR_GOOGLE_FORM",

    featured: true,
  ),
];
