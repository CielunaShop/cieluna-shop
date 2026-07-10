import '../models/product.dart';
import '../models/product_category.dart';

final List<Product> products = [
  Product(
    id: "celestial_study_planner",

    title: "Celestial Study Planner",

    tagline: "Plan your academic life among the stars.",

    category: ProductCategory.planners,

    description:
        "A celestial-themed printable study planner designed to keep your academic life beautifully organized. Plan your month, structure your week, manage classes and assignments, and keep notes in one dreamy collection inspired by moonlit skies and the stars. Your purchase includes both a ready-to-print PDF and a ZIP folder containing all planner pages as high-quality PNG files.",

    images: [
      "assets/planners/celestial/cover.png",
      "assets/planners/celestial/preview1.png",
      "assets/planners/celestial/preview2.png",
      "assets/planners/celestial/preview3.png",
    ],

    highlights: [
      "PDF + High-Quality PNGs",
      "6 Printable Pages",
      "A4 Landscape",
      "Print Again Anytime",
    ],

    contents: [
      "Celestial Cover Page",
      "Monthly Overview",
      "Weekly Overview",
      "Class Schedule",
      "Assignment Tracker",
      "Lined Notes Page",
      "Ready-to-Print PDF File",
      "ZIP Folder with 6 High-Quality PNGs",
    ],

    format: "PDF + PNG (ZIP)",

    pageSize: "A4 Landscape",

    pageCount: 6,

    price: 199,

    purchaseUrl: "YOUR_GOOGLE_FORM",

    featured: true,
  ),

  Product(
    id: "pastel_notes_bundle",

    title: "Pastel Notes Bundle",

    tagline:
        "Cute printable note pages for studying, planning and everything in between.",

    category: ProductCategory.notes,

    description:
        "A soft pastel purple collection of 9 printable note pages designed "
        "to make studying, planning and everyday writing feel a little more "
        "beautiful. From lecture notes and focused study sessions to brain "
        "dumps, to-do lists and flexible writing layouts, this bundle gives "
        "you a page for every kind of thought. Print your favorites whenever "
        "you need them or use them digitally for school, university, journaling "
        "and everyday organization.",

    images: [
      "assets/notes/9pages/cover.png",
      "assets/notes/9pages/preview1.png",
      "assets/notes/9pages/preview2.png",
      "assets/notes/9pages/preview3.png",
      "assets/notes/9pages/preview4.png",
    ],

    highlights: [
      "9 Printable Pages",
      "A4 Portrait",
      "PDF + High-Quality PNGs",
      "Unlimited Printing",
    ],

    contents: [
      "To-Do List",
      "Notes Page",
      "Lecture Notes",
      "Study Session Notes",
      "Brain Dump",
      "Grid Notes",
      "Dashed Lined Notes",
      "Dotted Notes",
      "To-Do List with Don't Forget Section",
    ],

    format: "PDF + PNG (ZIP)",

    pageSize: "A4 Portrait",

    pageCount: 9,

    price: 99,

    purchaseUrl: "",

    featured: true,
  ),

  Product(
    id: "pastel_notes_bundle",

    title: "Pastel Notes Bundle",

    tagline: "9 dreamy purple pages for notes, ideas and study sessions.",

    category: ProductCategory.notes,

    description:
        "A dreamy collection of 9 pastel purple printable pages designed "
        "for studying, planning, note-taking and capturing every little idea. "
        "With soft lavender tones, delicate butterflies and clean functional "
        "layouts, this bundle makes everyday productivity feel a little more "
        "beautiful. Your purchase includes a printable PDF plus a ZIP folder "
        "containing all 9 pages as high-quality PNG files.",

    images: [
      "assets/notes/pastel/preview1.png",
      "assets/notes/pastel/preview2.png",
      "assets/notes/pastel/preview3.png",
      "assets/notes/pastel/preview4.png",
      "assets/notes/pastel/preview5.png",
    ],

    highlights: [
      "PDF + PNG Files",
      "9 Aesthetic Pages",
      "A4 Portrait",
      "Unlimited Personal Printing",
    ],

    contents: [
      "1 Printable PDF",
      "1 ZIP Folder with High-Quality PNG Pages",
      "To Do List",
      "Lecture Notes",
      "Notes Page",
      "Study Session Notes",
      "Grid Notes",
      "Brain Dump",
      "Dot Grid Notes",
      "Dashed Notes",
      "Detailed To-Do List",
    ],

    format: "PDF + ZIP (PNG)",

    pageSize: "A4 Portrait",

    pageCount: 9,

    price: 99,

    purchaseUrl: "YOUR_GOOGLE_FORM",

    featured: true,
  ),

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

    highlights: ["Printable PDF", "Undated", "High Quality", "Lifetime Access"],

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

  Product(
    id: "study_notes_bundle",

    title: "Study Smart Notes Bundle",

    tagline: "Cute printable note pages for aesthetic studying.",

    category: ProductCategory.notes,

    description:
        "A collection of adorable printable note pages designed to make studying more enjoyable. Perfect for lectures, revision, brain dumps, study sessions and daily to-do lists.",

    images: [
      "assets/notes/cover.png",
      "assets/notes/preview1.png",
      "assets/notes/preview2.png",
      "assets/notes/preview3.png",
    ],

    highlights: [
      "9 Printable Pages",
      "Instant Download",
      "Cute Design",
      "Unlimited Printing",
    ],

    contents: [
      "Lecture Notes",
      "Study Session Notes",
      "Brain Dump",
      "To-Do List",
      "Cornell Notes",
      "Grid Notes",
      "Lined Notes",
      "Blank Notes",
      "Revision Sheet",
    ],

    format: "PDF",

    pageSize: "A4",

    pageCount: 9,

    price: 99,

    purchaseUrl: "YOUR_GOOGLE_FORM",

    featured: true,
  ),

  Product(
    id: "gothic_todo_list",

    title: "Dark Gothic To-Do List",

    tagline: "Victorian-inspired printable for dark academia lovers.",

    category: ProductCategory.todos,

    description:
        "A printable gothic to-do list featuring vintage Victorian borders, subtle horror-inspired artwork and elegant parchment textures. Ideal for journaling, planning and dark aesthetic lovers.",

    images: [
      "assets/todos/cover.png",
      "assets/todos/preview1.png",
      "assets/todos/preview2.png",
      "assets/todos/preview3.png",
    ],

    highlights: [
      "Printable PDF",
      "A4 Size",
      "Vintage Gothic",
      "Reusable Forever",
    ],

    contents: [
      "1 Printable To-Do Page",
      "Checklist Section",
      "Notes From Darkness",
      "High Resolution Artwork",
    ],

    format: "PDF",

    pageSize: "A4",

    pageCount: 1,

    price: 49,

    purchaseUrl: "YOUR_GOOGLE_FORM",

    featured: true,
  ),

  Product(
    id: "pastel_notes_collection",

    title: "Pastel Notes Collection",

    tagline: "Soft purple printables for productive study sessions.",

    category: ProductCategory.notes,

    description:
        "Minimal pastel printable note pages with soft lavender accents and clean layouts. Great for school, university, journaling and everyday planning.",

    images: [
      "assets/notes/cover.png",
      "assets/notes/preview1.png",
      "assets/notes/preview2.png",
      "assets/notes/preview3.png",
    ],

    highlights: [
      "Printable PDF",
      "Pastel Theme",
      "Minimal Design",
      "Instant Download",
    ],

    contents: [
      "Lined Notes",
      "Cornell Notes",
      "Study Notes",
      "Lecture Notes",
      "Brain Dump",
      "Checklist",
    ],

    format: "PDF",

    pageSize: "A4",

    pageCount: 6,

    price: 79,

    purchaseUrl: "YOUR_GOOGLE_FORM",

    featured: true,
  ),

  Product(
    id: "gothic_todo_list",

    title: "Dark Gothic To-Do List",

    tagline: "Victorian-inspired printable for dark academia lovers.",

    category: ProductCategory.todos,

    description:
        "A printable gothic to-do list featuring vintage Victorian borders, subtle horror-inspired artwork and elegant parchment textures. Ideal for journaling, planning and dark aesthetic lovers.",

    images: [
      "assets/todos/cover.png",
      "assets/todos/preview1.png",
      "assets/todos/preview2.png",
      "assets/todos/preview3.png",
    ],

    highlights: [
      "Printable PDF",
      "A4 Size",
      "Vintage Gothic",
      "Reusable Forever",
    ],

    contents: [
      "1 Printable To-Do Page",
      "Checklist Section",
      "Notes From Darkness",
      "High Resolution Artwork",
    ],

    format: "PDF",

    pageSize: "A4",

    pageCount: 1,

    price: 49,

    purchaseUrl: "YOUR_GOOGLE_FORM",

    featured: true,
  ),

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

    highlights: ["Printable PDF", "Undated", "High Quality", "Lifetime Access"],

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
