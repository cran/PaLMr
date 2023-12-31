% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getReferencePALM.R
\name{getReferencePALM}
\alias{getReferencePALM}
\title{Get references based on a query using the Google PaLM model.}
\usage{
getReferencePALM(
  palmParameter,
  inquery,
  sourceType = "articles",
  numSource = 5,
  citationStyle = "APA",
  sourceDate = "most recent",
  temperature = 0.7,
  maxOutputTokens = 1024,
  topP = 0.95,
  topK = 40,
  htUnspecified = "meda",
  htDerogatory = "meda",
  htToxicity = "meda",
  htViolence = "meda",
  htSexual = "meda",
  htMedical = "meda",
  htDangerous = "meda"
)
}
\arguments{
\item{palmParameter}{A character vector containing the API key, model version, and model type, as provided by Google.
The API key should be a 39-character string. Model version and type are specified by Google. See function `setupPALM()` for details.}

\item{inquery}{A character string representing the query for finding references. The length of the query should be between 1 and 8196 characters, inclusive.}

\item{sourceType}{A character string either "articles" or "websites" specifying the type of sources to search for (default: "articles").}

\item{numSource}{An integer value specifying the number of sources to retrieve (default: 5).}

\item{citationStyle}{A character string specifying the citation style for the references (default: "APA").}

\item{sourceDate}{A character string specifying the date range for the sources (default: "most recent").}

\item{temperature}{A numeric value between 0.0 and 1.0, inclusive (default: 0.7). Controls the randomness of the generated references.
A higher value (e.g., 0.9) results in more creative responses, while a lower value (e.g., 0.3) produces more straightforward references.}

\item{maxOutputTokens}{An integer value between 1 and 1024, inclusive (default: 1024). Specifies the maximum number of tokens to include in the generated references.}

\item{topP}{A numeric value between 0.0 and 1.0, inclusive (default: 0.95). Defines the maximum cumulative probability of tokens considered when sampling.
It controls the diversity of the references generated.}

\item{topK}{An integer value between 1 and 1,000,000, inclusive (default: 40). Sets the maximum number of tokens to consider when sampling.}

\item{htUnspecified}{Safety setting threshold for unspecified harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
Valid options include:

- "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)

- "lowa" (BLOCK_LOW_AND_ABOVE)

- "meda" (BLOCK_MEDIUM_AND_ABOVE)

- "high" (BLOCK_ONLY_HIGH)

- "none" (BLOCK_NONE)}

\item{htDerogatory}{Safety setting threshold for derogatory harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
Valid options include:

- "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)

- "lowa" (BLOCK_LOW_AND_ABOVE)

- "meda" (BLOCK_MEDIUM_AND_ABOVE)

- "high" (BLOCK_ONLY_HIGH)

- "none" (BLOCK_NONE)}

\item{htToxicity}{Safety setting threshold for toxicity harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
Valid options include:

- "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)

- "lowa" (BLOCK_LOW_AND_ABOVE)

- "meda" (BLOCK_MEDIUM_AND_ABOVE)

- "high" (BLOCK_ONLY_HIGH)

- "none" (BLOCK_NONE)}

\item{htViolence}{Safety setting threshold for violence harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
Valid options include:

- "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)

- "lowa" (BLOCK_LOW_AND_ABOVE)

- "meda" (BLOCK_MEDIUM_AND_ABOVE)

- "high" (BLOCK_ONLY_HIGH)

- "none" (BLOCK_NONE)}

\item{htSexual}{Safety setting threshold for sexual harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
Valid options include:

- "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)

- "lowa" (BLOCK_LOW_AND_ABOVE)

- "meda" (BLOCK_MEDIUM_AND_ABOVE)

- "high" (BLOCK_ONLY_HIGH)

- "none" (BLOCK_NONE)}

\item{htMedical}{Safety setting threshold for medical harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
Valid options include:

- "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)

- "lowa" (BLOCK_LOW_AND_ABOVE)

- "meda" (BLOCK_MEDIUM_AND_ABOVE)

- "high" (BLOCK_ONLY_HIGH)

- "none" (BLOCK_NONE)}

\item{htDangerous}{Safety setting threshold for dangerous harm. The default threshold is "meda." Refer to \href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}.
Valid options include:

- "unsp" (HARM_BLOCK_THRESHOLD_UNSPECIFIED)

- "lowa" (BLOCK_LOW_AND_ABOVE)

- "meda" (BLOCK_MEDIUM_AND_ABOVE)

- "high" (BLOCK_ONLY_HIGH)

- "none" (BLOCK_NONE)}
}
\value{
A character string containing the generated references based on the provided query and parameters.
}
\description{
This function sends a query to the Google PaLM model and generates a list of references based on the query. It allows customization of the
generated references and supports various citation styles and source types.
}
\details{
This function interacts with the Google PaLM model by sending a query to find references. It allows you to customize the generated
references by specifying the number of sources, citation style, source type, date range, and safety settings.

If the function is successful, it returns a character vector containing the generated references. If an error occurs during the
API request, it will stop execution and provide an error message.

The `palmParameter` argument should be a character vector with the API key, model version, and model type provided by Google.
You can obtain this information by following the instructions provided by Google for using the PaLM API.

The safety settings control the content's safety level based on different harm categories. Harm thresholds are specified as
per Google's guidelines and can be customized to control the content generated.

For more information on safety settings, harm categories, and harm thresholds, refer to the official Google PaLM API
documentation: \href{https://developers.generativeai.google/api/rest/generativelanguage/SafetySetting}{Safety Setting - Google PaLMr}
}
\examples{
\dontrun{
# Set up the PaLM parameters
# Replace your_api_key_here with the API key you get from Google
palmParameter <- c("your_api_key_here", "v1beta3", "text-bison-001")

# Get references based on a query

# Example 1
inquery <- "recurrent neural network"
print(getReferencePALM(palmParameter, inquery, temperature = 0.7,
                       sourceType = "articles", numSource = 3,
                       citationStyle = "APA", sourceDate = "most recent"))

# Example output:
# **1.** Greff, K., Srivastava, R. K., Bengio, S., & Schmidhuber, J. (2015).
#        LSTM: A search space odyssey. *arXiv preprint arXiv:1503.04069*.
#
# **2.** Hochreiter, S., & Schmidhuber, J. (1997). Long short-term memory.
#        *Neural computation*, 9(8), 1735-1780.
#
# **3.** Vaswani, A., Shazeer, N., Parmar, N., Uszkoreit, J., Jones, L., Gomez,
#        A. N., ... & Polosukhin, I. (2017). Attention is all you need.
#        *arXiv preprint arXiv:1706.03762*.

# Example 2
inquery <- "H5N1"
print(getReferencePALM(palmParameter, inquery, sourceType = "websites",
                       numSource = 8, citationStyle = "MLA",
                       sourceDate = "2019"))

# Example output:
# 1. **Source:** World Health Organization. "Avian Influenza (H5N1)."
#    Accessed March 8, 2019.
#    https://www.who.int/news-room/fact-sheets/detail/avian-influenza-(h5n1).
# 2. **Source:** Centers for Disease Control and Prevention. "H5N1 Avian Influenza."
#    Accessed March 8, 2019.
#    https://www.cdc.gov/flu/avian/h5n1-faq.htm.
# 3. **Source:** Food and Agriculture Organization of the United Nations. "Avian Influenza."
#    Accessed March 8, 2019.
#    http://www.fao.org/ag/againfo/topics/en/ai/.
# 4. **Source:** The European Commission. "Avian Influenza."
#    Accessed March 8, 2019.
#    https://ec.europa.eu/food/safety/animals/zoonoses/avian_influenza/index_en.htm.
# 5. **Source:** The World Organisation for Animal Health. "Avian Influenza."
#    Accessed March 8, 2019.
#    https://www.oie.int/en/diseases/avian/avian-influenza/.
# 6. **Source:** The National Avian Influenza Task Force. "Avian Influenza."
#    Accessed March 8, 2019.
#    https://www.avianinfluenza.us/.
# 7. **Source:** The American Veterinary Medical Association. "Avian Influenza."
#    Accessed March 8, 2019.
#    https://www.avma.org/resources/avma-policies/avian-influenza.
# 8. **Source:** The Poultry Health Institute. "Avian Influenza."
#    Accessed March 8, 2019.
#    https://www.phi.org/avian-influenza/.
}

}
\seealso{
\href{https://developers.generativeai.google/api/rest/generativelanguage/SafetySetting}{Safety Setting - Google PaLMr}

\href{https://developers.generativeai.google/api/rest/generativelanguage/HarmCategory}{HarmCategory - Google PaLMr}
}
