//
//  RecipeModel.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 12/05/25.
//

import Foundation
import UIKit
import SwiftUI

enum Category: String, CaseIterable, Identifiable{
    var id: String { rawValue }
    
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue // Changed from Category.RawValue to Category
    let datePublished: String
    let url: String
    var isFavorite: Bool = false // Add favorite status
}

extension Recipe {
    static let all: [Recipe] = [
        Recipe(
            name: "Creamy Carrot Soup",
            image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98892/Creamy-Carrot-Soup-for-Wordpress-360x270-c.jpg",
            description: "This bold-hued soup is perfectly sweet and seriously comforting. Peeling the red bell pepper helps make this carrot soup extra silky.",
            ingredients: "½ cup cashews\n1 medium onion\n1½ pounds carrots\n1 red bell pepper\nherbs & spices",
            directions: "Soak cashews. Sauté vegetables. Blend. Combine all and heat. Garnish with pomegranate seeds.",
            category: "soup" ,
            datePublished: "2019-11-11",
            url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-soup/"
        ),
        Recipe(
            name: "Kale, Apple, and Quinoa Salad",
            image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98341/Kale-Apple-Quinoa-Salad-wordpress-360x270-c.jpg",
            description: "A fresh salad with fall flavors like apples, butternut squash, and pumpkin seeds.",
            ingredients: "2 cups butternut squash\n¼ cup pumpkin seeds\n1½ cups cooked quinoa\n1 cup apple\nkale, mustard, lemon, spices",
            directions: "Roast squash. Toast seeds. Mix dressing. Toss all together before serving.",
            category: "salad" ,
            datePublished: "2019-10-22",
            url: "https://www.forksoverknives.com/recipes/vegan-salads-sides/kale-apple-and-quinoa-salad/"
        ),
        Recipe(
              name: "Kale Bruschetta",
              image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/25202/Kale-Bruschetta-WP-360x270-c.jpg",
              description: """
              We adore this as an appetizer, and so does everyone else. It is always the first empty platter at our holiday party. No one knows it is plant-based; they just know it is so yummy.
              From The Prevent and Reverse Heart Disease Cookbook.
              This kale bruschetta recipe is also available in our convenient iPhone app and newly released Android app.
              """,
              ingredients: """
              1 bunch kale
              1 loaf fresh 100% whole-grain bread, sliced
              ½ cup Cannellini Bean Sauce
              1 cup grape tomatoes, halved
              balsamic glaze
              """,
              directions: """
              Place the kale leaves in a large pot of boiling water. Cover and cook until tender, about 5 minutes. Drain in a colander, then squeeze out any extra liquid with your hands (you don't want soggy bread).
              Toast 8 pieces of bread, and place them on a handsome serving platter.
              Spread a tablespoon of the Cannellini Bean Sauce on the toasted bread, then cover with a layer of kale and top with a scattering of grape tomatoes. Drizzle generously with the balsamic glaze, and grab one for yourself before they all disappear.
              """,
              category: "Appetizer",
              datePublished: "2015-06-28",
              url: "https://www.forksoverknives.com/recipes/vegan-snacks-appetizers/kale-bruschetta/"
          ),
          Recipe(
              name: "Vegetable Pot Pie",
              image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98816/Vegetable-pot-pie-for-wordpress-360x270-c.jpg",
              description: """
              This eye-popping pot pie makes a hearty addition to a holiday menu or an impressive entree any time of year. Note that this recipe calls for whole wheat pizza dough: Make some using our 10-minute recipe or look for oil-free options at the store (Trader Joe's makes a good one).
              """,
              ingredients: """
              3 cups sliced fresh cremini mushrooms
              1 cup sliced carrots
              ½ cup sliced celery
              3¾ cups low-sodium vegetable broth
              2 cups ½-inch pieces peeled butternut squash
              1½ cups frozen whole pearl onions
              1 teaspoon chopped fresh thyme
              1 bay leaf
              1 15-oz. can no–salt-added chickpeas, rinsed and drained
              1 cup frozen peas
              1 cup frozen corn
              3 tablespoons all-purpose flour
              Sea salt and freshly ground black pepper, to taste
              1 recipe Homemade Oil-Free Pizza Dough or 1 lb. refrigerated whole wheat pizza dough
              1 tablespoon unsweetened plant milk, such as almond, soy, cashew, or rice
              """,
              directions: """
              Preheat oven to 425°F. For filling, in a 4-qt. saucepan cook mushrooms, carrots, and celery over medium 3 to 4 minutes, stirring occasionally and adding water, 1 to 2 Tbsp. at a time, as needed to prevent sticking. Add 3 cups of the broth, the squash, onions, thyme, and bay leaf. Bring to boiling; reduce heat. Simmer, covered, 5 minutes or until vegetables are nearly tender. Stir in chickpeas, peas, and corn.
              Whisk together flour and the remaining ¾ cup broth; stir into vegetables. Cook until thick and bubbly, stirring occasionally. Remove from heat. Remove and discard bay leaf. Season filling with salt and pepper. Spread into a 2½- to 3-qt. round or oval baking dish.
              On a lightly floured surface, roll Homemade Oil-Free Pizza Dough into a circle or oval slightly larger than the dish. Cut several slits in dough; place on filling and seal. Brush with milk. Bake 15 minutes or until crust is browned and filling is bubbly.
              """,
              category: "Main",
              datePublished: "2019-11-05",
              url: "https://www.forksoverknives.com/recipes/vegan-baked-stuffed/vegetable-pot-pie/"
          ),
        Recipe(
               name: "Red Lentil Loaf with Smoky Tomato Sauce Recipe",
               image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/85949/Red-Lentil-Loaf-360x270-c.jpg",
               description: """
               Infinitely healthier than meat-based meatloaf and just as delicious, this savory vegan meatloaf recipe makes a welcome meal on a chilly night. Try it in next-day sandwiches, too. The smoky-sweet sauce, made with taco seasoning, smoked paprika, mustard, and Date Paste, comes together in just 10 minutes.
               """,
               ingredients: """
               2 medium onions, chopped (2 cups)
               1 cup red lentils, rinsed and drained
               2 fresh poblano chile peppers, seeded and chopped (1 cup)
               3 cloves garlic, minced
               1½ teaspoons chopped fresh Mexican oregano
               2 cups cooked short grain brown rice
               ½ cup cornmeal
               ½ cup finely chopped fresh cilantro
               2 tablespoons lime juice
               1 teaspoon sea salt
               1 14.5-oz. can fire-roasted tomatoes, undrained
               ¼ cup Date Paste
               1 tablespoon smoked paprika
               1 teaspoon taco seasoning
               ½ teaspoon yellow mustard
               """,
               directions: """
               Preheat oven to 375°F. Line a 9×5-inch loaf pan with parchment paper.
               In a skillet combine onions, lentils, poblanos, garlic, and oregano. Stir in 1¾ cups water. Bring to boiling; reduce heat. Simmer, covered, 20 minutes or until lentils are tender and water is absorbed, stirring occasionally. Stir in rice, cornmeal, cilantro, lime juice, and salt. Lightly pat mixture into the prepared loaf pan; flatten top.
               For sauce, in a blender combine tomatoes, date paste, paprika, taco seasoning, mustard, and ½ cup water. Cover and blend until smooth. Transfer to a saucepan. Bring to boiling; reduce heat. Simmer, uncovered, 10 minutes or until slightly thick.
               Spoon ½ cup of the sauce over loaf. Bake 30 to 40 minutes or until sauce looks dark and dry. Cool on a wire rack 15 minutes. Slice loaf and serve with the remaining sauce.
               """,
               category: "Main",
               datePublished: "2019-03-19",
               url: "https://www.forksoverknives.com/recipes/vegan-baked-stuffed/red-lentil-loaf-recipe-smoky-tomato-sauce/"
           ),
           Recipe(
               name: "Roasted Root Vegetable Medley",
               image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/158614/Roasted-Root-Vegetable-Medley-wordpress-360x270-c.jpg",
               description: """
               This simple side dish celebrates root vegetables in all their colorful, flavorful glory. The key to evenly roasting firmer veggies, such as carrots and potatoes, without adding fat is to steam them first before mixing them with the soft vegetables. Serve this vibrant recipe at your Thanksgiving feast, or enjoy it as a side with a warm bowl of soup.
               """,
               ingredients: """
               4 assorted-color carrots, peeled and cut into 3-inch pieces
               6 fingerling potatoes, halved if large
               2 small parsnips, peeled, halved crosswise, and quartered lengthwise
               1 turnip, peeled and cut into sixths
               1 rutabaga, peeled and cut into thick wedges
               1 medium beet, peeled and cut into 1-inch wedges
               3 tablespoons balsamic vinegar
               2 tablespoons lemon juice
               2 tablespoons pure maple syrup
               2 tablespoons arrowroot powder
               1 teaspoon dried rosemary
               10 cloves garlic, minced
               1 fennel bulb, fronds reserved for garnish and bulb cut into 1-inch-thick wedges
               1 small head celeriac, peeled and cut into large wedges
               1 large white or cremini mushrooms, quartered
               ½ teaspoon sea salt
               ½ teaspoon freshly ground black pepper
               """,
               directions: """
               Preheat oven to 375°F. Working in batches if necessary, place the first six ingredients (through beet) in a steamer basket in a large saucepan. Add water to saucepan to just below basket. Bring to boiling. Steam, covered, 5 to 7 minutes or until vegetables are just tender.
               In a large bowl whisk together the next six ingredients (through garlic). Add steamed vegetables, fennel, onions, celeriac, and mushrooms. Toss to coat.
               In a large rimmed baking sheet spread vegetables in a single layer. Roast 15 minutes. Remove from oven and carefully stir. Roast 10 to 15 minutes more or until vegetables are tender and lightly browned.
               Season with salt and pepper. Sprinkle with chopped reserved fennel fronds. Serve warm.
               """,
               category: "Side",
               datePublished: "2021-10-05",
               url: "https://www.forksoverknives.com/recipes/vegan-salads-sides/roasted-root-vegetable-medley/"
           ),
        Recipe(
                name: "Raspberry Truffle Brownies",
                image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/22720/Raspberry-Brownies-300kb-360x270-c.jpg",
                description: """
                These dense, fudgy, vegan brownies have loads of melt-in-your-mouth raspberry yumminess. Frozen berries actually work better here because the dough is very stiff, and frozen berries are easier to fold in.
                """,
                ingredients: """
                4 ounces unsweetened chocolate, chopped
                ½ cup raspberry jam
                ½ cup evaporated cane juice or cane sugar
                ½ cup unsweetened applesauce
                2 teaspoons pure vanilla extract
                ½ teaspoon almond extract
                1½ cups whole wheat pastry flour
                ½ cup unsweetened cocoa powder
                ½ teaspoon baking powder
                ½ teaspoon baking soda
                ½ teaspoon salt
                1 cup raspberries, frozen or fresh
                """,
                directions: """
                Preheat the oven to 350ºF. Line an 8 × 8-inch pan with a 10-inch square of parchment paper or have ready an 8 × 8-inch nonstick or silicone baking pan.
                Melt the chocolate in either a double boiler or the microwave. Set aside.
                In a large mixing bowl, vigorously mix together the jam, sweetener, and applesauce. Stir in the vanilla, almond extract, and the melted chocolate.
                Sift in the flour, cocoa powder, baking powder, baking soda, and salt. Mix very well until a stiff dough forms. Fold in the raspberries.
                Spread the mixture into the prepared pan. It will be very thick; you'll need to use your hands to even the batter out in the pan.
                Bake the brownies for 16 to 18 minutes. Remove them from the oven and let cool completely.
                These taste especially good and fudgy after being refrigerated for a few hours.

                Note: The brownies are still very gooey after the baking time is complete, but don't worry—that's what you want with brownies!
                Gooey out of the oven means that they will be nice and fudgy when they cool. Allow them to cool completely and chill in the fridge for a few hours for best results.
                """,
                category: "Dessert",
                datePublished: "2014-02-10",
                url: "https://www.forksoverknives.com/recipes/vegan-desserts/raspberry-truffle-brownies/"
            )
    ]
}
