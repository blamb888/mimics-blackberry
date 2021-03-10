
const toggleEvent = () => {
  const checkBoxes = document.querySelectorAll(".event-box");
  checkBoxes.forEach((checkbox) => {
    checkbox.addEventListener("change", (event) => {
      checkBoxes.forEach((box) => {
        box.classList.remove("active-box")
      })
      event.currentTarget.classList.add("active-box")
    })
  })
}

export { toggleEvent };
