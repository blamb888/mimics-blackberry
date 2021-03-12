const toggleCopied = () => {
  const checkbox = document.querySelector(".link-icon");
  //console.log(checkbox)
  if (checkbox) {
      checkbox.addEventListener("click", (event) => {
      event.currentTarget.classList.remove("fa-link")
      event.currentTarget.classList.add("fa-clipboard-check")
    })
  }
    
}

export { toggleCopied };