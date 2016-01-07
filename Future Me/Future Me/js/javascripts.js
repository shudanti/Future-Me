function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
}

function onLoad() {
    gapi.load('auth2', function () {
        gapi.auth2.init();
    });
}
function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    var id_token = googleUser.getAuthResponse().id_token;
    var email = profile.getEmail();

    var url = "googleSignIn"; // the script where you handle the form input.
    $(this).find('input[type="submit"]').attr("disabled", true);
    $('#Button2').attr("disabled", true);
    $.ajax({
        type: "POST",
        url: url,
        data: { Email: email, Password: id_token }, // serializes the form's elements.
        success: function (data) {
            $.ajax({
                type: "POST",
                url: "signinprocess.aspx",
                data: { Email: data.Email, ID: data.ID }, // serializes the form's elements.
                success: function (data) {
                    window.location.href = "index.aspx";
                }
            });
            //alert("Sign in succeed!"); // show response from the php script.
        },
        error: function (error) {
            alert("Sign in failed!");
            $("#Button1").attr("disabled", false);
            $('#Button2').attr("disabled", false);
        }
    });

    e.preventDefault(); // avoid to execute the actual submit of the form.
}