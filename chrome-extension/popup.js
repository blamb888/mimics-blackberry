function listenClick() {
  chrome.tabs.query({ title: "MimicsBlackberry" }, function (tabs) { // Finds the tab that is active in the current window
    console.log(tabs)
    chrome.tabs.sendMessage(tabs[0].id, 'getWhatever', (result) => {
      //popupDisplay
      // console.log(result.currentDay);
      document.getElementById("calendar-name").innerText = result.calendarName
      document.getElementById("current-date").innerText =`${result.monthName}-${result.currentDay}`
      //preparing form data
      const dayValue = result.dayValue
      const calendar_id = result.calendarId
      const user_id = result.userId
      console.log(result)
      const button = document.getElementById('send-data');
      button.addEventListener('click', (event) => {
        event.preventDefault()
        console.log(document)
        const title = document.querySelector('#name').value;
        // const day_number = document.querySelector('#day_number').value;
        const category = document.querySelector('#category').value;
        const private = document.querySelector('#private').value;
        const rich_description = document.querySelector('#rich_description').value;
        // const calendar_id = document.querySelector('#calendar_id').value;

        const url = `http://localhost:3000/calendars/${calendar_id}/events`;
        fetch(url, {
          method: 'POST',
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            "event": {
              "user_id": `${user_id}`,
              "calendar_id": `${calendar_id}`,
              // "day_number": `${day_number}`,
              "day_number": `${dayValue}`,
              "private": `${private}`,
              "category": `${category}`,
              "name": `${title}`,
              "rich_description": `${rich_description}`}
          })
        })
      })
    }); // Sends a message (object) to the first tab (tabs[0])
  });

}

listenClick();
