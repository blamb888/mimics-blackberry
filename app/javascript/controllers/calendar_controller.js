// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "day" ]

  connect() {
    // console.log(this.formTarget)
  }
  changeDay(event) {
    this.dayTargets.forEach(day=>{
      day.classList.remove("current-day")
    })
    event.currentTarget.classList.add("current-day")
    Rails.fire(event.currentTarget.querySelector(".current_day_form"), 'submit')
  }
}
