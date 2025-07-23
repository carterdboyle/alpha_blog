import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Auto-register all Stimulus controllers in this folder
const context = require.context(".", true, /_controller\.js$/)
context.keys().forEach((filename) => {
  if (filename === "./index.js") return
  const controller = context(filename).default
  if (controller) {
    const identifier = filename
      .replace(/^\.\/(.*)_controller\.js$/, "$1")
      .replace(/\//g, "--")
    application.register(identifier, controller)
  }
})
