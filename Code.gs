function onOpen() {
  var ui = SpreadsheetApp.getUi();
  ui.createMenu('Hunter.io')
    .addItem('Saisir la clé API', 'showApiKeyDialog')
    .addToUi();
}

function getApiKey() {
  return PropertiesService.getUserProperties().getProperty('HUNTER_API_KEY');
}

function showApiKeyDialog() {
  var html = HtmlService.createHtmlOutputFromFile('ApiKeyDialog')
    .setWidth(500)
    .setHeight(400);
  SpreadsheetApp.getUi().showModalDialog(html, 'Saisir la clé API');
}

function saveApiKey(apiKey) {
  PropertiesService.getUserProperties().setProperty('HUNTER_API_KEY', apiKey);
}

function fetchEmailFromHunter(firstName, lastName, companyName, companyWebsite, apiKey) {
  var url = `https://api.hunter.io/v2/email-finder?company=${encodeURIComponent(companyName)}&domain=${encodeURIComponent(companyWebsite)}&first_name=${encodeURIComponent(firstName)}&last_name=${encodeURIComponent(lastName)}&api_key=${apiKey}`;
  var response = UrlFetchApp.fetch(url);
  return JSON.parse(response.getContentText());
}

function findEmail(firstName, lastName, companyName, companyWebsite) {
  var apiKey = getApiKey();
  if (!apiKey) {
    return 'API key not set';
  }
  try {
    var result = fetchEmailFromHunter(firstName, lastName, companyName, companyWebsite, apiKey);
    if (result.data && result.data.email) {
      return result.data.email;
    } else {
      return result.errors ? result.errors[0].details : 'Email not found';
    }
  } catch (e) {
    return 'Error: ' + e.message;
  }
}
