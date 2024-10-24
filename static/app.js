function escapeHtml(text) {
  var entities = {
    "&": "&amp;",
    "<": "&lt;",
    ">": "&gt;",
    '"': "&quot;",
    "'": "&apos;"
  };

  return text.replace(/[&<>"']/g, function (match) {
    return entities[match];
  });
}

function sendEmail() {
  var recipient = "dtissot@free.fr";
  var subject = "[CV][WEB-APP] Contact";
  var body = document.getElementById("email_message").value;;

  var email = document.createElement("a");
  email.href = "mailto:" + recipient + "?subject=" + subject + "&body=" + escapeHtml(body);
  console.log(escapeHtml(body));
  email.target = "_blank";
  email.click();
}

function openLightbox_gitlab() {
  var Lightbox_gitlab = document.getElementById("lightbox_gitlab");
  var image_gitlab = document.getElementById("gitlab");

  Lightbox_gitlab.style.display = "block";
  image_gitlab.style.display = "none";
}

function closeLightbox_gitlab() {
  var Lightbox_gitlab = document.getElementById("lightbox_gitlab");
  var image_gitlab = document.getElementById("gitlab");

  Lightbox_gitlab.style.display = "none";
  image_gitlab.style.display = "block";
}

function openLightbox_opengrok() {
  var Lightbox_opengrok = document.getElementById("lightbox_opengrok");
  var image_opengrok = document.getElementById("opengrok");

  Lightbox_opengrok.style.display = "block";
  image_opengrok.style.display = "none";
}

function closeLightbox_opengrok() {
  var Lightbox_opengrok = document.getElementById("lightbox_opengrok");
  var image_opengrok = document.getElementById("opengrok");

  Lightbox_opengrok.style.display = "none";
  image_opengrok.style.display = "block";
}
