const sidemenu = document.getElementById("sidemenu"); 
const sidemenuBackdrop = document.querySelector("#sidemenu + .backdrop");
const tablinks = document.getElementsByClassName("tab-links");
const tabcontents = document.getElementsByClassName("tab-content");
const loadingModal = document.querySelector(".loading-modal");
const snackbar = document.querySelector("#snackbar");
const snackbarContent = snackbar.querySelector(".text");
const form = document.forms["submit-to-google-sheet"];
const msg = document.getElementById("msg");


(function() {
  emailjs.init("t_pkVwCfuD3WreXUr");
})();


function opentab(event, tabname) {
  Array.from(tablinks).forEach(function(tablink) {
    tablink.classList.remove("active-link");
  });
  Array.from(tabcontents).forEach(function(tabcontent) {
    tabcontent.classList.remove("active-tab");
  });
  event.currentTarget.classList.add("active-link");
  document.getElementById(tabname).classList.add("active-tab");
}

function openmenu() {
  sidemenu.classList.add("open");
}

function closemenu() {
  sidemenu.classList.remove("open");
}

function showSnackbar(text) {
  snackbar.classList.add("open");
  snackbarContent.textContent = text;
  setTimeout(function() {
    snackbar.classList.remove("open");
  }, 2000);
}

form.addEventListener("submit", function(e) {
  e.preventDefault();
  loadingModal.classList.add("open");

  const formData = {
    name: form.elements["name"].value,
    email: form.elements["email"].value,
    message: form.elements["message"].value,
  };

  emailjs.send("service_expense", "template_ybe6h8q", formData)
    .then(function() {
      showSnackbar("Message Sent Successfully");
      form.reset();
    })
    .catch(function(error) {
      showSnackbar("Something went wrong");
      console.error(error);
    })
    .finally(function() {
      loadingModal.classList.remove("open");
    });
});
