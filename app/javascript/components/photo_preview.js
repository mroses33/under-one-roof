const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}



const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    // set the content of the preview to be empty
    document.getElementById('image-preview').innerHTML = ""
    // convert the image list into an array and iterate
    Array.from(input.files).forEach((file, index) => {
      const reader = new FileReader();
      // find the preview element and insert an empty img tag
      document.getElementById('image-preview').insertAdjacentHTML("afterBegin", `<img src="" id="${index}_preview" class="preview-image-loaded">`)
      reader.onload = (event) => {
        // set the src of the img tag to the file
        document.getElementById(`${index}_preview`).src = event.currentTarget.result;
      }
      reader.readAsDataURL(file)
    })
  }
}
export { previewImageOnFileSelect };

