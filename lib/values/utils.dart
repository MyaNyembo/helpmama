
import 'dart:core';
/**
 * ```dart
 * // Tester la fonction avec un exemple
 * void main() {
 *  // Définir la date des derniers règles et la durée du cycle
 *  DateTime dateRegles = DateTime(2023, 6, 26);
 *  int dureeCycle = 30;
 *  // Appeler la fonction et afficher le résultat
 *  DateTime dateAccouchement = calculateDueDate(dateRegles, dureeCycle);
 *  print("La date prévue d'accouchement est le ${dateAccouchement.day}"
 *  "/${dateAccouchement.month}/${dateAccouchement.year}.");
 * }
 * ```
*/

/// Pour calculer la date de l’accouchement d’une femme en fonction de la date
/// de ses derniers règles et la durée de son cycle, il faut utiliser la
/// formule de Naegele123. Cette formule consiste à ajouter 9 mois et 7 jours
/// à la date des dernières règles, puis à ajuster le résultat selon la durée
/// du cycle.

/// Définir une fonction qui prend en paramètres la date des derniers règles
/// et la durée du cycle
DateTime calculateDueDate(DateTime dateRegles, int dureeCycle) {
  /// Ajouter 9 mois et 7 jours à la date des derniers règles
  ///DateTime dateAccouchement = dateRegles.add(Duration(days: 7, months: 9));
  DateTime dateAccouchement = dateRegles.add(const Duration(days: (9*30)+7,));
  /// Ajuster le résultat selon la durée du cycle
  /// Si le cycle est plus court que 28 jours, soustraire la différence
  if (dureeCycle < 28) {
    dateAccouchement = dateAccouchement.subtract(Duration(days: 28 - dureeCycle));
  }
  /// Si le cycle est plus long que 28 jours, ajouter la différence
  else if (dureeCycle > 28) {
    dateAccouchement = dateAccouchement.add(Duration(days: dureeCycle - 28));
  }
  /// Retourner la date de l'accouchement
  return dateAccouchement;
}


