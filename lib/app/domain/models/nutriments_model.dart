import 'dart:convert';

class Nutriments {
  Nutriments({
    this.carbohydrates,
    this.carbohydrates100G,
    this.carbohydratesUnit,
    this.carbohydratesValue,
    this.energy,
    this.energyKcal,
    this.energyKcal100G,
    this.energyKcalUnit,
    this.energyKcalValue,
    this.energy100G,
    this.energyUnit,
    this.energyValue,
    this.fat,
    this.fat100G,
    this.fatUnit,
    this.fatValue,
    this.proteins,
    this.proteins100G,
    this.proteinsUnit,
    this.proteinsValue,
    this.salt,
    this.salt100G,
    this.saltUnit,
    this.saltValue,
    this.saturatedFat,
    this.saturatedFat100G,
    this.saturatedFatUnit,
    this.saturatedFatValue,
    this.sodium,
    this.sodium100G,
    this.sodiumUnit,
    this.sodiumValue,
    this.sugars,
    this.sugars100G,
    this.sugarsUnit,
    this.sugarsValue,
    this.carbohydratesServing,
    this.energyKcalServing,
    this.energyServing,
    this.fatServing,
    this.proteinsServing,
    this.saltServing,
    this.saturatedFatServing,
    this.sodiumServing,
    this.sugarsServing,
    this.calcium,
    this.calcium100G,
    this.calciumServing,
    this.calciumUnit,
    this.calciumValue,
    this.fiber,
    this.fiber100G,
    this.fiberServing,
    this.fiberUnit,
    this.fiberValue,
    this.fruitsVegetablesNutsEstimateFromIngredients100G,
    this.fruitsVegetablesNutsEstimateFromIngredientsServing,
    this.iron,
    this.iron100G,
    this.ironServing,
    this.ironUnit,
    this.ironValue,
    this.novaGroup,
    this.novaGroup100G,
    this.novaGroupServing,
    this.nutritionScoreFr,
    this.nutritionScoreFr100G,
  });

  double? carbohydrates;
  double? carbohydrates100G;
  String? carbohydratesUnit;
  double? carbohydratesValue;
  double? energy;
  double? energyKcal;
  double? energyKcal100G;
  String? energyKcalUnit;
  double? energyKcalValue;
  double? energy100G;
  String? energyUnit;
  double? energyValue;
  double? fat;
  double? fat100G;
  String? fatUnit;
  double? fatValue;
  double? proteins;
  double? proteins100G;
  String? proteinsUnit;
  double? proteinsValue;
  double? salt;
  double? salt100G;
  String? saltUnit;
  double? saltValue;
  double? saturatedFat;
  double? saturatedFat100G;
  String? saturatedFatUnit;
  double? saturatedFatValue;
  double? sodium;
  double? sodium100G;
  String? sodiumUnit;
  double? sodiumValue;
  double? sugars;
  double? sugars100G;
  String? sugarsUnit;
  double? sugarsValue;
  double? carbohydratesServing;
  double? energyKcalServing;
  double? energyServing;
  double? fatServing;
  double? proteinsServing;
  double? saltServing;
  double? saturatedFatServing;
  double? sodiumServing;
  double? sugarsServing;
  double? calcium;
  double? calcium100G;
  double? calciumServing;
  String? calciumUnit;
  double? calciumValue;
  double? fiber;
  double? fiber100G;
  double? fiberServing;
  String? fiberUnit;
  double? fiberValue;
  String? fruitsVegetablesNutsEstimateFromIngredients100G;
  String? fruitsVegetablesNutsEstimateFromIngredientsServing;
  double? iron;
  double? iron100G;
  double? ironServing;
  String? ironUnit;
  double? ironValue;
  String? novaGroup;
  String? novaGroup100G;
  String? novaGroupServing;
  String? nutritionScoreFr;
  double? nutritionScoreFr100G;

