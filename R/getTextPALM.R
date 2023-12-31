#' Generate text using the Google PaLM model based on a query.
#'
#' This function sends a query to the Google PaLM model and generates text as a response. It allows customization of the
#' generated text using various parameters.
#'
#' @param palmParameter A character vector containing the API key, model version, and model type, as provided by Google.
#'   The API key should be a 39-character string. Model version and type are specified by Google. See function `setupPALM()` for detail.
#' @param inquery A character string representing the query or prompt for text generation. The length of the query should
#'   be between 1 and 8196 characters, inclusive.
#' @param temperature A numeric value between 0.0 and 1.0, inclusive (default: 0.7). Controls the randomness of the generated text.
#'   A higher value (e.g., 0.9) results in more creative responses, while a lower value (e.g., 0.3) produces more
#'   straightforward text.
#' @param maxOutputTokens An integer value between 1 and 1024, inclusive (default: 1024). Specifies the maximum number of tokens to
#'   include in the generated text.
#' @param topP A numeric value between 0.0 and 1.0, inclusive (default: 0.95). Defines the maximum cumulative probability of tokens
#'   considered when sampling. It controls the diversity of the text generated.
#' @param topK An integer value between 1 and 1,000,000, inclusive (default: 40). Sets the maximum number of tokens to consider
#'   when sampling.
#' @param htUnspecified Safety setting threshold for unspecified harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
#' Valid options include:
#'
#' - "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)
#'
#' - "lowa" (BLOCK_LOW_AND_ABOVE)
#'
#' - "meda" (BLOCK_MEDIUM_AND_ABOVE)
#'
#' - "high" (BLOCK_ONLY_HIGH)
#'
#' - "none" (BLOCK_NONE)
#'
#' @param htDerogatory Safety setting threshold for derogatory harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
#' Valid options include:
#'
#' - "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)
#'
#' - "lowa" (BLOCK_LOW_AND_ABOVE)
#'
#' - "meda" (BLOCK_MEDIUM_AND_ABOVE)
#'
#' - "high" (BLOCK_ONLY_HIGH)
#'
#' - "none" (BLOCK_NONE)
#'
#' @param htToxicity Safety setting threshold for toxicity harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
#' Valid options include:
#'
#' - "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)
#'
#' - "lowa" (BLOCK_LOW_AND_ABOVE)
#'
#' - "meda" (BLOCK_MEDIUM_AND_ABOVE)
#'
#' - "high" (BLOCK_ONLY_HIGH)
#'
#' - "none" (BLOCK_NONE)
#'
#' @param htViolence Safety setting threshold for violence harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
#' Valid options include:
#'
#' - "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)
#'
#' - "lowa" (BLOCK_LOW_AND_ABOVE)
#'
#' - "meda" (BLOCK_MEDIUM_AND_ABOVE)
#'
#' - "high" (BLOCK_ONLY_HIGH)
#'
#' - "none" (BLOCK_NONE)
#'
#' @param htSexual Safety setting threshold for sexual harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
#' Valid options include:
#'
#' - "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)
#'
#' - "lowa" (BLOCK_LOW_AND_ABOVE)
#'
#' - "meda" (BLOCK_MEDIUM_AND_ABOVE)
#'
#' - "high" (BLOCK_ONLY_HIGH)
#'
#' - "none" (BLOCK_NONE)
#'
#' @param htMedical Safety setting threshold for medical harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
#' Valid options include:
#'
#' - "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)
#'
#' - "lowa" (BLOCK_LOW_AND_ABOVE)
#'
#' - "meda" (BLOCK_MEDIUM_AND_ABOVE)
#'
#' - "high" (BLOCK_ONLY_HIGH)
#'
#' - "none" (BLOCK_NONE)
#'
#' @param htDangerous Safety setting threshold for dangerous harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
#' Valid options include:
#'
#' - "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)
#'
#' - "lowa" (BLOCK_LOW_AND_ABOVE)
#'
#' - "meda" (BLOCK_MEDIUM_AND_ABOVE)
#'
#' - "high" (BLOCK_ONLY_HIGH)
#'
#' - "none" (BLOCK_NONE)
#'
#'
#' @return A character string generated by the Google PaLM API based on the provided query and parameters.
#'
#' @details
#' This function interacts with the Google PaLM model by sending a query using the specified parameters. It allows you
#' to customize the generated text by adjusting the `temperature`, `maxOutputTokens`, `topP`, `topK`, and safety settings.
#'
#' If the function is successful, it returns a character string containing the generated text. If an error occurs during
#' the API request, it will stop execution and provide an error message.
#'
#' The `palmParameter` argument should be a character vector with the API key, model version, and model type provided by
#' Google. You can obtain this information by following the instructions provided by Google for using the PaLM API.
#'
#' The safety settings control the content's safety level based on different harm categories. Harm thresholds are
#' specified as per Google's guidelines and can be customized to control the content generated.
#'
#' For more information on safety settings, harm categories, and harm thresholds, refer to the official Google PaLM API
#' documentation: \href{https://developers.generativeai.google/api/rest/generativelanguage/SafetySetting}{Safety Setting - Google PaLMr}
#'
#' @examples
#' \dontrun{
#' # Set up the PaLM parameters
#' # Replace your_api_key_here with the API key you get from Google
#' palmParameter <- c("your_api_key_here", "v1beta3", "text-bison-001")
#'
#' # Generate text based on a query
#'
#' # Example 1
#' inquery <- "Write a short fiction about Mars."
#' print(getTextPALM(palmParameter, inquery, temperature = 0.7,
#'                   maxOutputTokens = 100, topP = 0.95, topK = 40))
#'
#' # The output character string may look like this if successful:
#' # "The year is 2042. Humanity has finally reached Mars, and the first human
#' # colony is being established. The colonists are a diverse group of people
#' # from all over the world, and they are all eager to start a new life on the
#' # Red Planet.
#' #
#' # The colony is located in a small valley near the equator. The climate is
#' # mild, and the soil is fertile. The colonists have brought with them everything
#' # they need to survive, including food, water, and shelter. They have also
#' # brought with them their hopes and dreams for the future."
#'
#' # Example 2
#' inquery <- "What is linear regression?"
#' print(getTextPALM(palmParameter, inquery))
#'
#' # The output character string may look like this if successful:
#' # "Linear regression is a statistical method that is used to predict the
#' # value of a dependent variable based on the values of one or more
#' # independent variables. The dependent variable is the variable that you are
#' # trying to predict, and the independent variables are the variables that
#' # you are using to make the prediction."
#' }
#'
#' @seealso
#' \href{https://developers.generativeai.google/api/rest/generativelanguage/SafetySetting}{Safety Setting - Google PaLMr}
#'
#' \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}
#'
#' @export
#'
#' @importFrom PaLMr checkModelSelection
#' @importFrom PaLMr generateSafetySettings
#' @importFrom PaLMr generateOutput
getTextPALM = function(palmParameter, inquery, temperature = 0.7,
                       maxOutputTokens = 1024, topP = 0.95, topK = 40,
                       htUnspecified = "meda",
                       htDerogatory = "meda",
                       htToxicity = "meda",
                       htViolence = "meda",
                       htSexual = "meda",
                       htMedical = "meda",
                       htDangerous = "meda") {
  checkModelSelection(palmParameter[2], palmParameter[3])

  # Define the API URL
  apiURL = paste0("https://generativelanguage.googleapis.com/",
                  palmParameter[2],
                  "/models/", palmParameter[3],
                  ":generateText?key=", palmParameter[1])

  # Create the request body as a JSON object
  inquery = gsub('"', '\\"', inquery)
  requestBody = list(
    prompt = list(
      text = inquery
    ),
    safetySettings = generateSafetySettings(htUnspecified, htDerogatory, htToxicity,
                                            htViolence, htSexual, htMedical, htDangerous),
    temperature = temperature,
    maxOutputTokens = as.integer(maxOutputTokens),
    topP = topP,
    topK = as.integer(topK)
  )

  # Convert the request body to JSON
  requestBodyJSON = jsonlite::toJSON(requestBody, auto_unbox = TRUE)

  # Get response from the API
  response = httr::POST(url = apiURL,
                        body = requestBodyJSON,
                        httr::add_headers("Content-Type" = "application/json"))
  responseJSON = httr::content(response, "parsed")

  # Generate output
  generateOutput(responseJSON)
}
