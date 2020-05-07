const previewAvatarOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('avatar-input');
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
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('avatar-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('avatar-preview').classList.remove('hidden');
    document.getElementById('file-name').classList.remove('hidden');
    document.getElementById('file-name').innerHTML = input.files[0].name;
  }
}

export { previewAvatarOnFileSelect };
