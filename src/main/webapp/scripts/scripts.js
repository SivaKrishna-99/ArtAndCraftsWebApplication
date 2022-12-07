window.addEventListener("load", function() {
    // Get the navigation links
    var navLinks = document.querySelectorAll("nav a");

    // Add a click event listener to each link
    navLinks.forEach(function(link) {
        link.addEventListener("click", function(event) {
            // Prevent the default link behavior
            event.preventDefault();

            // Show an alert message when the link is clicked
            alert("You clicked the " + link.innerText + " link!");
        });
    });
});
