import 'package:pmassignment/model/question_model.dart';

List<QuestionModel> atmosphericQuestions = [
  QuestionModel(
    "At what concentration (in ppm), is nitrogen present in the atmosphere?",
    {
      "900,000": false,
      "78,084": false,
      "390,420": false,
      "780,840": true,
    },
  ),
  QuestionModel(
      "In the lower layers of atmosphere, what range of wavelengths of light is predominant?",
      {
        "> 300 nm": true,
        "< 100 nm": false,
        "> 100 & < 300 nm": false,
        "All are equal": false,
      }),
  QuestionModel(
      "What does the ratio of the mass of water vapour to mass of air indicate?",
      {
        "Absolute humidity": false,
        "Specific humidity": true,
        "Relative humidity": false,
        "Approximate humidity": false,
      }),
  QuestionModel(
      "What is the region of mild and irregular wind in the equatorial region known as?",
      {
        "Trade winds": false,
        "Westerlies": false,
        "Doldrums": true,
        "Easterlies": false,
      }),
  QuestionModel(
      "Which layer of the atmosphere is responsible for aurora formation?", {
    "Ionosphere": true,
    "Ozone layer": false,
    "Stratosphere": false,
    "Exosphere": false,
  }),
  QuestionModel(
      "Which of the following mentioned layers is NOT a homosphere?", {
    "Troposphere": false,
    "Ionosphere": false,
    "Exosphere": true,
    "Mesosphere": false,
  }),
  QuestionModel(
      "The planetary boundary layer belongs to which of the following atmospheric layers?",
      {
        "Exosphere": false,
        "Ionosphere": false,
        "Stratosphere": false,
        "None": true,
      }),
  QuestionModel("What is the atmospheric pressure at sea level?", {
    "101325 Pa": false,
    "14.696 psi": false,
    "760 Torr": true,
    "All of the above": false,
  }),
  QuestionModel(
      "By international convention, which line marks the outermost boundary of the Earth’s atmosphere?",
      {
        "Astronaut line": false,
        "Boundary line": false,
        "Karman line": true,
        "Space line": false,
      }),
  QuestionModel(
      "Photocemical smogreslts from the interactio of pollutants in the presence f",
      {
        "water vapor": false,
        "oxygen": false,
        "sunlight": true,
        "rainfall": false,
      }),
];
