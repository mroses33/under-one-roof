import { initSweetalert } from "../plugins/init_sweetalert"

const deleteSweetAlert = () => {
  document.querySelectorAll('.sweetalert').forEach(deleteButton => {
    console.log(deleteButton);
    initSweetalert("#"+ deleteButton.id, {
        title: "Are you sure you want to delete this experience?",
        text: "This action cannot be reversed. All current bookings will be cancelled.",
        icon: "warning",
        buttons: true,
        dangerMode: true,
        closeModal: false,
      }, (value) => {
        if (value) {
          console.log(value);
          const link = document.querySelector('#'+deleteButton.id +"-delete");
          console.log(link);
          link.click();
          swal(" Your experience was deleted!", {
            icon: "success",
          });
        }
      });
    });
};




export { deleteSweetAlert }
