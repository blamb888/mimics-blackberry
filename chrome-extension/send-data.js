// script/send-data.js
function fetchData() {
  const title = document.querySelector('title').innerText;
  const url = window.location.href;

  return {
    title: title,
    url: url
  }
}

function sendData(data) {
  const url = 'https://mimics-blackberry.herokuapp.com/';
  fetch(url, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      // "author": "Mimic's Blackberry chrome extension",
      // "content": `I've found something cool: ${data.title} on ${data.url}`
    })
  })
}

sendData(fetchData());
