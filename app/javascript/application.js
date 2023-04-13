// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "jquery_ujs"
import "./jquery_ui"
import sortable from "./html.sortable"
import "popper"
import "bootstrap"
import "@nathanvda/cocoon"

const ready = () => {
    const sortee = document.querySelector('.sortable');
    return sortable(sortee);
}

$(function () {
    ready();
});