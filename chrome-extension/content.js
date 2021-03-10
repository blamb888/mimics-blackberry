chrome.runtime.onMessage.addListener(
  function (request, sender, sendResponse) {
    // actions based on the request (which corresponds to the object we sent in our message)
    if (request === 'getWhatever') {
      // Get the stuff you want from the page `result`
      sendResponse(result)
    }
  }
);
