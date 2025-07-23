import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["selector", "selected"]

  connect() {
    console.log("connected asset_select_controller")
  }

  change() {
    console.log("selector " + this.selectorTarget.value)
  }
}
