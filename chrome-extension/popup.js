function listenClick() {
  const button = document.getElementById('send-data');
  button.addEventListener('click', (event) => {
    event.preventDefault()
    console.log(document)
    const title = document.querySelector('#name').value;
    const day_number = document.querySelector('#day_number').value;
    const category = document.querySelector('#category').value;
    const private = document.querySelector('#private').value;
    const rich_description = document.querySelector('#rich_description').value;
    const calendar_id = document.querySelector('#calendar_id').value;
    // const calendar_day = document.querySelector('#calendar_day').innerText;
    //  return {
    //   calendar_id: calendar_id,
    //   day_number: day_number,
    //   title: title,
    //   private: private,
    //   category: category,
    //   name: title,
    //   rich_description: rich_description,
    // }
    const url = `http://localhost:3000/calendars/${calendar_id}/events`;
    fetch(url, {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        "event": {
          "calendar_id": `${calendar_id}`,
          "day_number": `${day_number}`,
          "private": `${private}`,
          "category": `${category}`,
          "name": `${title}`,
          "rich_description": `${rich_description}`}
      })
    })
  })
}

listenClick();
