import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["button"]
  static classes = ["primary"]

  clicked() {
    console.log('copy');
    const text = window.location.href;
    console.log(text);
    const elem = document.createElement('textarea');
    elem.value = text;
    document.body.appendChild(elem);
    elem.select();
    document.execCommand('copy');
    document.body.removeChild(elem);
  }
}