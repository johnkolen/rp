import { Controller } from "@hotwired/stimulus"

console.log("loading hello");

export default class extends Controller {
  connect() {
    //this.element.textContent = "Hello World!"
    console.log("hello controller connected")
  }
  hit() {
    console.log("hit")
  }
}
