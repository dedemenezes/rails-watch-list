const showForm = () => {
  const btn = document.getElementById('show-bookmark');
  btn.addEventListener('click', (event) => {
    document.getElementById('target-bookmark').style.display = null
  });
};
export { showForm }