  factory Nutriments.fromJson(String str) =>
      Nutriments.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nutriments.fromMap(Map<String, dynamic> json) => Nutriments(
        carbohydrates: json["carbohydrates"] == null
            ? 0.0
            : double.parse(json["carbohydrates"].toString()),
        carbohydrates100G: json["carbohydrates_100g"] == null
            ? 0.0
            : double.parse(json["carbohydrates_100g"].toString()),
        carbohydratesUnit: json["carbohydrates_unit"] == null
            ? null
            : json["carbohydrates_unit"],
        carbohydratesValue: json["carbohydrates_value"] == null
            ? 0.0
            : double.parse(json["carbohydrates_value"].toString()),
        energy: json["energy"] == null
            ? 0.0
            : double.parse(json["energy"].toString()),
        energyKcal: json["energy-kcal"] == null
            ? 0.0
            : double.parse(json["energy-kcal"].toString()),
        energyKcal100G: json["energy-kcal_100g"] == null
            ? 0.0
            : double.parse(json["energy-kcal_100g"].toString()),
        energyKcalUnit:
            json["energy-kcal_unit"] == null ? '' : json["energy-kcal_unit"],
        energyKcalValue: json["energy-kcal_value"] == null
            ? 0.0
            : double.parse(json["energy-kcal_value"].toString()),
        energy100G: json["energy_100g"] == null
            ? 0.0
            : double.parse(json["energy_100g"].toString()),
        energyUnit: json["energy_unit"] == null ? '' : json["energy_unit"],
        energyValue: json["energy_value"] == null
            ? 0.0
            : double.parse(json["energy_value"].toString()),
        fat: json["fat"] == null ? 0.0 : double.parse(json["fat"].toString()),
        fat100G: json["fat_100g"] == null
            ? 0.0
            : double.parse(json["fat_100g"].toString()),
        fatUnit: json["fat_unit"] == null ? null : json["fat_unit"],
        fatValue: json["fat_value"] == null
            ? null
            : double.parse(json["fat_value"].toString()),
        proteins: json["proteins"] == null
            ? 0.0
            : double.parse(json["proteins"].toString()),
        proteins100G: json["proteins_100g"] == null
            ? 0.0
            : double.parse(json["proteins_100g"].toString()),
        proteinsUnit:
            json["proteins_unit"] == null ? null : json["proteins_unit"],
        proteinsValue: json["proteins_value"] == null
            ? 0.0
            : double.parse(json["proteins_value"].toString()),
        salt:
            json["salt"] == null ? 0.0 : double.parse(json["salt"].toString()),
        salt100G: json["salt_100g"] == null
            ? 0.0
            : double.parse(json["salt_100g"].toString()),
        saltUnit: json["salt_unit"] == null ? '' : json["salt_unit"],
        saltValue: json["salt_value"] == null
            ? 0.0
            : double.parse(json["salt_value"].toString()),
        saturatedFat: json["saturated-fat"] == null
            ? 0.0
            : double.parse(json["saturated-fat"].toString()),
        saturatedFat100G: json["saturated-fat_100g"] == null
            ? 0.0
            : double.parse(json["saturated-fat_100g"].toString()),
        saturatedFatUnit: json["saturated-fat_unit"] == null
            ? ''
            : json["saturated-fat_unit"],
        saturatedFatValue: json["saturated-fat_value"] == null
            ? 0.0
            : double.parse(json["saturated-fat_value"].toString()),
        sodium: json["sodium"] == null
            ? 0.0
            : double.parse(json["sodium"].toString()),
        sodium100G: json["sodium_100g"] == null
            ? 0.0
            : double.parse(json["sodium_100g"].toString()),
        sodiumUnit: json["sodium_unit"] == null ? null : json["sodium_unit"],
        sodiumValue: json["sodium_value"] == null
            ? 0.0
            : double.parse(json["sodium_value"].toString()),
        sugars: json["sugars"] == null
            ? 0.0
            : double.parse(json["sugars"].toString()),
        sugars100G: json["sugars_100g"] == null
            ? 0.0
            : double.parse(json["sugars_100g"].toString()),
        sugarsUnit: json["sugars_unit"] == null ? '' : json["sugars_unit"],
        sugarsValue: json["sugars_value"] == null
            ? 0.0
            : double.parse(json["sugars_value"].toString()),
        carbohydratesServing: json["carbohydrates_serving"] == null
            ? 0.0
            : double.parse(json["carbohydrates_serving"].toString()),
        energyKcalServing: json["energy-kcal_serving"] == null
            ? 0.0
            : double.parse(json["energy-kcal_serving"].toString()),
        energyServing: json["energy_serving"] == null
            ? 0.0
            : double.parse(json["energy_serving"].toString()),
        fatServing: json["fat_serving"] == null
            ? 0.0
            : double.parse(json["fat_serving"].toString()),
        proteinsServing: json["proteins_serving"] == null
            ? 0.0
            : double.parse(json["proteins_serving"].toString()),
        saltServing: json["salt_serving"] == null
            ? 0.0
            : double.parse(json["salt_serving"].toString()),
        saturatedFatServing: json["saturated-fat_serving"] == null
            ? 0.0
            : double.parse(json["saturated-fat_serving"].toString()),
        sodiumServing: json["sodium_serving"] == null
            ? 0.0
            : double.parse(json["sodium_serving"].toString()),
        sugarsServing: json["sugars_serving"] == null
            ? 0.0
            : double.parse(json["sugars_serving"].toString()),
        calcium: json["calcium"] == null
            ? 0.0
            : double.parse(json["calcium"].toString()),
        calcium100G: json["calcium_100g"] == null
            ? 0.0
            : double.parse(json["calcium_100g"].toString()),
        calciumServing: json["calcium_serving"] == null
            ? 0.0
            : double.parse(json["calcium_serving"].toString()),
        calciumUnit: json["calcium_unit"] == null ? null : json["calcium_unit"],
        calciumValue: json["calcium_value"] == null
            ? 0.0
            : double.parse(json["calcium_value"].toString()),
        fiber: json["fiber"] == null
            ? 0.0
            : double.parse(json["fiber"].toString()),
        fiber100G: json["fiber_100g"] == null
            ? 0.0
            : double.parse(json["fiber_100g"].toString()),
        fiberServing: json["fiber_serving"] == null
            ? 0.0
            : double.parse(json["fiber_serving"].toString()),
        fiberUnit: json["fiber_unit"] == null ? '' : json["fiber_unit"],
        fiberValue: json["fiber_value"] == null
            ? 0.0
            : double.parse(json["fiber_value"].toString()),
        fruitsVegetablesNutsEstimateFromIngredients100G:
            json["fruits-vegetables-nuts-estimate-from-ingredients_100g"] ==
                    null
                ? '0.0'
                : json["fruits-vegetables-nuts-estimate-from-ingredients_100g"],
        fruitsVegetablesNutsEstimateFromIngredientsServing:
            json["fruits-vegetables-nuts-estimate-from-ingredients_serving"] ==
                    null
                ? '0.0'
                : json[
                    "fruits-vegetables-nuts-estimate-from-ingredients_serving"],
        iron:
            json["iron"] == null ? 0.0 : double.parse(json["iron"].toString()),
        iron100G: json["iron_100g"] == null
            ? 0.0
            : double.parse(json["iron_100g"].toString()),
        ironServing: json["iron_serving"] == null
            ? 0.0
            : double.parse(json["iron_serving"].toString()),
        ironUnit: json["iron_unit"] == null ? '' : json["iron_unit"],
        ironValue: json["iron_value"] == null
            ? 0.0
            : double.parse(json["iron_value"].toString()),
        novaGroup: json["nova-group"] == null ? null : json["nova-group"],
        novaGroup100G:
            json["nova-group_100g"] == null ? '0.0' : json["nova-group_100g"],
        novaGroupServing: json["nova-group_serving"] == null
            ? null
            : json["nova-group_serving"],
        nutritionScoreFr: json["nutrition-score-fr"] == null
            ? null
            : json["nutrition-score-fr"],
        nutritionScoreFr100G: json["nutrition-score-fr_100g"] == null
            ? 0.0
            : double.parse(json["nutrition-score-fr_100g"].toString()),
      );

