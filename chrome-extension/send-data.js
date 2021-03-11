// script/send-data.js
function fetchData() {
  // const title = document.querySelector('#name').innerText;
  // console.log(document)
  // const content = document.querySelector('#rich_description').value;
  // const calendar_id = document.querySelector('#calendar_id').innerText;
  // const calendar_day = document.querySelector('#calendar_day').innerText;

  // chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) { // Finds the tab that is active in the current window
  //   chrome.tabs.sendMessage(tabs[0].id, 'getWhatever'); // Sends a message (object) to the first tab (tabs[0])
  // });

  return {
    // title: title,
    content: content,
    calendar_id: calendar_id,
    calendar_day: calendar_day,

  }
}

function sendData(data) {
  console.log(data)
  const url = `http://localhost:3000/calendars/${data.calendar_id}/events`;
  fetch(url, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      "event[name]": `${data.title}`,
      "event[rich_description]": `${data.content}`,
      "event[day_number]": `${data.calendar_day}`
    })
  })
}

sendData(fetchData());
