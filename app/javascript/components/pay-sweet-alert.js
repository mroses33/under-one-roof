import { initSweetalert } from "../plugins/init_sweetalert"

const paySweetAlert('#alert', {
  title: "Success",
  text: "Your payment was approved.",
  icon: "success"
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});

// I want to add a button to say ok, the button should then click the link to the next page, the one currently linked to in pay.html.erb

export { paySweetAlert }
