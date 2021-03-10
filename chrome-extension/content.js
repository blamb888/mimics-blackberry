chrome.runtime.onMessage.addListener(
  function (request, sender, sendResponse) {
    // actions based on the request (which corresponds to the object we sent in our message)
    if (request === 'getWhatever') {
      // Get the stuff you want from the page `result`
      const currentDay = document.querySelector(".current-day div").innerText
      const result = document.getElementById("calendar-container").dataset
      const dayValue = document.getElementById("chrome-variable").dataset
      console.log(dayValue.currentDay)
      sendResponse({
        currentDay: result.currentDay,
        calendarId: result.calendarId,
        userId: result.userId,
        calendarName: result.calendarName,
        monthName: result.monthName,
        currentDay: currentDay,
        dayValue: dayValue.currentDay
      })
    }
  }
);
