// script/send-data.js
function fetchData() {
  const title = document.querySelector('form').innerText;
  const content = window.location.href;

  return {
    title: title,
    url: url
  }
}

function sendData(data) {
  const url = 'https://mimics-blackberry.herokuapp.com/calendars/:calendar_id/events';
  fetch(url, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      "author": "Mimic's Blackberry chrome extension",
      "content": `I've found something cool: ${data.title} on ${data.content}`
    })
  })
}

sendData(fetchData());