  Map<String, dynamic> toMap() => {
        "carbohydrates": carbohydrates == null ? null : carbohydrates,
        "carbohydrates_100g":
            carbohydrates100G == null ? null : carbohydrates100G,
        "carbohydrates_unit":
            carbohydratesUnit == null ? null : carbohydratesUnit,
        "carbohydrates_value":
            carbohydratesValue == null ? null : carbohydratesValue,
        "energy": energy == null ? null : energy,
        "energy-kcal": energyKcal == null ? null : energyKcal,
        "energy-kcal_100g": energyKcal100G == null ? null : energyKcal100G,
        "energy-kcal_unit": energyKcalUnit == null ? null : energyKcalUnit,
        "energy-kcal_value": energyKcalValue == null ? null : energyKcalValue,
        "energy_100g": energy100G == null ? null : energy100G,
        "energy_unit": energyUnit == null ? null : energyUnit,
        "energy_value": energyValue == null ? null : energyValue,
        "fat": fat == null ? null : fat,
        "fat_100g": fat100G == null ? null : fat100G,
        "fat_unit": fatUnit == null ? null : fatUnit,
        "fat_value": fatValue == null ? null : fatValue,
        "proteins": proteins == null ? null : proteins,
        "proteins_100g": proteins100G == null ? null : proteins100G,
        "proteins_unit": proteinsUnit == null ? null : proteinsUnit,
        "proteins_value": proteinsValue == null ? null : proteinsValue,
        "salt": salt == null ? null : salt,
        "salt_100g": salt100G == null ? null : salt100G,
        "salt_unit": saltUnit == null ? null : saltUnit,
        "salt_value": saltValue == null ? null : saltValue,
        "saturated-fat": saturatedFat == null ? null : saturatedFat,
        "saturated-fat_100g":
            saturatedFat100G == null ? null : saturatedFat100G,
        "saturated-fat_unit":
            saturatedFatUnit == null ? null : saturatedFatUnit,
        "saturated-fat_value":
            saturatedFatValue == null ? null : saturatedFatValue,
        "sodium": sodium == null ? null : sodium,
        "sodium_100g": sodium100G == null ? null : sodium100G,
        "sodium_unit": sodiumUnit == null ? null : sodiumUnit,
        "sodium_value": sodiumValue == null ? null : sodiumValue,
        "sugars": sugars == null ? null : sugars,
        "sugars_100g": sugars100G == null ? null : sugars100G,
        "sugars_unit": sugarsUnit == null ? null : sugarsUnit,
        "sugars_value": sugarsValue == null ? null : sugarsValue,
        "carbohydrates_serving":
            carbohydratesServing == null ? null : carbohydratesServing,
        "energy-kcal_serving":
            energyKcalServing == null ? null : energyKcalServing,
        "energy_serving": energyServing == null ? null : energyServing,
        "fat_serving": fatServing == null ? null : fatServing,
        "proteins_serving": proteinsServing == null ? null : proteinsServing,
        "salt_serving": saltServing == null ? null : saltServing,
        "saturated-fat_serving":
            saturatedFatServing == null ? null : saturatedFatServing,
        "sodium_serving": sodiumServing == null ? null : sodiumServing,
        "sugars_serving": sugarsServing == null ? null : sugarsServing,
        "calcium": calcium == null ? null : calcium,
        "calcium_100g": calcium100G == null ? null : calcium100G,
        "calcium_serving": calciumServing == null ? null : calciumServing,
        "calcium_unit": calciumUnit == null ? null : calciumUnit,
        "calcium_value": calciumValue == null ? null : calciumValue,
        "fiber": fiber == null ? null : fiber,
        "fiber_100g": fiber100G == null ? null : fiber100G,
        "fiber_serving": fiberServing == null ? null : fiberServing,
        "fiber_unit": fiberUnit == null ? null : fiberUnit,
        "fiber_value": fiberValue == null ? null : fiberValue,
        "fruits-vegetables-nuts-estimate-from-ingredients_100g":
            fruitsVegetablesNutsEstimateFromIngredients100G == null
                ? null
                : fruitsVegetablesNutsEstimateFromIngredients100G,
        "fruits-vegetables-nuts-estimate-from-ingredients_serving":
            fruitsVegetablesNutsEstimateFromIngredientsServing == null
                ? null
                : fruitsVegetablesNutsEstimateFromIngredientsServing,
        "iron": iron == null ? null : iron,
        "iron_100g": iron100G == null ? null : iron100G,
        "iron_serving": ironServing == null ? null : ironServing,
        "iron_unit": ironUnit == null ? null : ironUnit,
        "iron_value": ironValue == null ? null : ironValue,
        "nova-group": novaGroup == null ? null : novaGroup,
        "nova-group_100g": novaGroup100G == null ? null : novaGroup100G,
        "nova-group_serving":
            novaGroupServing == null ? null : novaGroupServing,
        "nutrition-score-fr":
            nutritionScoreFr == null ? null : nutritionScoreFr,
        "nutrition-score-fr_100g":
            nutritionScoreFr100G == null ? null : nutritionScoreFr100G,
      };
}
